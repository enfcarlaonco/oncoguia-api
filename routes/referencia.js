const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

// GET /api/referencia/nanda
router.get('/nanda', async (req, res) => {
    const { q } = req.query;
    try {
        const result = await pool.query(
            `SELECT codigo_nanda, dx_id_lc, titulo_diagnostico,
                    dominio, prioridade_sugerida, enunciado_pes
             FROM   diagnosticos_nanda
             WHERE  ativo = true
               AND  ($1::text IS NULL OR titulo_diagnostico ILIKE '%' || $1 || '%')
             ORDER  BY prioridade_sugerida DESC, titulo_diagnostico`,
            [q ?? null]
        );
        res.json(result.rows);
    } catch (err) {
        console.error('[referencia.nanda]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar diagnósticos NANDA.' });
    }
});

// GET /api/referencia/nanda/:codigo/sugestoes
router.get('/nanda/:codigo/sugestoes', async (req, res) => {
    const { codigo } = req.params;
    try {
        const [nic, noc] = await Promise.all([
            pool.query(
                `SELECT mn.id_mapa_nanda_nic, mn.prioridade_sugerida,
                        in2.codigo_nic, in2.nic_id_lc, in2.nome_intervencao,
                        in2.atividade_profissional,
                        in2.orientacao_paciente,
                        in2.contexto_uso,
                        mn.atividades_profissionais,
                        mn.orientacao_paciente_sugerida
                 FROM   mapa_nanda_nic mn
                 JOIN   intervencoes_nic in2 ON in2.codigo_nic = mn.codigo_nic
                 WHERE  mn.codigo_nanda = $1 AND mn.ativo = true
                 ORDER  BY mn.prioridade_sugerida DESC`, [codigo]
            ),
            pool.query(
                `SELECT mn.id_mapa_nanda_noc, mn.prioridade_sugerida,
                        rn.codigo_noc, rn.noc_id_lc, rn.nome_resultado
                 FROM   mapa_nanda_noc mn
                 JOIN   resultados_noc rn ON rn.codigo_noc = mn.codigo_noc
                 WHERE  mn.codigo_nanda = $1 AND mn.ativo = true
                 ORDER  BY mn.prioridade_sugerida DESC`, [codigo]
            )
        ]);
        res.json({ intervencoes_nic: nic.rows, resultados_noc: noc.rows });
    } catch (err) {
        console.error('[referencia.sugestoes]', err.message);
        res.status(500).json({ erro: 'Erro ao carregar sugestões NIC/NOC.' });
    }
});

module.exports = router;
