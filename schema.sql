-- =============================================================================
-- ONCOGUIA — Schema PostgreSQL
-- Versão: 1.0 (Assistencial)
-- Gerado com base em: Arquitetura_geral_do_banco_de_dados_-_Sistema_OncoGuia.docx
-- =============================================================================

-- -----------------------------------------------------------------------------
-- EXTENSÕES
-- -----------------------------------------------------------------------------
CREATE EXTENSION IF NOT EXISTS "pgcrypto";  -- Para gen_random_uuid() se necessário


-- =============================================================================
-- BLOCO 1: TABELAS CLÍNICAS DE REFERÊNCIA (mestres — populadas via seed)
-- =============================================================================

-- 3.1 diagnosticos_nanda
CREATE TABLE diagnosticos_nanda (
    codigo_nanda        VARCHAR(10)     PRIMARY KEY,          -- ex: '00134'
    dx_id_lc            VARCHAR(10)     UNIQUE NOT NULL,       -- ex: 'DX001'
    titulo_diagnostico  TEXT            NOT NULL,
    dominio             TEXT,
    classe              TEXT,
    definicao           TEXT,
    enunciado_pes       TEXT,
    contexto_uso        TEXT,
    prioridade_sugerida VARCHAR(20),                           -- 'Alta' | 'Intermediária' | 'Suporte'
    aplicavel_ambulatorio       BOOLEAN DEFAULT TRUE,
    aplicavel_adulto            BOOLEAN DEFAULT TRUE,
    aplicavel_pediatrico        BOOLEAN DEFAULT TRUE,
    aplicavel_telemonitoramento BOOLEAN DEFAULT TRUE,
    aplicavel_protocolo_oral    BOOLEAN DEFAULT TRUE,
    aplicavel_intercorrencia    BOOLEAN DEFAULT TRUE,
    ativo               BOOLEAN         DEFAULT TRUE,
    observacoes_modelagem TEXT
);

-- 3.2 intervencoes_nic
CREATE TABLE intervencoes_nic (
    codigo_nic              INTEGER         PRIMARY KEY,       -- ex: 1450
    nic_id_lc               VARCHAR(10)     UNIQUE NOT NULL,   -- ex: 'NIC001'
    nome_intervencao        TEXT            NOT NULL,
    atividade_profissional  TEXT,
    orientacao_paciente     TEXT,
    contexto_uso            TEXT,
    ativo                   BOOLEAN         DEFAULT TRUE,
    observacoes_modelagem   TEXT
);

-- 3.3 resultados_noc
CREATE TABLE resultados_noc (
    codigo_noc                  INTEGER         PRIMARY KEY,   -- ex: 1618
    noc_id_lc                   VARCHAR(10)     UNIQUE NOT NULL, -- ex: 'NOC001'
    nome_resultado              TEXT            NOT NULL,
    indicadores_mensuraveis     TEXT,
    criterio_avaliacao          TEXT,
    janela_reavaliacao          TEXT,
    ativo                       BOOLEAN         DEFAULT TRUE,
    observacoes_modelagem       TEXT
);

-- 3.4 mapa_nanda_nic
CREATE TABLE mapa_nanda_nic (
    id_mapa_nanda_nic       SERIAL          PRIMARY KEY,
    dx_nic_id_lc            VARCHAR(15)     UNIQUE,            -- ex: 'DXNIC0001'
    codigo_nanda            VARCHAR(10)     NOT NULL REFERENCES diagnosticos_nanda(codigo_nanda),
    codigo_nic              INTEGER         NOT NULL REFERENCES intervencoes_nic(codigo_nic),
    prioridade_sugerida     VARCHAR(20),
    contexto_uso_sugerido   TEXT,
    atividades_profissionais TEXT,
    orientacao_paciente_sugerida TEXT,
    ativo                   BOOLEAN         DEFAULT TRUE
);

