const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

const PRIORIDADE_ORDER = `CASE t.prioridade
    WHEN 'critica'  THEN 0
    WHEN 'alta'     THEN 1
    WHEN 'moderada' THEN 2
    WHEN 'baixa'    THEN 3
    ELSE 4 END`;

// GET /api/tarefas  — agenda com filtros
// Query params: status, prioridade, id_paciente, periodo (hoje|proximas)
router.get('/', async (req, res) => {
    const { status, prioridade, data, id_paciente, periodo } = req.query;
    const conditions = [];
    const params     = [];
    let   idx        = 1;

    if (status)      { conditions.push(`t.status = $${idx++}`);      params.push(status); }
    if (prioridade)  { conditions.push(`t.prioridade = $${idx++}`);  params.push(prioridade); }
    if (id_paciente) { conditions.push(`t.id_paciente = $${idx++}`); params.push(id_paciente); }
    if (data)        { conditions.push(`t.data_prevista::date = $${idx++}`); params.push(data); }
    if (periodo === 'hoje')
        conditions.push(`t.data_prevista::date = CURRENT_DATE`);
    if (periodo === 'proximas')
        conditions.push(`t.data_prevista > NOW() AND t.data_prevista <= NOW() + INTERVAL '7 days'`);

    const where = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';

    try {
        const result = await pool.query(
            `SELECT t.*,
                    p.iniciais_nome,
                    p.registro_instituicao
             FROM   tarefas_assistenciais t
             JOIN   pacientes p ON p.id_paciente = t.id_paciente
             ${where}
             ORDER BY ${PRIORIDADE_ORDER}, t.data_prevista ASC NULLS LAST`,
            params
        );
        res.json(result.rows);
    } catch (err) {
        console.error('[tarefas.get]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar tarefas.' });
    }
});

// POST /api/tarefas  — cria tarefa manualmente
router.post('/', async (req, res) => {
    const {
        id_paciente, id_consulta_origem, tipo_tarefa,
        descricao, prioridade, data_prevista,
        created_by_user_name
    } = req.body;

    if (!created_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });
    if (!id_paciente || !tipo_tarefa)
        return res.status(400).json({ erro: 'id_paciente e tipo_tarefa são obrigatórios.' });

    try {
        const result = await pool.query(
            `INSERT INTO tarefas_assistenciais
                (id_paciente, origem, origem_clinica_id, tipo_tarefa, descricao,
                 prioridade, status, responsavel, created_by_user_name, data_prevista)
             VALUES ($1, 'manual', $2, $3, $4, $5, 'pendente', $6, $6, $7)
             RETURNING *`,
            [id_paciente, id_consulta_origem || null, tipo_tarefa,
             descricao || null, prioridade || 'moderada',
             created_by_user_name, data_prevista || null]
        );
        res.status(201).json(result.rows[0]);
    } catch (err) {
        console.error('[tarefas.post]', err.message);
        res.status(500).json({ erro: 'Erro ao criar tarefa.' });
    }
});

// GET /api/tarefas/:id  — detalhe de uma tarefa
router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const result = await pool.query(
            `SELECT t.*, p.iniciais_nome, p.registro_instituicao
             FROM   tarefas_assistenciais t
             JOIN   pacientes p ON p.id_paciente = t.id_paciente
             WHERE  t.id_tarefa = $1`,
            [id]
        );
        if (!result.rowCount) return res.status(404).json({ erro: 'Tarefa não encontrada.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[tarefas.get.id]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar tarefa.' });
    }
});

// PUT /api/tarefas/:id/concluir  — conclui tarefa com resultado e efetividade
router.put('/:id/concluir', async (req, res) => {
    const { id } = req.params;
    const { resultado, efetividade, completed_by_user_name } = req.body;

    if (!completed_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });

    try {
        const result = await pool.query(
            `UPDATE tarefas_assistenciais SET
                conduta_realizada      = COALESCE($1, conduta_realizada),
                efetividade            = COALESCE($2, efetividade),
                status                 = 'concluida',
                completed_by_user_name = $3,
                data_conclusao         = NOW(),
                updated_by_user_name   = $3
             WHERE id_tarefa = $4
             RETURNING *`,
            [resultado ?? null, efetividade ?? null, completed_by_user_name, id]
        );
        if (!result.rowCount) return res.status(404).json({ erro: 'Tarefa não encontrada.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[tarefas.concluir]', err.message);
        res.status(500).json({ erro: 'Erro ao concluir tarefa.' });
    }
});

// PATCH /api/tarefas/:id  — atualiza status / dados parciais (mantido para compatibilidade)
router.patch('/:id', async (req, res) => {
    const { id } = req.params;
    const { status, conduta_realizada, efetividade, responsavel, completed_by_user_name } = req.body;

    if (!completed_by_user_name)
        return res.status(401).json({ erro: 'Usuário não autenticado.' });

    try {
        const result = await pool.query(
            `UPDATE tarefas_assistenciais SET
                status                 = COALESCE($1, status),
                conduta_realizada      = COALESCE($2, conduta_realizada),
                efetividade            = COALESCE($3, efetividade),
                responsavel            = COALESCE($4, responsavel),
                completed_by_user_name = CASE WHEN $1 = 'concluida' THEN $6 ELSE completed_by_user_name END,
                data_conclusao         = CASE WHEN $1 = 'concluida' THEN NOW() ELSE data_conclusao END,
                updated_by_user_name   = $6
             WHERE id_tarefa = $5
             RETURNING *`,
            [status ?? null, conduta_realizada ?? null, efetividade ?? null,
             responsavel ?? null, id, completed_by_user_name]
        );
        if (!result.rowCount) return res.status(404).json({ erro: 'Tarefa não encontrada.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[tarefas.patch]', err.message);
        res.status(500).json({ erro: 'Erro ao atualizar tarefa.' });
    }
});

module.exports = router;