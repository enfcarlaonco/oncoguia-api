const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

// POST /api/consultas  — abre uma nova consulta (Aba 1 → 2)
router.post('/', async (req, res) => {
    const {
        id_paciente, tipo_consulta, enfermeiro_oncologista,
        ecog, peso_kg, altura_cm, superficie_corporal,
        medicamentos_uso, suporte_social,
        condicao_nutricional_autorreferida, perda_peso_30_dias,
        toxicidade_grave_ciclo_anterior, internacao_nao_planejada_30_dias,
        ida_pa_30_dias, protocolo_alta_toxicidade,
        neutropenia_previa_documentada, paciente_idoso_ou_pediatrico,
        mora_sozinho_ou_sem_cuidador, dificuldade_acesso_servico
    } = req.body;

    if (!id_paciente) return res.status(400).json({ erro: 'id_paciente obrigatório.' });

    try {
        const result = await pool.query(
            `INSERT INTO consultas_enfermagem
                (id_paciente, tipo_consulta, enfermeiro_oncologista,
                 ecog, peso_kg, altura_cm, superficie_corporal,
                 medicamentos_uso, suporte_social,
                 condicao_nutricional_autorreferida, perda_peso_30_dias,
                 toxicidade_grave_ciclo_anterior, internacao_nao_planejada_30_dias,
                 ida_pa_30_dias, protocolo_alta_toxicidade,
                 neutropenia_previa_documentada, paciente_idoso_ou_pediatrico,
                 mora_sozinho_ou_sem_cuidador, dificuldade_acesso_servico,
                 status_consulta)
             VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19,'rascunho')
             RETURNING id_consulta, data_hora`,
            [id_paciente, tipo_consulta, enfermeiro_oncologista,
             ecog, peso_kg, altura_cm, superficie_corporal,
             medicamentos_uso, suporte_social,
             condicao_nutricional_autorreferida, perda_peso_30_dias,
             toxicidade_grave_ciclo_anterior, internacao_nao_planejada_30_dias,
             ida_pa_30_dias, protocolo_alta_toxicidade,
             neutropenia_previa_documentada, paciente_idoso_ou_pediatrico,
             mora_sozinho_ou_sem_cuidador, dificuldade_acesso_servico]
        );
        res.status(201).json(result.rows[0]);
    } catch (err) {
        console.error('[consultas.post]', err.message);
        res.status(500).json({ erro: 'Erro ao criar consulta.' });
    }
});

// PUT /api/consultas/:id/sintomas  — salva triagem CTCAE (Aba 2)
router.put('/:id/sintomas', async (req, res) => {
    const { id } = req.params;
    const { sintomas, classificacao_risco_automatica, updated_by_user_name } = req.body;
    // sintomas: [{ tipo_sintoma, grau_ctcae, alerta_risco, observacao }]

    if (!Array.isArray(sintomas))
        return res.status(400).json({ erro: 'sintomas deve ser um array.' });
    if (!updated_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });

    const client = await pool.connect();
    try {
        await client.query('BEGIN');
        // Apaga sintomas anteriores (permite reedição durante rascunho)
        await client.query(
            'DELETE FROM consulta_sintomas_ctcae WHERE id_consulta = $1', [id]
        );
        for (const s of sintomas) {
            await client.query(
                `INSERT INTO consulta_sintomas_ctcae
                    (id_consulta, tipo_sintoma, grau_ctcae, alerta_risco, observacao)
                 VALUES ($1, $2, $3, $4, $5)`,
                [id, s.tipo_sintoma, s.grau_ctcae, s.alerta_risco ?? false, s.observacao ?? null]
            );
        }
        // Atualiza classificação automática e autoria da edição
        await client.query(
            `UPDATE consultas_enfermagem
             SET classificacao_risco_automatica = COALESCE($1, classificacao_risco_automatica),
                 updated_by_user_name           = COALESCE($3, updated_by_user_name),
                 updated_at                     = NOW()
             WHERE id_consulta = $2`,
            [classificacao_risco_automatica ?? null, id, updated_by_user_name ?? null]
        );
        await client.query('COMMIT');
        res.json({ ok: true, registros: sintomas.length });
    } catch (err) {
        await client.query('ROLLBACK');
        console.error('[consultas.sintomas]', err.message);
        res.status(500).json({ erro: 'Erro ao salvar sintomas.' });
    } finally {
        client.release();
    }
});

