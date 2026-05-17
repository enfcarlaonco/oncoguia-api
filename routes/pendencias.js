const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

const PRIORIDADE_ORDER = `CASE p.prioridade
    WHEN 'critica'  THEN 0
    WHEN 'alta'     THEN 1
    WHEN 'moderada' THEN 2
    WHEN 'baixa'    THEN 3
    ELSE 4 END`;

// GET /api/pendencias
router.get('/', async (req, res) => {
    const { status, prioridade, categoria, id_paciente } = req.query;
    const conditions = [];
    const params     = [];
    let   idx        = 1;

    if (status)      { conditions.push(`p.status = $${idx++}`);       params.push(status); }
    if (prioridade)  { conditions.push(`p.prioridade = $${idx++}`);   params.push(prioridade); }
    if (categoria)   { conditions.push(`p.categoria = $${idx++}`);    params.push(categoria); }
    if (id_paciente) { conditions.push(`p.id_paciente = $${idx++}`);  params.push(id_paciente); }

    const where = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';

    try {
        const result = await pool.query(
            `SELECT p.*, pac.iniciais_nome, pac.registro_instituicao
             FROM   pendencias_paciente p
             JOIN   pacientes pac ON pac.id_paciente = p.id_paciente
             ${where}
             ORDER BY ${PRIORIDADE_ORDER}, COALESCE(p.created_at, p.data_abertura) ASC NULLS LAST`,
            params
        );
        res.json(result.rows);
    } catch (err) {
        console.error('[pendencias.get]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar pendências.' });
    }
});

// POST /api/pendencias
router.post('/', async (req, res) => {
    const {
        id_paciente, id_consulta_origem, categoria,
        descricao, prioridade, created_by_user_name
    } = req.body;

    if (!created_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });
    if (!id_paciente || !descricao)
        return res.status(400).json({ erro: 'id_paciente e descricao são obrigatórios.' });

    try {
        const result = await pool.query(
            `INSERT INTO pendencias_paciente
                (id_paciente, id_consulta_origem, categoria, descricao,
                 prioridade, status, created_by_user_name, data_abertura, created_at)
             VALUES ($1, $2, $3, $4, $5, 'aberta', $6, NOW(), NOW())
             RETURNING *`,
            [id_paciente, id_consulta_origem || null, categoria || null,
             descricao, prioridade || 'moderada', created_by_user_name]
        );
        res.status(201).json(result.rows[0]);
    } catch (err) {
        console.error('[pendencias.post]', err.message);
        res.status(500).json({ erro: 'Erro ao criar pendência.' });
    }
});

// GET /api/pendencias/:id
router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const result = await pool.query(
            `SELECT p.*, pac.iniciais_nome, pac.registro_instituicao
             FROM   pendencias_paciente p
             JOIN   pacientes pac ON pac.id_paciente = p.id_paciente
             WHERE  p.id_pendencia = $1`,
            [id]
        );
        if (!result.rowCount) return res.status(404).json({ erro: 'Pendência não encontrada.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[pendencias.get.id]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar pendência.' });
    }
});

// PUT /api/pendencias/:id/resolver
router.put('/:id/resolver', async (req, res) => {
    const { id } = req.params;
    const { conduta_atual, resolved_by_user_name } = req.body;

    if (!resolved_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });

    try {
        const result = await pool.query(
            `UPDATE pendencias_paciente SET
                conduta_atual         = COALESCE($1, conduta_atual),
                status                = 'resolvida',
                resolved_by_user_name = $2,
                resolved_at           = NOW(),
                data_fechamento       = NOW()
             WHERE id_pendencia = $3
             RETURNING *`,
            [conduta_atual ?? null, resolved_by_user_name, id]
        );
        if (!result.rowCount) return res.status(404).json({ erro: 'Pendência não encontrada.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[pendencias.resolver]', err.message);
        res.status(500).json({ erro: 'Erro ao resolver pendência.' });
    }
});

// PATCH /api/pendencias/:id
router.patch('/:id', async (req, res) => {
    const { id } = req.params;
    const { status, categoria, prioridade, conduta_atual, updated_by_user_name } = req.body;

    if (!updated_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });

    try {
        const result = await pool.query(
            `UPDATE pendencias_paciente SET
                status        = COALESCE($1, status),
                categoria     = COALESCE($2, categoria),
                prioridade    = COALESCE($3, prioridade),
                conduta_atual = COALESCE($4, conduta_atual)
             WHERE id_pendencia = $5
             RETURNING *`,
            [status ?? null, categoria ?? null, prioridade ?? null, conduta_atual ?? null, id]
        );
        if (!result.rowCount) return res.status(404).json({ erro: 'Pendência não encontrada.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[pendencias.patch]', err.message);
        res.status(500).json({ erro: 'Erro ao atualizar pendência.' });
    }
});

module.exports = router;