-- 3.5 mapa_nanda_noc
CREATE TABLE mapa_nanda_noc (
    id_mapa_nanda_noc       SERIAL          PRIMARY KEY,
    dx_noc_id_lc            VARCHAR(15)     UNIQUE,            -- ex: 'DXNOC0001'
    codigo_nanda            VARCHAR(10)     NOT NULL REFERENCES diagnosticos_nanda(codigo_nanda),
    codigo_noc              INTEGER         NOT NULL REFERENCES resultados_noc(codigo_noc),
    prioridade_sugerida     VARCHAR(20),
    contexto_uso_sugerido   TEXT,
    indicadores_mensuraveis TEXT,
    criterio_avaliacao_sugerido TEXT,
    janela_reavaliacao_sugerida TEXT,
    ativo                   BOOLEAN         DEFAULT TRUE,
    notas_origem            TEXT
);


-- =============================================================================
-- BLOCO 2: ENTIDADE CENTRAL — PACIENTES
-- =============================================================================

-- 2.1 pacientes
CREATE TABLE pacientes (
    id_paciente                 SERIAL          PRIMARY KEY,
    registro_instituicao        VARCHAR(30)     UNIQUE NOT NULL,  -- campo principal de busca
    iniciais_nome               VARCHAR(20)     NOT NULL,
    nome_completo               TEXT,                             -- mantido no BD, interface usa só iniciais
    data_nascimento             DATE,
    idade_calculada             INTEGER,                          -- pode ser calculado via trigger ou app
    sexo                        VARCHAR(10),                      -- 'M' | 'F' | 'Outro'
    telefone_1                  VARCHAR(20),
    telefone_2                  VARCHAR(20),
    nome_cuidador               TEXT,
    telefone_cuidador           VARCHAR(20),
    diagnostico_oncologico      TEXT,
    subespecialidade            TEXT,
    protocolo_atual             TEXT,
    ciclo_atual                 INTEGER,
    data_ultima_qt              DATE,
    data_proxima_qt_prevista    DATE,
    status_paciente             VARCHAR(20)     DEFAULT 'ativo',  -- 'ativo' | 'inativo' | 'obito'
    created_at                  TIMESTAMPTZ     DEFAULT NOW(),
    updated_at                  TIMESTAMPTZ     DEFAULT NOW()
);

CREATE INDEX idx_pacientes_registro ON pacientes(registro_instituicao);
CREATE INDEX idx_pacientes_iniciais ON pacientes(iniciais_nome);


-- =============================================================================
-- BLOCO 3: CONSULTA DE ENFERMAGEM E SUBTABELAS
-- =============================================================================

-- 2.2 consultas_enfermagem
CREATE TABLE consultas_enfermagem (
    id_consulta                     SERIAL          PRIMARY KEY,
    id_paciente                     INTEGER         NOT NULL REFERENCES pacientes(id_paciente) ON DELETE RESTRICT,
    data_hora                       TIMESTAMPTZ     DEFAULT NOW(),
    tipo_consulta                   VARCHAR(30),                  -- 'inicial' | 'retorno' | 'intercorrencia'
    enfermeiro_oncologista          TEXT,
    -- Dados clínicos gerais
    ecog                            SMALLINT        CHECK (ecog BETWEEN 0 AND 4),
    peso_kg                         NUMERIC(5,2),
    altura_cm                       NUMERIC(5,1),
    superficie_corporal             NUMERIC(4,2),
    medicamentos_uso                TEXT,
    suporte_social                  TEXT,
    condicao_nutricional_autorreferida VARCHAR(30),
    -- Flags de risco
    perda_peso_30_dias              VARCHAR(20),                  -- 'nenhuma' | '5_10' | 'acima_10'
    toxicidade_grave_ciclo_anterior BOOLEAN         DEFAULT FALSE,
    internacao_nao_planejada_30_dias BOOLEAN        DEFAULT FALSE,
    ida_pa_30_dias                  BOOLEAN         DEFAULT FALSE,
    protocolo_alta_toxicidade       BOOLEAN         DEFAULT FALSE,
    neutropenia_previa_documentada  BOOLEAN         DEFAULT FALSE,
    paciente_idoso_ou_pediatrico    BOOLEAN         DEFAULT FALSE,
    mora_sozinho_ou_sem_cuidador    BOOLEAN         DEFAULT FALSE,
    dificuldade_acesso_servico      BOOLEAN         DEFAULT FALSE,
    -- Classificação de risco
    classificacao_risco_automatica  VARCHAR(20),                  -- 'alto' | 'moderado' | 'baixo'
    classificacao_risco_validada    VARCHAR(20),                  -- validada pelo enfermeiro
    -- Campos de encerramento
    resumo_clinico                  TEXT,
    plano_cuidado_resumido          TEXT,
    conduta_seguimento_definida     TEXT,
    gerou_tarefa                    BOOLEAN         DEFAULT FALSE,
    texto_copiavel_prontuario       TEXT,
    status_consulta                 VARCHAR(20)     DEFAULT 'rascunho', -- 'rascunho' | 'concluida'
    created_at                      TIMESTAMPTZ     DEFAULT NOW(),
    updated_at                      TIMESTAMPTZ     DEFAULT NOW()
);