// PUT /api/consultas/:id/plano  — salva diagnósticos NANDA + NIC + NOC (Aba 3)
router.put('/:id/plano', async (req, res) => {
    const { id } = req.params;
    const { diagnosticos, intervencoes, resultados_esperados, updated_by_user_name } = req.body;
    // diagnosticos: [{ codigo_nanda, dx_id_lc, prioridade, origem }]
    // intervencoes: [{ codigo_nic, nic_id_lc, tipo_intervencao, executada_na_consulta }]
    // resultados_esperados: [{ codigo_noc, noc_id_lc, criterio_avaliacao_personalizado }]

    if (!updated_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });

    const client = await pool.connect();
    try {
        await client.query('BEGIN');

        if (Array.isArray(diagnosticos)) {
            await client.query('DELETE FROM consulta_diagnosticos WHERE id_consulta = $1', [id]);
            for (const d of diagnosticos) {
                await client.query(
                    `INSERT INTO consulta_diagnosticos (id_consulta, codigo_nanda, dx_id_lc, prioridade, origem)
                     VALUES ($1, $2, $3, $4, $5)`,
                    [id, d.codigo_nanda, d.dx_id_lc, d.prioridade ?? 1, d.origem ?? 'selecionado']
                );
            }
        }

        if (Array.isArray(intervencoes)) {
            await client.query('DELETE FROM consulta_intervencoes WHERE id_consulta = $1', [id]);
            for (const n of intervencoes) {
                await client.query(
                    `INSERT INTO consulta_intervencoes (id_consulta, codigo_nic, nic_id_lc, tipo_intervencao, executada_na_consulta)
                     VALUES ($1, $2, $3, $4, $5)`,
                    [id, n.codigo_nic, n.nic_id_lc, n.tipo_intervencao ?? 'profissional', n.executada_na_consulta ?? false]
                );
            }
        }

        if (Array.isArray(resultados_esperados)) {
            await client.query('DELETE FROM consulta_resultados_esperados WHERE id_consulta = $1', [id]);
            for (const r of resultados_esperados) {
                await client.query(
                    `INSERT INTO consulta_resultados_esperados (id_consulta, codigo_noc, noc_id_lc, criterio_avaliacao_personalizado)
                     VALUES ($1, $2, $3, $4)`,
                    [id, r.codigo_noc, r.noc_id_lc, r.criterio_avaliacao_personalizado ?? null]
                );
            }
        }

        await client.query(
            `UPDATE consultas_enfermagem
             SET updated_by_user_name = COALESCE($1, updated_by_user_name),
                 updated_at           = NOW()
             WHERE id_consulta = $2`,
            [updated_by_user_name, id]
        );

        await client.query('COMMIT');
        res.json({ ok: true });
    } catch (err) {
        await client.query('ROLLBACK');
        console.error('[consultas.plano]', err.message);
        res.status(500).json({ erro: 'Erro ao salvar plano de cuidado.' });
    } finally {
        client.release();
    }
});

// POST /api/consultas/:id/concluir  — conclui a consulta, gera tarefa e texto (Aba "Concluir")
router.post('/:id/concluir', async (req, res) => {
    const { id } = req.params;
    const {
        classificacao_risco_validada,
        resumo_clinico,
        plano_cuidado_resumido,
        conduta_seguimento_definida,
        texto_copiavel_prontuario,
        // Para gerar tarefa automática:
        tipo_tarefa,
        data_prevista_tarefa,
        prioridade_tarefa,
        responsavel,
        completed_by_user_name
    } = req.body;

    const client = await pool.connect();
    try {
        await client.query('BEGIN');

        // 1. Conclui a consulta
        const upd = await client.query(
            `UPDATE consultas_enfermagem SET
                classificacao_risco_validada = $1,
                resumo_clinico               = $2,
                plano_cuidado_resumido       = $3,
                conduta_seguimento_definida  = $4,
                texto_copiavel_prontuario    = $5,
                gerou_tarefa                 = $6,
                status_consulta              = 'concluida',
                completed_by_user_name       = $8,
                completed_at                 = NOW(),
                updated_at                   = NOW()
             WHERE id_consulta = $7
             RETURNING id_paciente`,
            [classificacao_risco_validada, resumo_clinico, plano_cuidado_resumido,
             conduta_seguimento_definida, texto_copiavel_prontuario,
             !!tipo_tarefa, id, completed_by_user_name ?? null]
        );
        if (upd.rowCount === 0) {
            await client.query('ROLLBACK');
            return res.status(404).json({ erro: 'Consulta não encontrada.' });
        }
        const { id_paciente } = upd.rows[0];

        // 2. Gera tarefa automaticamente se houver conduta de seguimento
        let id_tarefa = null;
        if (tipo_tarefa && id_paciente) {
            const tarefa = await client.query(
                `INSERT INTO tarefas_assistenciais
                    (id_paciente, origem, origem_clinica_id, tipo_tarefa, data_prevista, prioridade, status, responsavel, created_by_user_name)
                 VALUES ($1, 'consulta', $2, $3, $4, $5, 'pendente', $6, $6)
                 RETURNING id_tarefa`,
                [id_paciente, id, tipo_tarefa, data_prevista_tarefa ?? null, prioridade_tarefa ?? 'padrao', responsavel ?? null]
            );
            id_tarefa = tarefa.rows[0].id_tarefa;
        }

        await client.query('COMMIT');
        res.json({ ok: true, id_tarefa });
    } catch (err) {
        await client.query('ROLLBACK');
        console.error('[consultas.concluir]', err.message);
        res.status(500).json({ erro: 'Erro ao concluir consulta.' });
    } finally {
        client.release();
    }
});

