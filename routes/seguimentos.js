const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

// POST /api/seguimentos  — registra um seguimento (Aba 4)
router.post('/', async (req, res) => {
    const {
        id_paciente,
        id_consulta_origem,       // nullable — liga ao plano de cuidado da consulta anterior
        modalidade,               // 'telefonico' | 'presencial'
        momento_seguimento,
        ciclo_referencia,
        enfermeiro_oncologista,
        mini_triagem_resumo,
        conduta_realizada,
        efetividade,
        necessita_novo_seguimento,
        texto_copiavel_prontuario,
        sintomas,                 // [{ tipo_sintoma, grau_ctcae, melhorou_manteve_piorou, observacao }]
        created_by_user_name
    } = req.body;

    if (!id_paciente) return res.status(400).json({ erro: 'id_paciente obrigatório.' });

    // created_by_user_name tem precedência; enfermeiro_oncologista é fallback legado
    const autorNome = created_by_user_name || enfermeiro_oncologista || null;

    const client = await pool.connect();
    try {
        await client.query('BEGIN');

        // 1. Insere o seguimento
        const seg = await client.query(
            `INSERT INTO seguimentos_enfermagem
                (id_paciente, id_consulta_origem, modalidade, momento_seguimento,
                 ciclo_referencia, enfermeiro_oncologista, created_by_user_name,
                 mini_triagem_resumo, conduta_realizada, efetividade,
                 necessita_novo_seguimento, texto_copiavel_prontuario, status_seguimento)
             VALUES ($1,$2,$3,$4,$5,$6,$6,$7,$8,$9,$10,$11,'concluido')
             RETURNING id_seguimento, created_at`,
            [id_paciente, id_consulta_origem ?? null, modalidade, momento_seguimento,
             ciclo_referencia, autorNome,
             mini_triagem_resumo, conduta_realizada, efetividade,
             necessita_novo_seguimento ?? false, texto_copiavel_prontuario]
        );
        const { id_seguimento } = seg.rows[0];

        // 2. Mini-triagem de sintomas
        if (Array.isArray(sintomas)) {
            for (const s of sintomas) {
                await client.query(
                    `INSERT INTO seguimento_sintomas
                        (id_seguimento, tipo_sintoma, grau_ctcae, melhorou_manteve_piorou, observacao)
                     VALUES ($1, $2, $3, $4, $5)`,
                    [id_seguimento, s.tipo_sintoma, s.grau_ctcae, s.melhorou_manteve_piorou ?? null, s.observacao ?? null]
                );
            }
        }

        // 3. Se necessita novo seguimento, fecha plano anterior como cumprido
        if (id_consulta_origem) {
            await client.query(
                `UPDATE planos_seguimento SET status = 'concluido'
                 WHERE id_consulta = $1 AND status = 'pendente'`,
                [id_consulta_origem]
            );
        }

        await client.query('COMMIT');
        res.status(201).json({ id_seguimento, ...seg.rows[0] });
    } catch (err) {
        await client.query('ROLLBACK');
        console.error('[seguimentos.post]', err.message);
        res.status(500).json({ erro: 'Erro ao registrar seguimento.' });
    } finally {
        client.release();
    }
});

// GET /api/seguimentos/paciente/:id_paciente  — histórico do paciente
router.get('/paciente/:id_paciente', async (req, res) => {
    try {
        const result = await pool.query(
            `SELECT s.*,
                    (SELECT json_agg(ss) FROM seguimento_sintomas ss WHERE ss.id_seguimento = s.id_seguimento) AS sintomas
             FROM   seguimentos_enfermagem s
             WHERE  s.id_paciente = $1
             ORDER  BY s.created_at DESC`,
            [req.params.id_paciente]
        );
        res.json(result.rows);
    } catch (err) {
        console.error('[seguimentos.historico]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar histórico de seguimentos.' });
    }
});

module.exports = router;