CREATE INDEX idx_consultas_paciente ON consultas_enfermagem(id_paciente);
CREATE INDEX idx_consultas_data ON consultas_enfermagem(data_hora DESC);

-- 2.3 consulta_comorbidades
CREATE TABLE consulta_comorbidades (
    id_consulta_comorbidade SERIAL      PRIMARY KEY,
    id_consulta             INTEGER     NOT NULL REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    tipo_comorbidade        VARCHAR(50) NOT NULL,  -- 'diabetes' | 'hta' | 'cardiopatia' | 'outro'
    descricao_outro         TEXT
);

-- 2.4 consulta_sintomas_ctcae
CREATE TABLE consulta_sintomas_ctcae (
    id_sintoma_consulta SERIAL      PRIMARY KEY,
    id_consulta         INTEGER     NOT NULL REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    tipo_sintoma        VARCHAR(30) NOT NULL,
    -- Valores: 'nausea' | 'vomito' | 'diarreia' | 'constipacao' | 'dor' | 'fadiga' |
    --          'febre' | 'dispneia' | 'neuropatia' | 'alteracao_pele' | 'insonia' |
    --          'ansiedade' | 'tristeza' | 'confusao_mental' | 'edema' | 'outro'
    grau_ctcae          SMALLINT    NOT NULL CHECK (grau_ctcae BETWEEN 0 AND 4),
    alerta_risco        BOOLEAN     DEFAULT FALSE,
    observacao          TEXT
);

CREATE INDEX idx_sintomas_consulta ON consulta_sintomas_ctcae(id_consulta);

-- 2.5 consulta_exame_fisico
CREATE TABLE consulta_exame_fisico (
    id_exame_fisico             SERIAL      PRIMARY KEY,
    id_consulta                 INTEGER     NOT NULL UNIQUE REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    pressao_arterial            VARCHAR(15),  -- ex: '120/80'
    frequencia_cardiaca         SMALLINT,
    frequencia_respiratoria     SMALLINT,
    temperatura_axilar          NUMERIC(4,1),
    saturacao_o2                SMALLINT,
    hidratacao                  VARCHAR(20),  -- 'normal' | 'desidratado_leve' | 'desidratado_grave'
    mucosa_oral                 VARCHAR(30),
    observacoes_exame_fisico    TEXT
);

-- 2.6 consulta_exames_laboratoriais
CREATE TABLE consulta_exames_laboratoriais (
    id_exame_lab        SERIAL          PRIMARY KEY,
    id_consulta         INTEGER         NOT NULL UNIQUE REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    data_hemograma      DATE,
    leucocitos          NUMERIC(6,2),   -- x10³/µL
    neutrofilos         NUMERIC(6,2),
    plaquetas           NUMERIC(6,2),
    hemoglobina         NUMERIC(4,1),
    creatinina          NUMERIC(5,2)
);

