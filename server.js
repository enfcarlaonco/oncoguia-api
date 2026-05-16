require('dotenv').config();

const express    = require('express');
const cors       = require('cors');
const pool       = require('./db/connection');

async function runMigrations() {
    const stmts = [
        'ALTER TABLE consultas_enfermagem    ADD COLUMN IF NOT EXISTS completed_by_user_name TEXT',
        'ALTER TABLE consultas_enfermagem    ADD COLUMN IF NOT EXISTS completed_at           TIMESTAMPTZ',
        'ALTER TABLE consultas_enfermagem    ADD COLUMN IF NOT EXISTS updated_by_user_name   TEXT',
        'ALTER TABLE tarefas_assistenciais   ADD COLUMN IF NOT EXISTS created_by_user_name   TEXT',
        'ALTER TABLE tarefas_assistenciais   ADD COLUMN IF NOT EXISTS completed_by_user_name TEXT',
        'ALTER TABLE tarefas_assistenciais   ADD COLUMN IF NOT EXISTS updated_by_user_name   TEXT',
        'ALTER TABLE seguimentos_enfermagem  ADD COLUMN IF NOT EXISTS created_by_user_name   TEXT',
    ];
    for (const sql of stmts) {
        try { await pool.query(sql); } catch (e) { console.warn('[migration warn]', e.message); }
    }
    console.log('[OncoGuia API] Migrações de auditoria verificadas.');
}

const pacientesRouter   = require('./routes/pacientes');
const consultasRouter   = require('./routes/consultas');
const seguimentosRouter = require('./routes/seguimentos');
const tarefasRouter     = require('./routes/tarefas');
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
