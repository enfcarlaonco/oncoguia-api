require('dotenv').config();

const express    = require('express');
const cors       = require('cors');

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
app.listen(PORT, '0.0.0.0', () => {
    console.log(`[OncoGuia API] Servidor rodando na porta ${PORT}`);
});

module.exports = app;