-- 2.7 consulta_diagnosticos (NANDA selecionados na consulta)
CREATE TABLE consulta_diagnosticos (
    id_consulta_diagnostico SERIAL      PRIMARY KEY,
    id_consulta             INTEGER     NOT NULL REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    codigo_nanda            VARCHAR(10) NOT NULL REFERENCES diagnosticos_nanda(codigo_nanda),
    dx_id_lc                VARCHAR(10),  -- referência amigável
    prioridade              SMALLINT,     -- 1 = principal, 2 = secundário...
    origem                  VARCHAR(20),  -- 'selecionado' | 'sugerido_automatico'
    ativo                   BOOLEAN     DEFAULT TRUE
);

CREATE INDEX idx_consulta_diagnosticos_consulta ON consulta_diagnosticos(id_consulta);

-- 2.8 consulta_intervencoes (NIC aplicadas)
CREATE TABLE consulta_intervencoes (
    id_consulta_intervencao SERIAL      PRIMARY KEY,
    id_consulta             INTEGER     NOT NULL REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    codigo_nic              INTEGER     NOT NULL REFERENCES intervencoes_nic(codigo_nic),
    nic_id_lc               VARCHAR(10),
    tipo_intervencao        VARCHAR(20), -- 'profissional' | 'orientacao_paciente'
    executada_na_consulta   BOOLEAN     DEFAULT FALSE
);

CREATE INDEX idx_consulta_intervencoes_consulta ON consulta_intervencoes(id_consulta);

-- 2.9 consulta_resultados_esperados (NOC vinculados)
CREATE TABLE consulta_resultados_esperados (
    id_consulta_resultado           SERIAL      PRIMARY KEY,
    id_consulta                     INTEGER     NOT NULL REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    codigo_noc                      INTEGER     NOT NULL REFERENCES resultados_noc(codigo_noc),
    noc_id_lc                       VARCHAR(10),
    criterio_avaliacao_personalizado TEXT,
    janela_reavaliacao_personalizada TEXT,
    ativo                           BOOLEAN     DEFAULT TRUE
);


-- =============================================================================
-- BLOCO 4: PLANO E SEGUIMENTO
-- =============================================================================

-- 2.10 planos_seguimento
CREATE TABLE planos_seguimento (
    id_plano_seguimento SERIAL          PRIMARY KEY,
    id_consulta         INTEGER         NOT NULL REFERENCES consultas_enfermagem(id_consulta) ON DELETE CASCADE,
    id_paciente         INTEGER         NOT NULL REFERENCES pacientes(id_paciente),
    tipo_seguimento     VARCHAR(30),    -- 'telefonico' | 'presencial' | 'encaminhamento'
    data_prevista       DATE,
    hora_prevista       TIME,
    responsavel         TEXT,
    prioridade          VARCHAR(20),    -- 'alta' | 'padrao'
    status              VARCHAR(20)     DEFAULT 'pendente',
    observacao          TEXT,
    created_at          TIMESTAMPTZ     DEFAULT NOW()
);

CREATE INDEX idx_planos_seguimento_paciente ON planos_seguimento(id_paciente);

