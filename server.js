require('dotenv').config();

const express    = require('express');
const cors       = require('cors');
const pool       = require('./db/connection');

async function runMigrations() {
    const stmts = [
        // ── 1.1  Nova tabela: consulta_orientacoes ──────────────────────────────
        `CREATE TABLE IF NOT EXISTS consulta_orientacoes (
            id_orientacao   SERIAL          PRIMARY KEY,
            id_consulta     INTEGER         NOT NULL
                            REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
            codigo_nic      INTEGER         REFERENCES intervencoes_nic(codigo_nic),
            tipo            VARCHAR(20)     NOT NULL,
            texto           TEXT            NOT NULL,
            created_at      TIMESTAMPTZ     DEFAULT NOW()
        )`,
        `CREATE INDEX IF NOT EXISTS idx_orientacoes_consulta
            ON consulta_orientacoes(id_consulta)`,

        // ── 1.2  Tabelas do schema que podem não estar no Railway ───────────────
        `CREATE TABLE IF NOT EXISTS consulta_comorbidades (
            id_consulta_comorbidade SERIAL      PRIMARY KEY,
            id_consulta             INTEGER     NOT NULL
                                    REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
            tipo_comorbidade        VARCHAR(50) NOT NULL,
            descricao_outro         TEXT
        )`,
        `CREATE TABLE IF NOT EXISTS consulta_exame_fisico (
            id_exame_fisico             SERIAL      PRIMARY KEY,
            id_consulta                 INTEGER     NOT NULL UNIQUE
                                        REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
            pressao_arterial            VARCHAR(15),
            frequencia_cardiaca         SMALLINT,
            frequencia_respiratoria     SMALLINT,
            temperatura_axilar          NUMERIC(4,1),
            saturacao_o2                SMALLINT,
            hidratacao                  VARCHAR(20),
            mucosa_oral                 VARCHAR(30),
            observacoes_exame_fisico    TEXT
        )`,
        `CREATE TABLE IF NOT EXISTS consulta_exames_laboratoriais (
            id_exame_lab        SERIAL          PRIMARY KEY,
            id_consulta         INTEGER         NOT NULL UNIQUE
                                REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
            data_hemograma      DATE,
            leucocitos          NUMERIC(6,2),
            neutrofilos         NUMERIC(6,2),
            plaquetas           NUMERIC(6,2),
            hemoglobina         NUMERIC(4,1),
            creatinina          NUMERIC(5,2)
        )`,
        `CREATE TABLE IF NOT EXISTS planos_seguimento (
            id_plano_seguimento SERIAL          PRIMARY KEY,
            id_consulta         INTEGER         NOT NULL
                                REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
            id_paciente         INTEGER         NOT NULL
                                REFERENCES pacientes(id_paciente),
            tipo_seguimento     VARCHAR(30),
            data_prevista       DATE,
            hora_prevista       TIME,
            responsavel         TEXT,
            prioridade          VARCHAR(20),
            status              VARCHAR(20)     DEFAULT 'pendente',
            observacao          TEXT,
            created_at          TIMESTAMPTZ     DEFAULT NOW()
        )`,
        `CREATE INDEX IF NOT EXISTS idx_planos_seguimento_paciente
            ON planos_seguimento(id_paciente)`,
        `CREATE TABLE IF NOT EXISTS pendencias_paciente (
            id_pendencia        SERIAL          PRIMARY KEY,
            id_paciente         INTEGER         NOT NULL
                                REFERENCES pacientes(id_paciente),
            tipo_pendencia      VARCHAR(40),
            descricao           TEXT,
            data_abertura       TIMESTAMPTZ     DEFAULT NOW(),
            status              VARCHAR(20)     DEFAULT 'aberta',
            data_fechamento     TIMESTAMPTZ,
            responsavel         TEXT
        )`,
        `CREATE INDEX IF NOT EXISTS idx_pendencias_paciente
            ON pendencias_paciente(id_paciente)`,

        // ── 1.3  Colunas de auditoria (já existentes no bloco anterior) ─────────
        'ALTER TABLE consultas_enfermagem    ADD COLUMN IF NOT EXISTS completed_by_user_name TEXT',
        'ALTER TABLE consultas_enfermagem    ADD COLUMN IF NOT EXISTS completed_at           TIMESTAMPTZ',
        'ALTER TABLE consultas_enfermagem    ADD COLUMN IF NOT EXISTS updated_by_user_name   TEXT',
        'ALTER TABLE tarefas_assistenciais   ADD COLUMN IF NOT EXISTS created_by_user_name   TEXT',
        'ALTER TABLE tarefas_assistenciais   ADD COLUMN IF NOT EXISTS completed_by_user_name TEXT',
        'ALTER TABLE tarefas_assistenciais   ADD COLUMN IF NOT EXISTS updated_by_user_name   TEXT',
        'ALTER TABLE seguimentos_enfermagem  ADD COLUMN IF NOT EXISTS created_by_user_name   TEXT',

        // ── 1.3  Novas colunas de auditoria ─────────────────────────────────────
        'ALTER TABLE seguimentos_enfermagem  ADD COLUMN IF NOT EXISTS updated_by_user_name   TEXT',
        'ALTER TABLE pacientes               ADD COLUMN IF NOT EXISTS created_by_user_name   TEXT',
        'ALTER TABLE pacientes               ADD COLUMN IF NOT EXISTS updated_by_user_name   TEXT',

        // ── Fase 6: coluna descricao em tarefas ───────────────────────────────
        'ALTER TABLE tarefas_assistenciais   ADD COLUMN IF NOT EXISTS descricao              TEXT',

        // ── Fase 7: colunas adicionais em pendencias_paciente ─────────────────
        'ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS id_consulta_origem     INTEGER REFERENCES consultas_enfermagem(id_consulta)',
        'ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS categoria              VARCHAR(40)',
        `ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS prioridade             VARCHAR(20) DEFAULT 'moderada'`,
        'ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS conduta_atual          TEXT',
        'ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS created_by_user_name   TEXT',
        'ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS resolved_by_user_name  TEXT',
        'ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS resolved_at            TIMESTAMPTZ',
        'ALTER TABLE pendencias_paciente ADD COLUMN IF NOT EXISTS created_at             TIMESTAMPTZ DEFAULT NOW()',
    ];
    for (const sql of stmts) {
        try { await pool.query(sql); } catch (e) { console.warn('[migration warn]', e.message); }
    }
    console.log('[OncoGuia API] Migrações Fase 1 verificadas.');
}

