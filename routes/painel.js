const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

const T_PRIO = `CASE t.prioridade
    WHEN 'critica'  THEN 0
    WHEN 'alta'     THEN 1
    WHEN 'moderada' THEN 2
    WHEN 'baixa'    THEN 3
    ELSE 4 END`;

const P_PRIO = `CASE p.prioridade
    WHEN 'critica'  THEN 0
    WHEN 'alta'     THEN 1
    WHEN 'moderada' THEN 2
    WHEN 'baixa'    THEN 3
    ELSE 4 END`;

// GET /api/painel/enfermeiro
router.get('/enfermeiro', async (req, res) => {
    const { data, responsavel, user } = req.query;

    if (!user) return res.status(401).json({ erro: 'Usuário não autenticado.' });

    const dataAlvo = data || new Date().toISOString().slice(0, 10);

    try {
        const [tarefasRes, pendCriticasRes, pendAbertasRes, consultasRes, altoRiscoRes] =
            await Promise.all([

            // Tarefas do dia (data_prevista = dataAlvo)
            pool.query(
                `SELECT t.id_tarefa, t.tipo_tarefa, t.descricao, t.prioridade, t.status,
                        t.data_prevista, t.responsavel, t.created_by_user_name,
                        t.conduta_realizada, t.efetividade,
                        p.iniciais_nome, p.registro_instituicao
                 FROM   tarefas_assistenciais t
                 JOIN   pacientes p ON p.id_paciente = t.id_paciente
                 WHERE  t.data_prevista::date = $1
                   ${responsavel ? `AND (t.responsavel = $2 OR t.created_by_user_name = $2)` : ''}
                 ORDER BY ${T_PRIO}, t.data_prevista ASC NULLS LAST`,
                responsavel ? [dataAlvo, responsavel] : [dataAlvo]
            ),

            // Pendências críticas em aberto
            pool.query(
                `SELECT p.id_pendencia, p.categoria, p.descricao, p.prioridade, p.status,
                        p.data_abertura, p.created_at, p.created_by_user_name, p.conduta_atual,
                        pac.iniciais_nome, pac.registro_instituicao
                 FROM   pendencias_paciente p
                 JOIN   pacientes pac ON pac.id_paciente = p.id_paciente
                 WHERE  p.prioridade = 'critica'
                   AND  p.status NOT IN ('resolvida', 'cancelada')
                 ORDER BY COALESCE(p.created_at, p.data_abertura) ASC NULLS LAST`
            ),

            // Todas as pendências abertas / em acompanhamento (para totalizador e lista)
            pool.query(
                `SELECT p.id_pendencia, p.categoria, p.descricao, p.prioridade, p.status,
                        p.data_abertura, p.created_at, p.created_by_user_name,
                        pac.iniciais_nome
                 FROM   pendencias_paciente p
                 JOIN   pacientes pac ON pac.id_paciente = p.id_paciente
                 WHERE  p.status IN ('aberta', 'em_acompanhamento')
                 ORDER BY ${P_PRIO}, COALESCE(p.created_at, p.data_abertura) ASC NULLS LAST`
            ),

            // Consultas do dia
            pool.query(
                `SELECT c.id_consulta, c.tipo_consulta, c.status_consulta,
                        c.data_hora, c.classificacao_risco_validada,
                        c.classificacao_risco_automatica, c.updated_by_user_name,
                        p.iniciais_nome, p.registro_instituicao, p.id_paciente
                 FROM   consultas_enfermagem c
                 JOIN   pacientes p ON p.id_paciente = c.id_paciente
                 WHERE  c.data_hora::date = $1
                 ORDER BY c.data_hora ASC NULLS LAST`,
                [dataAlvo]
            ),

            // Pacientes com alto risco nos últimos 30 dias
            pool.query(
                `SELECT COUNT(DISTINCT c.id_paciente) AS total
                 FROM   consultas_enfermagem c
                 WHERE  LOWER(COALESCE(c.classificacao_risco_validada,
                                       c.classificacao_risco_automatica, ''))
                        IN ('alto', 'critico', 'alto risco', 'crítico')
                   AND  c.data_hora >= NOW() - INTERVAL '30 days'`
            )
        ]);

        const tarefas      = tarefasRes.rows;
        const pendCriticas = pendCriticasRes.rows;
        const pendAbertas  = pendAbertasRes.rows;
        const consultas    = consultasRes.rows;
        const altoRisco    = parseInt(altoRiscoRes.rows[0]?.total || 0);

        // Alertas automáticos
        const alertas = [];
        if (pendCriticas.length > 0)
            alertas.push({
                nivel: 'critico',
                mensagem: `${pendCriticas.length} pendência(s) crítica(s) em aberto.`
            });
        const hoje = new Date();
        const atrasadas = tarefas.filter(t =>
            (t.status === 'pendente' || t.status === 'em_andamento') &&
            t.data_prevista && new Date(t.data_prevista) < hoje
        );
        if (atrasadas.length > 0)
            alertas.push({
                nivel: 'alto',
                mensagem: `${atrasadas.length} tarefa(s) com prazo vencido.`
            });

        res.json({
            data: dataAlvo,
            resumo: {
                tarefas_pendentes:    tarefas.filter(t => ['pendente','em_andamento'].includes(t.status)).length,
                tarefas_concluidas:   tarefas.filter(t => t.status === 'concluida').length,
                pendencias_abertas:   pendAbertas.length,
                pendencias_criticas:  pendCriticas.length,
                pacientes_alto_risco: altoRisco
            },
            tarefas_do_dia:      tarefas,
            pendencias_criticas: pendCriticas,
            pendencias_abertas:  pendAbertas,
            consultas_do_dia:    consultas,
            alertas
        });
    } catch (err) {
        console.error('[painel.enfermeiro]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar painel.' });
    }
});

module.exports = router;