-- 2.11 seguimentos_enfermagem
CREATE TABLE seguimentos_enfermagem (
    id_seguimento               SERIAL          PRIMARY KEY,
    id_paciente                 INTEGER         NOT NULL REFERENCES pacientes(id_paciente),
    id_consulta_origem          INTEGER         REFERENCES consultas_enfermagem(id_consulta) ON DELETE SET NULL,
    data_hora                   TIMESTAMPTZ     DEFAULT NOW(),
    modalidade                  VARCHAR(20),    -- 'telefonico' | 'presencial'
    momento_seguimento          VARCHAR(30),    -- 'pos_qt_24h' | 'pos_qt_48h' | 'retorno_agendado' | 'intercorrencia'
    ciclo_referencia            INTEGER,
    enfermeiro_oncologista      TEXT,
    mini_triagem_resumo         TEXT,
    conduta_realizada           TEXT,
    efetividade                 VARCHAR(30),    -- 'resolvido' | 'parcialmente_resolvido' | 'nao_resolvido' | 'piorou' | 'encaminhado'
    necessita_novo_seguimento   BOOLEAN         DEFAULT FALSE,
    texto_copiavel_prontuario   TEXT,
    status_seguimento           VARCHAR(20)     DEFAULT 'concluido',
    created_at                  TIMESTAMPTZ     DEFAULT NOW()
);

CREATE INDEX idx_seguimentos_paciente ON seguimentos_enfermagem(id_paciente);
CREATE INDEX idx_seguimentos_consulta_origem ON seguimentos_enfermagem(id_consulta_origem);

-- 2.12 seguimento_sintomas (mini-triagem)
CREATE TABLE seguimento_sintomas (
    id_seguimento_sintoma   SERIAL      PRIMARY KEY,
    id_seguimento           INTEGER     NOT NULL REFERENCES seguimentos_enfermagem(id_seguimento) ON DELETE CASCADE,
    tipo_sintoma            VARCHAR(30) NOT NULL,
    grau_ctcae              SMALLINT    CHECK (grau_ctcae BETWEEN 0 AND 4),
    melhorou_manteve_piorou VARCHAR(10), -- 'melhorou' | 'manteve' | 'piorou'
    observacao              TEXT
);


-- =============================================================================
-- BLOCO 5: QUIMIOTERAPIA
-- =============================================================================

-- 2.13 agendamentos_quimioterapia
CREATE TABLE agendamentos_quimioterapia (
    id_agendamento_qt   SERIAL          PRIMARY KEY,
    id_paciente         INTEGER         NOT NULL REFERENCES pacientes(id_paciente),
    data_agendada       DATE            NOT NULL,
    hora_agendada       TIME,
    protocolo           TEXT,
    ciclo               INTEGER,
    status              VARCHAR(20)     DEFAULT 'agendado',  -- 'agendado' | 'realizado' | 'cancelado' | 'reagendado'
    origem_agendamento  VARCHAR(30),    -- 'consulta' | 'seguimento' | 'manual'
    observacao          TEXT
);

CREATE INDEX idx_qt_paciente ON agendamentos_quimioterapia(id_paciente);
CREATE INDEX idx_qt_data ON agendamentos_quimioterapia(data_agendada);

-- 2.14 realizacao_quimioterapia
CREATE TABLE realizacao_quimioterapia (
    id_realizacao_qt        SERIAL      PRIMARY KEY,
    id_agendamento_qt       INTEGER     NOT NULL UNIQUE REFERENCES agendamentos_quimioterapia(id_agendamento_qt),
    realizada               BOOLEAN     NOT NULL,
    data_realizacao         DATE,
    motivo_nao_realizacao   TEXT,
    intercorrencia          TEXT,
    observacao              TEXT
);


-- =============================================================================
-- BLOCO 6: AGENDA E PENDÊNCIAS
-- =============================================================================

