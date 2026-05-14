const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

// GET /api/pacientes/busca?q=123456  — busca por registro ou iniciais (q vazio retorna todos)
router.get('/busca', async (req, res) => {
    const { q } = req.query;

    try {
        const result = await pool.query(
            `SELECT id_paciente, registro_instituicao, iniciais_nome,
                    diagnostico_oncologico, protocolo_atual, ciclo_atual,
                    status_paciente
             FROM   pacientes
             WHERE  ($1::text = '' OR $1 IS NULL
                     OR registro_instituicao ILIKE '%' || $1 || '%'
                     OR iniciais_nome        ILIKE '%' || $1 || '%')
             ORDER  BY updated_at DESC
             LIMIT  200`,
            [q ?? '']
        );
        res.json(result.rows);
    } catch (err) {
        console.error('[pacientes.busca]', err.message);
        res.status(500).json({ erro: 'Erro ao buscar pacientes.' });
    }
});

// GET /api/pacientes/:id  — visão longitudinal completa
router.get('/:id', async (req, res) => {
    try {
        const result = await pool.query(
            'SELECT * FROM vw_paciente_longitudinal WHERE id_paciente = $1',
            [req.params.id]
        );
        if (result.rowCount === 0) return res.status(404).json({ erro: 'Paciente não encontrado.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[pacientes.get]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar paciente.' });
    }
});

// POST /api/pacientes  — cadastro ou upsert por registro_instituicao
router.post('/', async (req, res) => {
    const {
        registro_instituicao, iniciais_nome, nome_completo,
        data_nascimento, sexo, telefone_1, telefone_2,
        nome_cuidador, telefone_cuidador,
        diagnostico_oncologico, subespecialidade,
        protocolo_atual, ciclo_atual,
        data_ultima_qt, data_proxima_qt_prevista
    } = req.body;

    if (!registro_instituicao || !iniciais_nome)
        return res.status(400).json({ erro: 'registro_instituicao e iniciais_nome são obrigatórios.' });

    try {
        const result = await pool.query(
            `INSERT INTO pacientes
                (registro_instituicao, iniciais_nome, nome_completo,
                 data_nascimento, sexo, telefone_1, telefone_2,
                 nome_cuidador, telefone_cuidador,
                 diagnostico_oncologico, subespecialidade,
                 protocolo_atual, ciclo_atual,
                 data_ultima_qt, data_proxima_qt_prevista)
             VALUES ($1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15)
             ON CONFLICT (registro_instituicao)
             DO UPDATE SET
                iniciais_nome              = EXCLUDED.iniciais_nome,
                protocolo_atual            = EXCLUDED.protocolo_atual,
                ciclo_atual                = EXCLUDED.ciclo_atual,
                data_proxima_qt_prevista   = EXCLUDED.data_proxima_qt_prevista,
                updated_at                 = NOW()
             RETURNING id_paciente, registro_instituicao, iniciais_nome`,
            [registro_instituicao, iniciais_nome, nome_completo,
             data_nascimento, sexo, telefone_1, telefone_2,
             nome_cuidador, telefone_cuidador,
             diagnostico_oncologico, subespecialidade,
             protocolo_atual, ciclo_atual,
             data_ultima_qt, data_proxima_qt_prevista]
        );
        res.status(201).json(result.rows[0]);
    } catch (err) {
        console.error('[pacientes.post]', err.message);
        res.status(500).json({ erro: 'Erro ao salvar paciente.' });
    }
});

module.exports = router;