const pacientesRouter   = require('./routes/pacientes');
const consultasRouter   = require('./routes/consultas');
const seguimentosRouter = require('./routes/seguimentos');
const tarefasRouter     = require('./routes/tarefas');
const pendenciasRouter  = require('./routes/pendencias');
const painelRouter      = require('./routes/painel');
const referenciaRouter  = require('./routes/referencia');
const adminRouter       = require('./routes/admin');

const app  = express();
const PORT = process.env.PORT || 3001;

// -----------------------------------------------------------------------------
// Middlewares
// -----------------------------------------------------------------------------
app.use(cors({
    origin: process.env.CORS_ORIGIN || 'http://localhost:3000',  // URL do front PWA
    methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

// -----------------------------------------------------------------------------
// Rotas
// -----------------------------------------------------------------------------
app.use('/api/pacientes',   pacientesRouter);
app.use('/api/consultas',   consultasRouter);
app.use('/api/seguimentos', seguimentosRouter);
app.use('/api/tarefas',     tarefasRouter);
app.use('/api/pendencias',  pendenciasRouter);
app.use('/api/painel',      painelRouter);
app.use('/api/referencia',  referenciaRouter);
app.use('/api/admin',       adminRouter);

// Health-check
app.get('/health', (_req, res) => {
    res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// -----------------------------------------------------------------------------
// Erro global
// -----------------------------------------------------------------------------
app.use((err, _req, res, _next) => {
    console.error('[SERVER ERROR]', err);
    res.status(500).json({ erro: 'Erro interno do servidor.' });
});

// -----------------------------------------------------------------------------
// Start
// -----------------------------------------------------------------------------
runMigrations().then(() => {
    app.listen(PORT, '0.0.0.0', () => {
        console.log(`[OncoGuia API] Servidor rodando na porta ${PORT}`);
    });
}).catch(err => {
    console.error('[OncoGuia API] Falha nas migrações:', err.message);
    process.exit(1);
});

module.exports = app;