-- 2.15 tarefas_assistenciais
CREATE TABLE tarefas_assistenciais (
    id_tarefa           SERIAL          PRIMARY KEY,
    id_paciente         INTEGER         NOT NULL REFERENCES pacientes(id_paciente),
    origem              VARCHAR(30),    -- 'consulta' | 'seguimento' | 'manual'
    origem_clinica_id   INTEGER,        -- id_consulta ou id_seguimento de origem
    tipo_tarefa         VARCHAR(40)     NOT NULL,
    -- Tipos: 'contato_telefonico' | 'contato_rede' | 'contato_equipe_multidisciplinar' |
    --        'consulta_enfermagem' | 'reagendar_consulta' | 'agendar_consulta' |
    --        'reagendar_exame' | 'agendar_exame' | 'checagem_exame' | 'outra_demanda'
    data_prevista       DATE,
    hora_prevista       TIME,
    prioridade          VARCHAR(10)     DEFAULT 'padrao',  -- 'alta' | 'padrao'
    status              VARCHAR(20)     DEFAULT 'pendente',
    -- Status: 'agendada' | 'pendente' | 'concluida' | 'reagendada' | 'cancelada' | 'escalonada'
    responsavel         TEXT,
    conduta_realizada   TEXT,
    efetividade         VARCHAR(30),
    data_conclusao      TIMESTAMPTZ,
    observacao          TEXT,
    created_at          TIMESTAMPTZ     DEFAULT NOW()
);

CREATE INDEX idx_tarefas_paciente ON tarefas_assistenciais(id_paciente);
CREATE INDEX idx_tarefas_data ON tarefas_assistenciais(data_prevista);
CREATE INDEX idx_tarefas_status ON tarefas_assistenciais(status);

-- 2.16 pendencias_paciente
CREATE TABLE pendencias_paciente (
    id_pendencia        SERIAL          PRIMARY KEY,
    id_paciente         INTEGER         NOT NULL REFERENCES pacientes(id_paciente),
    tipo_pendencia      VARCHAR(40),
    descricao           TEXT,
    data_abertura       TIMESTAMPTZ     DEFAULT NOW(),
    status              VARCHAR(20)     DEFAULT 'aberta',  -- 'aberta' | 'resolvida'
    data_fechamento     TIMESTAMPTZ,
    responsavel         TEXT
);

CREATE INDEX idx_pendencias_paciente ON pendencias_paciente(id_paciente);


-- =============================================================================
-- BLOCO 7: TRIGGER — atualiza updated_at automaticamente
-- =============================================================================

CREATE OR REPLACE FUNCTION fn_set_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_pacientes_updated_at
    BEFORE UPDATE ON pacientes
    FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();

CREATE TRIGGER trg_consultas_updated_at
    BEFORE UPDATE ON consultas_enfermagem
    FOR EACH ROW EXECUTE FUNCTION fn_set_updated_at();


-- =============================================================================
-- BLOCO 8: VIEW de apoio — visão longitudinal do paciente (Tela 6.2)
-- =============================================================================

CREATE OR REPLACE VIEW vw_paciente_longitudinal AS
SELECT
    p.id_paciente,
    p.registro_instituicao,
    p.iniciais_nome,
    p.diagnostico_oncologico,
    p.protocolo_atual,
    p.ciclo_atual,
    p.data_ultima_qt,
    p.data_proxima_qt_prevista,
    p.status_paciente,
    -- Última consulta
    c.id_consulta                   AS ultima_consulta_id,
    c.data_hora                     AS ultima_consulta_data,
    c.classificacao_risco_validada  AS risco_atual,
    c.plano_cuidado_resumido,
    -- Tarefas pendentes (contagem)
    (SELECT COUNT(*) FROM tarefas_assistenciais t
     WHERE t.id_paciente = p.id_paciente AND t.status = 'pendente') AS qtd_tarefas_pendentes,
    -- Próximo seguimento previsto
    (SELECT ps.data_prevista FROM planos_seguimento ps
     WHERE ps.id_paciente = p.id_paciente AND ps.status = 'pendente'
     ORDER BY ps.data_prevista ASC LIMIT 1) AS proximo_seguimento_previsto
FROM
    pacientes p
    LEFT JOIN LATERAL (
        SELECT * FROM consultas_enfermagem
        WHERE id_paciente = p.id_paciente
        ORDER BY data_hora DESC LIMIT 1
    ) c ON TRUE;

COMMENT ON VIEW vw_paciente_longitudinal IS 'Visão consolidada para a Tela Longitudinal do Paciente (item 6.2 do documento de arquitetura).';