// GET /api/consultas/paciente/:id_paciente/ultima-concluida  — retorna última consulta concluída com plano
router.get('/paciente/:id_paciente/ultima-concluida', async (req, res) => {
    const { id_paciente } = req.params;
    try {
        const consulta = await pool.query(
            `SELECT id_consulta, data_hora, classificacao_risco_validada, plano_cuidado_resumido, conduta_seguimento_definida
             FROM consultas_enfermagem
             WHERE id_paciente = $1 AND status_consulta = 'concluida'
             ORDER BY data_hora DESC LIMIT 1`,
            [id_paciente]
        );
        if (!consulta.rowCount) return res.json(null);
        const id = consulta.rows[0].id_consulta;
        const [diagnosticos, intervencoes] = await Promise.all([
            pool.query(
                `SELECT cd.codigo_nanda, dn.titulo_diagnostico
                 FROM consulta_diagnosticos cd
                 JOIN diagnosticos_nanda dn ON dn.codigo_nanda = cd.codigo_nanda
                 WHERE cd.id_consulta = $1 ORDER BY cd.prioridade`, [id]
            ),
            pool.query(
                `SELECT ci.codigo_nic, in2.nome_intervencao
                 FROM consulta_intervencoes ci
                 JOIN intervencoes_nic in2 ON in2.codigo_nic = ci.codigo_nic
                 WHERE ci.id_consulta = $1`, [id]
            )
        ]);
        res.json({
            id_consulta: id,
            data_hora: consulta.rows[0].data_hora,
            risco: consulta.rows[0].classificacao_risco_validada,
            resumo: consulta.rows[0].plano_cuidado_resumido,
            conduta: consulta.rows[0].conduta_seguimento_definida,
            diagnosticos: diagnosticos.rows,
            intervencoes: intervencoes.rows
        });
    } catch (err) {
        console.error('[consultas.ultima]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar última consulta.' });
    }
});

// GET /api/consultas/:id/plano  — retorna o plano para carregar na Aba Seguimento
router.get('/:id/plano', async (req, res) => {
    const { id } = req.params;
    try {
        const [diagnosticos, intervencoes, noc] = await Promise.all([
            pool.query(
                `SELECT cd.*, dn.titulo_diagnostico
                 FROM consulta_diagnosticos cd
                 JOIN diagnosticos_nanda dn ON dn.codigo_nanda = cd.codigo_nanda
                 WHERE cd.id_consulta = $1 ORDER BY cd.prioridade`, [id]
            ),
            pool.query(
                `SELECT ci.*, in2.nome_intervencao
                 FROM consulta_intervencoes ci
                 JOIN intervencoes_nic in2 ON in2.codigo_nic = ci.codigo_nic
                 WHERE ci.id_consulta = $1`, [id]
            ),
            pool.query(
                `SELECT cr.*, rn.nome_resultado
                 FROM consulta_resultados_esperados cr
                 JOIN resultados_noc rn ON rn.codigo_noc = cr.codigo_noc
                 WHERE cr.id_consulta = $1`, [id]
            )
        ]);
        res.json({
            diagnosticos: diagnosticos.rows,
            intervencoes: intervencoes.rows,
            resultados_esperados: noc.rows
        });
    } catch (err) {
        console.error('[consultas.plano.get]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar plano.' });
    }
});

module.exports = router;
