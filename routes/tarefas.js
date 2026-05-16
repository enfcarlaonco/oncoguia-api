const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

// GET /api/tarefas  — agenda do enfermeiro com filtros (Aba 5)
// Query params: status, data, id_paciente
router.get('/', async (req, res) => {
    const { status, data, id_paciente } = req.query;
    const conditions = [];
    const params     = [];
    let   idx        = 1;

    if (status) {
        conditions.push(`t.status = $${idx++}`);
        params.push(status);
    }
    if (data) {
        conditions.push(`t.data_prevista = $${idx++}`);
        params.push(data);
    }
    if (id_paciente) {
        conditions.push(`t.id_paciente = $${idx++}`);
        params.push(id_paciente);
    }

    const where = conditions.length ? `WHERE ${conditions.join(' AND ')}` : '';

    try {
        const result = await pool.query(
            `SELECT t.*,
                    p.iniciais_nome,
                    p.registro_instituicao
             FROM   tarefas_assistenciais t
             JOIN   pacientes p ON p.id_paciente = t.id_paciente
             ${where}
             ORDER  BY
                CASE t.prioridade WHEN 'alta' THEN 0 ELSE 1 END,
                t.data_prevista ASC NULLS LAST`,
            params
        );
        res.json(result.rows);
    } catch (err) {
        console.error('[tarefas.get]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar tarefas.' });
    }
});

// PATCH /api/tarefas/:id  — atualiza status / conclui tarefa
router.patch('/:id', async (req, res) => {
    const { id } = req.params;
    const { status, conduta_realizada, efetividade, responsavel, completed_by_user_name } = req.body;

    try {
        const result = await pool.query(
            `UPDATE tarefas_assistenciais SET
                status                  = COALESCE($1, status),
                conduta_realizada       = COALESCE($2, conduta_realizada),
                efetividade             = COALESCE($3, efetividade),
                responsavel             = COALESCE($4, responsavel),
                completed_by_user_name  = CASE WHEN $1 = 'concluida' THEN $6 ELSE completed_by_user_name END,
                data_conclusao          = CASE WHEN $1 = 'concluida' THEN NOW() ELSE data_conclusao END
             WHERE id_tarefa = $5
             RETURNING *`,
            [status ?? null, conduta_realizada ?? null, efetividade ?? null, responsavel ?? null, id, completed_by_user_name ?? null]
        );
        if (result.rowCount === 0) return res.status(404).json({ erro: 'Tarefa não encontrada.' });
        res.json(result.rows[0]);
    } catch (err) {
        console.error('[tarefas.patch]', err.message);
        res.status(500).json({ erro: 'Erro ao atualizar tarefa.' });
    }
});

module.exports = router;
