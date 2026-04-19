-- =============================================================================
-- ONCOGUIA — Seed: Base Clínica NANDA / NIC / NOC
-- Gerado automaticamente a partir de ONCOGUIA-Base_Tecnica_NANDA_NIC_NOC_v1.xlsx
-- =============================================================================

-- 30 diagnósticos NANDA
INSERT INTO diagnosticos_nanda
  (codigo_nanda, dx_id_lc, titulo_diagnostico, dominio, classe, enunciado_pes,
   prioridade_sugerida, contexto_uso, aplicavel_ambulatorio, aplicavel_adulto,
   aplicavel_pediatrico, aplicavel_telemonitoramento, aplicavel_protocolo_oral,
   aplicavel_intercorrencia, ativo, observacoes_modelagem)
VALUES
  ('00134', 'DX001', 'Náusea', 'Domínio 12 — Conforto', 'Classe 1 — Conforto Físico', 'Náusea relacionada ao regime quimioterápico evidenciada por relato de sensação nauseante, salivação aumentada e taquicardia', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00004', 'DX002', 'Risco de Infecção', 'Domínio 11 — Segurança/Proteção', 'Classe 1 — Infecção', 'Risco de infecção relacionado à imunossupressão induzida pela quimioterapia (neutropenia), ruptura da barreira mucosa e dispositivos invasivos', 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00132', 'DX003', 'Dor Aguda', 'Domínio 12 — Conforto', 'Classe 1 — Conforto Físico', 'Dor aguda relacionada ao processo neoplásico e/ou procedimentos terapêuticos evidenciada por relato verbal, expressão facial de dor e EVA ≥4', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00133', 'DX004', 'Dor Crônica', 'Domínio 12 — Conforto', 'Classe 1 — Conforto Físico', 'Dor crônica relacionada à infiltração neoplásica e/ou neuropatia periférica induzida pela quimioterapia evidenciada por relato de dor persistente há mais de 3 meses e alterações funcionais', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00093', 'DX005', 'Fadiga', 'Domínio 4 — Atividade/Repouso', 'Classe 3 — Equilíbrio de Energia', 'Fadiga relacionada ao tratamento quimioterápico, anemia e processo neoplásico evidenciada por relato de cansaço desproporcional ao esforço, redução da capacidade funcional e ESAS ≥4', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00045', 'DX006', 'Integridade da Mucosa Oral Prejudicada', 'Domínio 11 — Segurança/Proteção', 'Classe 2 — Lesão Física', 'Integridade da mucosa oral prejudicada relacionada aos efeitos citotóxicos da quimioterapia evidenciada por ulcerações orais, dor, eritema e disfagia (mucosite grau ≥2 OMS)', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00002', 'DX007', 'Nutrição Desequilibrada: Menor que as Necessidades Corporais', 'Domínio 2 — Nutrição', 'Classe 1 — Ingestão', 'Nutrição desequilibrada: menor que as necessidades corporais relacionada à náusea, mucosite, anorexia e hipercatabolismo neoplásico evidenciada por perda de peso >5% em 3 meses e ingestão calórica insuficiente', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00146', 'DX008', 'Ansiedade', 'Domínio 9 — Enfrentamento/Tolerância ao Estresse', 'Classe 2 — Respostas de Enfrentamento', 'Ansiedade relacionada ao diagnóstico oncológico, incerteza do prognóstico e efeitos adversos do tratamento evidenciada por relato verbal, tensão, preocupação excessiva e ESAS ≥4 para ansiedade', 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00148', 'DX009', 'Medo', 'Domínio 9 — Enfrentamento/Tolerância ao Estresse', 'Classe 2 — Respostas de Enfrentamento', 'Medo relacionado ao diagnóstico de câncer, possibilidade de recidiva e morte evidenciado por relato de pavor, comportamento de fuga de informações e sintomas somáticos de medo', 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00126', 'DX010', 'Déficit de Conhecimento', 'Domínio 5 — Percepção/Cognição', 'Classe 4 — Cognição', 'Déficit de conhecimento sobre o regime quimioterápico, manejo de efeitos adversos e sinais de alarme relacionado à falta de exposição à informação evidenciado por verbalização de dúvidas, comportamentos inadequados e não adesão a orientações', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00047', 'DX011', 'Risco de Integridade da Pele Prejudicada', 'Domínio 11 — Segurança/Proteção', 'Classe 2 — Lesão Física', 'Risco de integridade da pele prejudicada relacionado à extravasamento de agentes quimioterápicos vesicantes/irritantes, síndrome mão-pé (PPE) e imunossupressão', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00095', 'DX012', 'Insônia', 'Domínio 4 — Atividade/Repouso', 'Classe 1 — Repouso/Sono', 'Insônia relacionada ao tratamento quimioterápico, dor, ansiedade e uso de corticosteroides evidenciada por relato de dificuldade para iniciar ou manter o sono e sono não reparador', 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00013', 'DX013', 'Diarreia', 'Domínio 3 — Eliminação e Troca', 'Classe 2 — Função Gastrintestinal', 'Diarreia relacionada à quimioterapia (fluoropirimidinas, irinotecano, taxanos) e alteração da flora intestinal evidenciada por evacuações líquidas frequentes (>3/dia), cólicas e urgência fecal', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00011', 'DX014', 'Constipação', 'Domínio 3 — Eliminação e Troca', 'Classe 2 — Função Gastrintestinal', 'Constipação relacionada ao uso de opioides, antieméticos (ondansetrona), redução da ingestão hídrica e imobilidade evidenciada por evacuações <3x/semana, fezes endurecidas e esforço evacuatório', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00029', 'DX015', 'Débito Cardíaco Diminuído', 'Domínio 4 — Atividade/Repouso', 'Classe 4 — Respostas Cardiovasculares/Pulmonares', 'Risco de débito cardíaco diminuído relacionado à cardiotoxicidade induzida por antracíclicos, trastuzumabe e outros agentes cardiotóxicos', 'Alta', 'Ambulatório; Intercorrência; Seguimento', TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00027', 'DX016', 'Déficit de Volume de Líquidos', 'Domínio 2 — Nutrição', 'Classe 5 — Hidratação', 'Déficit de volume de líquidos relacionado a perdas excessivas por vômito, diarreia e redução da ingestão oral evidenciado por mucosas secas, redução da diurese, taquicardia e perda de peso aguda', 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00118', 'DX017', 'Imagem Corporal Perturbada', 'Domínio 6 — Autopercepção', 'Classe 3 — Imagem Corporal', 'Imagem corporal perturbada relacionada à alopecia, perda de peso, cicatrizes cirúrgicas e alterações físicas induzidas pela quimioterapia evidenciada por verbalização de insatisfação com o corpo e comportamentos de ocultação', 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00078', 'DX018', 'Gerenciamento Ineficaz da Saúde', 'Domínio 1 — Promoção da Saúde', 'Classe 2 — Manejo da Saúde', 'Gerenciamento ineficaz da saúde relacionado à complexidade do regime terapêutico e barreiras socioeconômicas evidenciado por faltas ao tratamento, não adesão a medicamentos e ausência em consultas de seguimento', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00085', 'DX019', 'Mobilidade Física Prejudicada', 'Domínio 4 — Atividade/Repouso', 'Classe 2 — Atividade/Exercício', 'Mobilidade física prejudicada relacionada à neuropatia periférica induzida pela quimioterapia, fadiga e dor evidenciada por alteração da marcha, redução da amplitude de movimento e limitação das AVDs', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00136', 'DX020', 'Luto', 'Domínio 9 — Enfrentamento/Tolerância ao Estresse', 'Classe 2 — Respostas de Enfrentamento', 'Luto relacionado ao diagnóstico de câncer, perdas funcionais e existenciais evidenciado por tristeza, choro, dificuldade de aceitar as mudanças e verbalização de perda de sentido', 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00155', 'DX021', 'Risco de Quedas', 'Domínio 11 — Segurança/Proteção', 'Classe 2 — Lesão Física', 'Risco de quedas relacionado à neuropatia periférica, fadiga, hipotensão ortostática induzida por medicamentos e alteração do equilíbrio', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00032', 'DX022', 'Padrão Respiratório Ineficaz', 'Domínio 4 — Atividade/Repouso', 'Classe 4 — Respostas Cardiovasculares/Pulmonares', 'Risco de padrão respiratório ineficaz relacionado à toxicidade pulmonar por bleomicina, metotrexato ou outros agentes pneumotóxicos e derrame pleural neoplásico', 'Alta', 'Ambulatório; Intercorrência; Seguimento', TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00179', 'DX023', 'Risco de Nível de Glicemia Instável', 'Domínio 2 — Nutrição', 'Classe 4 — Metabolismo', 'Risco de nível de glicemia instável relacionado ao uso de corticosteroides no esquema antiemético, diabetes mellitus preexistente e estresse metabólico do processo neoplásico', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00205', 'DX024', 'Risco de Choque', 'Domínio 11 — Segurança/Proteção', 'Classe 2 — Lesão Física', 'Risco de choque relacionado à reação de hipersensibilidade grave a agentes quimioterápicos (taxanos, carboplatina, asparaginase), neutropenia febril e instabilidade hemodinâmica', 'Alta', 'Ambulatório; Intercorrência; Seguimento', TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00061', 'DX025', 'Tensão do Papel de Cuidador', 'Domínio 7 — Papéis e Relacionamentos', 'Classe 1 — Papéis de Cuidado', 'Tensão do papel de cuidador relacionada à complexidade dos cuidados ao paciente oncológico, sobrecarga emocional e física e falta de suporte ao cuidador evidenciada por relato de exaustão, estresse e dificuldades para o cuidado', 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00023', 'DX026', 'Retenção Urinária', 'Domínio 3 — Eliminação e Troca', 'Classe 1 — Função Urinária', 'Risco de retenção urinária relacionado à neuropatia autonômica induzida por agentes neurotóxicos (vincristina, cisplatina) e uso de opioides', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00124', 'DX027', 'Desesperança', 'Domínio 6 — Autopercepção', 'Classe 1 — Autoconceito', 'Desesperança relacionada à doença oncológica avançada, falha terapêutica ou progressão de doença evidenciada por verbalização de ausência de perspectiva, passividade e recusa de cuidados', 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00007', 'DX028', 'Hipertermia', 'Domínio 11 — Segurança/Proteção', 'Classe 6 — Termorregulação', 'Hipertermia relacionada à neutropenia febril induzida pela quimioterapia e/ou processo infeccioso oportunista evidenciada por temperatura axilar ≥37,8°C ou oral ≥38,3°C', 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00108', 'DX029', 'Déficit no Autocuidado para Banho', 'Domínio 4 — Atividade/Repouso', 'Classe 5 — Autocuidado', 'Déficit no autocuidado para banho relacionado à fadiga intensa, neuropatia periférica, dor e redução da mobilidade evidenciado por incapacidade ou dificuldade para realizar higiene corporal sem auxílio', 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.'),
  ('00054', 'DX030', 'Isolamento Social', 'Domínio 12 — Conforto', 'Classe 3 — Conforto Social', 'Isolamento social relacionado ao afastamento das atividades habituais por doença e tratamento, medo de contágio e alterações da imagem corporal evidenciado por relato de solidão, redução de contatos sociais e retraimento', 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, TRUE, 'Validar aplicabilidade local e regras de sugestão clínica antes da implantação.');

-- 80 intervenções NIC
INSERT INTO intervencoes_nic (codigo_nic, nic_id_lc, nome_intervencao, ativo)
VALUES
  (1450, 'NIC001', 'Manejo da Náusea', TRUE),
  (1570, 'NIC002', 'Manejo do Vômito', TRUE),
  (5614, 'NIC003', 'Ensino: Dieta Prescrita', TRUE),
  (6482, 'NIC004', 'Manejo Ambiental: Conforto', TRUE),
  (2300, 'NIC005', 'Administração de Medicamentos', TRUE),
  (6550, 'NIC006', 'Proteção contra Infecção', TRUE),
  (6540, 'NIC007', 'Controle de Infecção', TRUE),
  (6552, 'NIC008', 'Monitoramento do Nadir', TRUE),
  (5602, 'NIC009', 'Ensino: Processo de Doença', TRUE),
  (6530, 'NIC010', 'Manejo da Anafilaxia / Reação de Hipersensibilidade', TRUE),
  (1400, 'NIC011', 'Manejo da Dor', TRUE),
  (2210, 'NIC012', 'Administração de Analgésicos', TRUE),
  (5270, 'NIC013', 'Suporte Emocional', TRUE),
  (2380, 'NIC014', 'Manejo de Medicamentos', TRUE),
  (1320, 'NIC015', 'Acupressão / Técnicas Complementares', TRUE),
  (5246, 'NIC016', 'Aconselhamento Nutricional para Dor Neuropática', TRUE),
  (180, 'NIC017', 'Manejo da Energia', TRUE),
  (200, 'NIC018', 'Promoção do Exercício Físico', TRUE),
  (1800, 'NIC019', 'Assistência ao Autocuidado', TRUE),
  (1060, 'NIC020', 'Terapia Nutricional', TRUE),
  (1710, 'NIC021', 'Manutenção da Saúde Oral', TRUE),
  (1720, 'NIC022', 'Promoção da Saúde Oral', TRUE),
  (1860, 'NIC023', 'Terapia de Deglutição', TRUE),
  (1100, 'NIC024', 'Manejo da Nutrição', TRUE),
  (1160, 'NIC025', 'Monitoramento Nutricional', TRUE),
  (1050, 'NIC026', 'Alimentação', TRUE),
  (1240, 'NIC027', 'Assistência para Ganho de Peso', TRUE),
  (5820, 'NIC028', 'Redução da Ansiedade', TRUE),
  (5230, 'NIC029', 'Aumento do Enfrentamento', TRUE),
  (6040, 'NIC030', 'Terapia de Relaxamento', TRUE),
  (5380, 'NIC031', 'Aumento da Segurança', TRUE),
  (7140, 'NIC032', 'Suporte à Família', TRUE),
  (5606, 'NIC033', 'Ensino: Individual', TRUE),
  (5616, 'NIC034', 'Ensino: Medicamentos Prescritos', TRUE),
  (5618, 'NIC035', 'Ensino: Procedimento/Tratamento', TRUE),
  (7370, 'NIC036', 'Planejamento de Alta', TRUE),
  (3590, 'NIC037', 'Vigilância da Pele', TRUE),
  (3660, 'NIC038', 'Cuidado com Feridas', TRUE),
  (480, 'NIC039', 'Cuidado com Ostomia/Acesso', TRUE),
  (3500, 'NIC040', 'Manejo da Pressão', TRUE),
  (1850, 'NIC041', 'Promoção do Sono', TRUE),
  (430, 'NIC042', 'Manejo da Diarreia', TRUE),
  (450, 'NIC043', 'Manejo da Constipação/Impactação', TRUE),
  (4120, 'NIC044', 'Manejo de Fluidos', TRUE),
  (4040, 'NIC045', 'Cuidado Cardíaco', TRUE),
  (4044, 'NIC046', 'Cuidado Cardíaco: Agudo', TRUE),
  (6650, 'NIC047', 'Vigilância', TRUE),
  (4150, 'NIC048', 'Regulação Hemodinâmica', TRUE),
  (4130, 'NIC049', 'Monitoramento de Fluidos', TRUE),
  (5220, 'NIC050', 'Melhora da Imagem Corporal', TRUE),
  (5440, 'NIC051', 'Aumento do Sistema de Apoio', TRUE),
  (5400, 'NIC052', 'Aumento da Autoestima', TRUE),
  (4360, 'NIC053', 'Modificação do Comportamento', TRUE),
  (8100, 'NIC054', 'Encaminhamento', TRUE),
  (7910, 'NIC055', 'Consulta Multiprofissional', TRUE),
  (221, 'NIC056', 'Terapia com Exercícios: Deambulação', TRUE),
  (840, 'NIC057', 'Mudança de Posição', TRUE),
  (5290, 'NIC058', 'Facilitação do Processo de Luto', TRUE),
  (5280, 'NIC059', 'Facilitação do Perdão', TRUE),
  (6490, 'NIC060', 'Prevenção de Quedas', TRUE),
  (3140, 'NIC061', 'Manejo das Vias Aéreas', TRUE),
  (3350, 'NIC062', 'Monitoramento Respiratório', TRUE),
  (3320, 'NIC063', 'Oxigenoterapia', TRUE),
  (2120, 'NIC064', 'Manejo da Hiperglicemia', TRUE),
  (2130, 'NIC065', 'Manejo da Hipoglicemia', TRUE),
  (4250, 'NIC066', 'Manejo do Choque', TRUE),
  (6412, 'NIC067', 'Manejo da Anafilaxia', TRUE),
  (7040, 'NIC068', 'Suporte ao Cuidador', TRUE),
  (7110, 'NIC069', 'Aumento do Envolvimento Familiar', TRUE),
  (590, 'NIC070', 'Manejo da Eliminação Urinária', TRUE),
  (610, 'NIC071', 'Cuidado com Cateter Urinário', TRUE),
  (570, 'NIC072', 'Treinamento da Bexiga', TRUE),
  (5310, 'NIC073', 'Instilação de Esperança', TRUE),
  (7290, 'NIC074', 'Promoção da Integridade Familiar', TRUE),
  (3740, 'NIC075', 'Tratamento da Febre', TRUE),
  (3900, 'NIC076', 'Regulação da Temperatura', TRUE),
  (1801, 'NIC077', 'Assistência ao Autocuidado: Banho/Higiene', TRUE),
  (740, 'NIC078', 'Cuidado com o Paciente Acamado', TRUE),
  (6480, 'NIC079', 'Manejo Ambiental Domiciliar', TRUE),
  (5100, 'NIC080', 'Aumento da Socialização', TRUE);

-- 62 resultados NOC
INSERT INTO resultados_noc (codigo_noc, noc_id_lc, nome_resultado, ativo)
VALUES
  (1618, 'NOC001', 'Controle de Náusea e Vômito', TRUE),
  (1014, 'NOC002', 'Apetite', TRUE),
  (2109, 'NOC003', 'Nível de Desconforto', TRUE),
  (702, 'NOC004', 'Estado Imunológico', TRUE),
  (1902, 'NOC005', 'Controle do Risco', TRUE),
  (1101, 'NOC006', 'Integridade Tissular: Pele e Mucosas', TRUE),
  (2102, 'NOC007', 'Nível de Dor', TRUE),
  (2100, 'NOC008', 'Nível de Conforto', TRUE),
  (1605, 'NOC009', 'Controle da Dor', TRUE),
  (2000, 'NOC010', 'Qualidade de Vida', TRUE),
  (1307, 'NOC011', 'Adaptação à Doença Crônica', TRUE),
  (1, 'NOC012', 'Resistência', TRUE),
  (2, 'NOC013', 'Conservação de Energia', TRUE),
  (1100, 'NOC014', 'Saúde Oral', TRUE),
  (1004, 'NOC015', 'Estado Nutricional', TRUE),
  (1006, 'NOC016', 'Ingestão de Nutrientes', TRUE),
  (1402, 'NOC017', 'Controle da Ansiedade', TRUE),
  (1300, 'NOC018', 'Aceitação: Estado de Saúde', TRUE),
  (1603, 'NOC019', 'Comportamento de Busca de Saúde', TRUE),
  (1404, 'NOC020', 'Autocontrole do Medo', TRUE),
  (2600, 'NOC021', 'Enfrentamento dos Problemas pela Família', TRUE),
  (1820, 'NOC022', 'Conhecimento: Controle da Doença', TRUE),
  (1803, 'NOC023', 'Conhecimento: Processo da Doença', TRUE),
  (1813, 'NOC024', 'Conhecimento: Regime Terapêutico', TRUE),
  (1103, 'NOC025', 'Cicatrização de Feridas: Primeira Intenção', TRUE),
  (4, 'NOC026', 'Sono', TRUE),
  (2002, 'NOC027', 'Bem-Estar Pessoal', TRUE),
  (501, 'NOC028', 'Eliminação Intestinal', TRUE),
  (601, 'NOC029', 'Equilíbrio Hídrico', TRUE),
  (602, 'NOC030', 'Hidratação', TRUE),
  (400, 'NOC031', 'Efetividade da Bomba Cardíaca', TRUE),
  (401, 'NOC032', 'Estado Circulatório', TRUE),
  (500, 'NOC033', 'Eliminação Urinária', TRUE),
  (1200, 'NOC034', 'Imagem Corporal', TRUE),
  (1205, 'NOC035', 'Autoestima', TRUE),
  (1303, 'NOC036', 'Resolução do Luto', TRUE),
  (1601, 'NOC037', 'Adesão ao Comportamento', TRUE),
  (1609, 'NOC038', 'Comportamento Terapêutico: Doença ou Lesão', TRUE),
  (2605, 'NOC039', 'Participação da Família no Cuidado Profissional de Saúde', TRUE),
  (208, 'NOC040', 'Mobilidade', TRUE),
  (200, 'NOC041', 'Resistência ao Exercício', TRUE),
  (1304, 'NOC042', 'Resolução do Luto', TRUE),
  (1909, 'NOC043', 'Comportamento de Prevenção de Quedas', TRUE),
  (1828, 'NOC044', 'Conhecimento: Prevenção de Quedas', TRUE),
  (1912, 'NOC045', 'Quedas', TRUE),
  (403, 'NOC046', 'Estado Respiratório: Ventilação', TRUE),
  (402, 'NOC047', 'Estado Respiratório: Troca de Gases', TRUE),
  (2300, 'NOC048', 'Nível de Glicemia', TRUE),
  (2111, 'NOC049', 'Gravidade da Hiperglicemia', TRUE),
  (414, 'NOC050', 'Estado do Choque', TRUE),
  (802, 'NOC051', 'Sinais Vitais', TRUE),
  (2202, 'NOC052', 'Preparo do Cuidador Familiar para o Cuidado Domiciliar', TRUE),
  (2208, 'NOC053', 'Fatores de Estresse do Cuidador Familiar', TRUE),
  (503, 'NOC054', 'Eliminação Urinária', TRUE),
  (1201, 'NOC055', 'Esperança', TRUE),
  (1409, 'NOC056', 'Autocontrole da Depressão', TRUE),
  (800, 'NOC057', 'Termorregulação', TRUE),
  (703, 'NOC058', 'Gravidade da Infecção', TRUE),
  (301, 'NOC059', 'Autocuidado: Banho', TRUE),
  (300, 'NOC060', 'Autocuidado: Atividades da Vida Diária', TRUE),
  (1308, 'NOC061', 'Adaptação à Incapacidade Física', TRUE),
  (1503, 'NOC062', 'Envolvimento Social', TRUE);

-- 150 relações NANDA → NIC
INSERT INTO mapa_nanda_nic
  (dx_nic_id_lc, codigo_nanda, codigo_nic, prioridade_sugerida, contexto_uso_sugerido,
   atividades_profissionais, orientacao_paciente_sugerida, ativo)
VALUES
  ('DXNIC0001', '00134', 1450, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar frequência, duração e intensidade da náusea; administrar antiemético prescrito em horário fixo; orientar dieta fracionada com alimentos frios e de fácil digestão; reduzir estímulos olfativos no ambiente; registrar episódios e resposta à terapêutica', 'Orientar dieta fracionada com alimentos frios e de fácil digestão
Reduzir estímulos olfativos no ambiente', TRUE),
  ('DXNIC0002', '00134', 1570, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar equilíbrio hidroeletrolítico; manter acesso venoso pérvio para hidratação de resgate; posicionar paciente em decúbito lateral durante episódios; registrar características do vômito (frequência, volume, aspecto); acionar médico se vômito grau ≥3 CTCAE', 'Manter acesso venoso pérvio para hidratação de resgate', TRUE),
  ('DXNIC0003', '00134', 5614, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar fracionamento de refeições (6x/dia); recomendar alimentos frios, secos e de baixo teor lipídico; desestimular odores fortes no ambiente domiciliar; orientar ingestão hídrica entre refeições; fornecer material educativo escrito', 'Orientar fracionamento de refeições (6x/dia)
Recomendar alimentos frios, secos e de baixo teor lipídico
Orientar ingestão hídrica entre refeições', TRUE),
  ('DXNIC0004', '00134', 6482, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Reduzir estímulos ambientais (odor, barulho, iluminação); manter ambiente arejado; oferecer bala de gengibre ou chá frio conforme preferência; respeitar preferências do paciente quanto ao ambiente', 'Reduzir estímulos ambientais (odor, barulho, iluminação)
Manter ambiente arejado
Oferecer bala de gengibre ou chá frio conforme preferência
Respeitar preferências do paciente quanto ao ambiente', TRUE),
  ('DXNIC0005', '00134', 2300, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Conferir 5 certos antes de administrar antiemético; registrar horário, dose e via; monitorar efeitos adversos (sedação, constipação, cefaleia); orientar esquema domiciliar pós-alta; documentar eficácia do antiemético no prontuário', 'Orientar esquema domiciliar pós-alta', TRUE),
  ('DXNIC0006', '00004', 6550, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar ANC antes de cada ciclo; orientar paciente e família sobre sinais de infecção; recomendar evitar aglomerações e contato com doentes; orientar higiene rigorosa das mãos; rastrear temperatura domiciliar diária no nadir', 'Orientar paciente e família sobre sinais de infecção
Recomendar evitar aglomerações e contato com doentes
Orientar higiene rigorosa das mãos', TRUE),
  ('DXNIC0007', '00004', 6540, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Aplicar técnica asséptica rigorosa em procedimentos invasivos; higienizar mãos antes e após contato com paciente; inspecionar acesso venoso diariamente; orientar cuidados com cateter/PAC; garantir descarte adequado de materiais', 'Aplicar técnica asséptica rigorosa em procedimentos invasivos
Orientar cuidados com cateter/PAC', TRUE),
  ('DXNIC0008', '00004', 6552, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar período de nadir esperado conforme protocolo (D+7 a D+14); solicitar hemograma no nadir; orientar contato imediato se Tax ≥38,3°C; definir fluxo de atendimento de urgência para febre neutropênica; registrar ANC nadir em cada ciclo', 'Orientar período de nadir esperado conforme protocolo (D+7 a D+14)
Orientar contato imediato se Tax ≥38,3°C', TRUE),
  ('DXNIC0009', '00004', 5602, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Explicar mecanismo da neutropenia induzida pela QT; orientar sobre alimentos de risco (crus, não pasteurizados); recomendar higiene rigorosa de feridas e mucosas; fornecer ficha de orientação sobre febre neutropênica; orientar não usar termômetro retal', 'Explicar mecanismo da neutropenia induzida pela QT
Orientar sobre alimentos de risco (crus, não pasteurizados)
Recomendar higiene rigorosa de feridas e mucosas
Orientar não usar termômetro retal', TRUE),
  ('DXNIC0010', '00004', 6530, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Manter kit de emergência disponível; monitorar sinais de hipersensibilidade nos primeiros 30 minutos de infusão; estabelecer protocolo de febre neutropênica institucional; acionar médico imediatamente se Tax ≥38,3°C com ANC <500; documentar episódios febris', NULL, TRUE),
  ('DXNIC0011', '00132', 1400, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar dor com EVA a cada consulta; identificar localização, caráter, irradiação e fatores de melhora/piora; verificar adesão à analgesia prescrita; registrar e notificar médico se EVA ≥7; documentar resposta às intervenções', NULL, TRUE),
  ('DXNIC0012', '00132', 2210, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Conferir prescrição analgésica antes da administração; orientar horário fixo (não aguardar piora da dor); monitorar efeitos adversos (constipação, sedação, náusea); orientar não interromper analgesia sem orientação médica; registrar eficácia em prontuário', 'Orientar horário fixo (não aguardar piora da dor)
Orientar não interromper analgesia sem orientação médica', TRUE),
  ('DXNIC0013', '00132', 6482, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Proporcionar posicionamento confortável; aplicar técnicas não farmacológicas (calor/frio localizado, massagem superficial, distração); reduzir estímulos ambientais; respeitar preferências do paciente; registrar técnicas eficazes para o indivíduo', 'Aplicar técnicas não farmacológicas (calor/frio localizado, massagem superficial, distração)
Reduzir estímulos ambientais
Respeitar preferências do paciente', TRUE),
  ('DXNIC0014', '00132', 5270, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Validar a experiência dolorosa do paciente; demonstrar escuta ativa; envolver família no plano de conforto; encaminhar para clínica de dor se EVA persistente ≥7; oferecer suporte psicológico quando indicado', 'Validar a experiência dolorosa do paciente
Envolver família no plano de conforto
Oferecer suporte psicológico quando indicado', TRUE),
  ('DXNIC0015', '00132', 2380, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Revisar medicamentos em uso para identificar interações analgésicas; orientar escalonamento da OMS (degraus); alertar sobre sinais de toxicidade opioide; educar sobre uso correto de analgésicos de resgate; registrar consumo de resgate por ciclo', 'Orientar escalonamento da OMS (degraus)', TRUE),
  ('DXNIC0016', '00133', 1400, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar EVA, localização e impacto funcional a cada consulta; monitorar neuropatia periférica (parestesia, queimação, fraqueza distal); ajustar avaliação conforme grau CTCAE; encaminhar para clínica de dor se refratária; manter registro longitudinal da dor', 'Manter registro longitudinal da dor', TRUE),
  ('DXNIC0017', '00133', 1320, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar técnicas de relaxamento e distração; ensinar auto-aplicação de calor/frio; encaminhar para fisioterapia quando indicado; orientar sobre TENS se disponível; integrar abordagem não farmacológica ao plano de cuidado', 'Orientar técnicas de relaxamento e distração
Ensinar auto-aplicação de calor/frio
Orientar sobre TENS se disponível', TRUE),
  ('DXNIC0018', '00133', 5246, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sobre alimentos anti-inflamatórios; avaliar déficit de vitamina B12 associado à neuropatia; encaminhar para nutricionista; monitorar peso e estado nutricional; registrar correlação entre nutrição e sintomas', 'Orientar sobre alimentos anti-inflamatórios', TRUE),
  ('DXNIC0019', '00133', 5270, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar impacto da dor crônica na qualidade de vida (ESAS); encaminhar para psicologia; envolver rede de apoio; validar limitações funcionais; oferecer recursos de suporte espiritual se desejado', 'Validar limitações funcionais
Oferecer recursos de suporte espiritual se desejado', TRUE),
  ('DXNIC0020', '00133', 2380, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Revisar escalonamento analgésico da OMS; monitorar uso de gabapentina/amitriptilina para dor neuropática; orientar não interromper abruptamente; registrar efeitos adversos; acionar médico para ajuste de dose se controle insatisfatório', 'Orientar não interromper abruptamente', TRUE),
  ('DXNIC0021', '00093', 180, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Aplicar escala de fadiga (ESAS/BFI) a cada consulta; identificar causas tratáveis (anemia, dor, distúrbios do sono, depressão); planejar atividades nas horas de maior disposição; orientar períodos de repouso estratégicos; monitorar ECOG a cada ciclo', 'Aplicar escala de fadiga (ESAS/BFI) a cada consulta
Orientar períodos de repouso estratégicos', TRUE),
  ('DXNIC0022', '00093', 200, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Prescrever atividade física adaptada (caminhada 20-30min/dia se ECOG 0-2); encaminhar para fisioterapia/reabilitação oncológica; orientar sobre benefícios do exercício na fadiga relacionada ao câncer; monitorar tolerância ao esforço; reavaliar a cada ciclo', 'Orientar sobre benefícios do exercício na fadiga relacionada ao câncer', TRUE),
  ('DXNIC0023', '00093', 1800, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar priorização de atividades essenciais; ensinar técnicas de conservação de energia; envolver cuidador no suporte às AVDs; adaptar ambiente domiciliar para segurança; avaliar necessidade de auxílio para AVDs básicas', 'Orientar priorização de atividades essenciais
Ensinar técnicas de conservação de energia
Adaptar ambiente domiciliar para segurança', TRUE),
  ('DXNIC0024', '00093', 5270, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Validar experiência de fadiga (frequentemente subestimada); diferenciar fadiga de depressão; encaminhar para psicologia se componente emocional significativo; aplicar ESAS regularmente; registrar impacto na qualidade de vida', 'Validar experiência de fadiga (frequentemente subestimada)
Aplicar ESAS regularmente', TRUE),
  ('DXNIC0025', '00093', 1060, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar Hb e ferritina como causas tratáveis de fadiga; encaminhar para nutricionista; orientar dieta hiperproteica e hipercalórica; avaliar necessidade de suplementação oral; monitorar peso a cada ciclo', 'Orientar dieta hiperproteica e hipercalórica', TRUE),
  ('DXNIC0026', '00045', 1710, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar mucosa oral a cada consulta (escala OMS 0-4); orientar escovação com escova macia 4x/dia; prescrever bochechos com solução salina 0,9% após cada refeição; contraindicar enxaguantes alcoólicos; registrar grau de mucosite por ciclo', 'Orientar escovação com escova macia 4x/dia', TRUE),
  ('DXNIC0027', '00045', 1720, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Encaminhar para cirurgião-dentista antes do início da QT; orientar higiene de próteses dentárias; recomendar hidratação labial; orientar sobre sinais de progressão (disfagia, sangramento, febre); fornecer material educativo sobre cuidados orais', 'Orientar higiene de próteses dentárias
Recomendar hidratação labial
Orientar sobre sinais de progressão (disfagia, sangramento, febre)', TRUE),
  ('DXNIC0028', '00045', 1400, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Prescrever analgesia tópica (lidocaína gel) conforme prescrição médica; orientar alimentação fria e pastosa em mucosite grau ≥2; monitorar impacto na ingestão oral; acionar médico se disfagia impedir hidratação; avaliar necessidade de suporte nutricional enteral', 'Orientar alimentação fria e pastosa em mucosite grau ≥2', TRUE),
  ('DXNIC0029', '00045', 1860, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar capacidade de deglutição em mucosite grau ≥3; encaminhar para fonoaudiologia; orientar consistência alimentar adequada; monitorar risco de aspiração; registrar evolução da deglutição', 'Orientar consistência alimentar adequada', TRUE),
  ('DXNIC0030', '00045', 6540, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Colher cultura de lesões suspeitas de infecção fúngica/viral; orientar antifúngico tópico se prescrito; monitorar sinais de candidíase oral; orientar isolamento de utensílios domésticos; registrar e notificar infecções orais oportunistas', 'Orientar antifúngico tópico se prescrito
Orientar isolamento de utensílios domésticos', TRUE),
  ('DXNIC0031', '00002', 1100, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Aplicar triagem nutricional NRS-2002 a cada consulta; calcular necessidades calóricas (25-30 kcal/kg/dia) e proteicas (1,2-2,0 g/kg/dia); orientar dieta hipercalórica e hiperproteica fracionada; monitorar peso e SC a cada ciclo; registrar variação ponderal', 'Aplicar triagem nutricional NRS-2002 a cada consulta
Orientar dieta hipercalórica e hiperproteica fracionada', TRUE),
  ('DXNIC0032', '00002', 1160, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar albumina, pré-albumina e hemoglobina; registrar percentual de perda de peso por ciclo; avaliar ingestão alimentar por recordatório 24h; monitorar sinais de desidratação; encaminhar para nutricionista se perda ≥5% em 3 meses', NULL, TRUE),
  ('DXNIC0033', '00002', 5614, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar suplementação oral hipercalórica (200-400 kcal/dia extra); ensinar enriquecimento calórico de preparações (azeite, leite em pó, mel); fornecer material educativo sobre alimentação durante QT; desmistificar restrições alimentares desnecessárias; orientar sobre alimentos de risco em imunossupressão', 'Orientar suplementação oral hipercalórica (200-400 kcal/dia extra)
Ensinar enriquecimento calórico de preparações (azeite, leite em pó, mel)
Desmistificar restrições alimentares desnecessárias
Orientar sobre alimentos de risco em imunossupressão', TRUE),
  ('DXNIC0034', '00002', 1050, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Oferecer pequenas refeições frequentes (6-8x/dia); orientar ambiente agradável durante refeições; identificar alimentos preferidos e tolerados; adaptar consistência conforme sintomas; monitorar aceitação alimentar e registrar', 'Oferecer pequenas refeições frequentes (6-8x/dia)
Orientar ambiente agradável durante refeições
Adaptar consistência conforme sintomas', TRUE),
  ('DXNIC0035', '00002', 1240, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Encaminhar para nutricionista para prescrição individualizada; avaliar indicação de suplemento oral ou nutrição enteral; monitorar evolução ponderal quinzenalmente; orientar família/cuidador sobre preparo de refeições enriquecidas; registrar evolução nutricional', 'Orientar família/cuidador sobre preparo de refeições enriquecidas', TRUE),
  ('DXNIC0036', '00146', 5820, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Aplicar ESAS para ansiedade a cada consulta; estabelecer comunicação terapêutica com escuta ativa; fornecer informações claras sobre o tratamento e o que esperar; respeitar o ritmo de adaptação do paciente; encaminhar para psicologia se ESAS ≥7', 'Aplicar ESAS para ansiedade a cada consulta
Respeitar o ritmo de adaptação do paciente', TRUE),
  ('DXNIC0037', '00146', 5270, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Validar sentimentos e medos expressos; envolver família/rede de apoio nas consultas; identificar estratégias de enfrentamento prévias do paciente; conectar com grupos de apoio oncológico; oferecer suporte espiritual se desejado', 'Validar sentimentos e medos expressos
Envolver família/rede de apoio nas consultas
Conectar com grupos de apoio oncológico
Oferecer suporte espiritual se desejado', TRUE),
  ('DXNIC0038', '00146', 5230, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Identificar recursos internos e externos de enfrentamento; promover autonomia nas decisões sobre o cuidado; orientar sobre direitos do paciente oncológico no SUS; encaminhar para serviço social se vulnerabilidade socioeconômica; registrar estratégias eficazes', 'Promover autonomia nas decisões sobre o cuidado
Orientar sobre direitos do paciente oncológico no SUS', TRUE),
  ('DXNIC0039', '00146', 5602, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Desmistificar o tratamento quimioterápico; explicar com linguagem acessível os efeitos adversos esperados; disponibilizar material educativo impresso; realizar ensino com teach-back; esclarecer dúvidas de forma objetiva e empática', 'Desmistificar o tratamento quimioterápico
Explicar com linguagem acessível os efeitos adversos esperados
Realizar ensino com teach-back
Esclarecer dúvidas de forma objetiva e empática', TRUE),
  ('DXNIC0040', '00146', 6040, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Ensinar técnicas de respiração diafragmática; orientar sobre meditação e mindfulness adaptados; recomendar atividade física leve como ansiolítico natural; orientar higiene do sono; encaminhar para terapia ocupacional se disponível', 'Ensinar técnicas de respiração diafragmática
Orientar sobre meditação e mindfulness adaptados
Recomendar atividade física leve como ansiolítico natural
Orientar higiene do sono', TRUE),
  ('DXNIC0041', '00148', 5380, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Criar ambiente de cuidado seguro e acolhedor; manter consistência na equipe de referência; ser honesto e empático nas comunicações; respeitar o pace do paciente para receber informações; garantir continuidade do cuidado', 'Manter consistência na equipe de referência
Respeitar o pace do paciente para receber informações', TRUE),
  ('DXNIC0042', '00148', 5270, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Nomear e validar o medo sem minimizá-lo; identificar medos específicos (morte, dor, abandono); envolver família no suporte emocional; encaminhar para psicologia/psiquiatria se necessário; registrar estado emocional a cada consulta', 'Envolver família no suporte emocional', TRUE),
  ('DXNIC0043', '00148', 5820, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Fornecer informações baseadas em evidências de forma clara; desmistificar mitos sobre o câncer; apresentar casos de sucesso quando apropriado; orientar sobre suporte paliativo integrado ao tratamento ativo; aplicar ESAS a cada consulta', 'Desmistificar mitos sobre o câncer
Orientar sobre suporte paliativo integrado ao tratamento ativo
Aplicar ESAS a cada consulta', TRUE),
  ('DXNIC0044', '00148', 7140, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Incluir família nas orientações; orientar cuidadores sobre como apoiar sem superproteger; encaminhar família para grupos de apoio; identificar sobrecarga do cuidador; oferecer espaço para dúvidas da família', 'Incluir família nas orientações
Orientar cuidadores sobre como apoiar sem superproteger
Oferecer espaço para dúvidas da família', TRUE),
  ('DXNIC0045', '00148', 5230, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Identificar e fortalecer recursos de enfrentamento prévios; conectar com grupos de apoio; estimular participação em atividades prazerosas; promover autonomia nas decisões; registrar estratégias eficazes para o indivíduo', 'Conectar com grupos de apoio
Estimular participação em atividades prazerosas
Promover autonomia nas decisões', TRUE),
  ('DXNIC0046', '00126', 5606, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar nível de letramento em saúde; adaptar linguagem e material ao perfil do paciente; realizar educação em saúde estruturada na 1ª consulta; aplicar teach-back para verificar compreensão; registrar temas abordados e compreensão demonstrada', 'Adaptar linguagem e material ao perfil do paciente
Realizar educação em saúde estruturada na 1ª consulta', TRUE),
  ('DXNIC0047', '00126', 5602, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Explicar o diagnóstico e estadiamento em linguagem acessível; descrever o mecanismo de ação do tratamento; esclarecer objetivos da QT (curativo, adjuvante, paliativo); fornecer material impresso com informações-chave; disponibilizar contato para dúvidas', 'Explicar o diagnóstico e estadiamento em linguagem acessível
Esclarecer objetivos da QT (curativo, adjuvante, paliativo)
Disponibilizar contato para dúvidas', TRUE),
  ('DXNIC0048', '00126', 5616, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Explicar nome, dose, horário e via de cada medicamento domiciliar; orientar sobre efeitos adversos esperados e como manejá-los; alertar sobre interações com automedicação e fitoterápicos; orientar não interromper medicações sem consulta; fornecer lista escrita de medicamentos', 'Explicar nome, dose, horário e via de cada medicamento domiciliar
Orientar sobre efeitos adversos esperados e como manejá-los
Orientar não interromper medicações sem consulta', TRUE),
  ('DXNIC0049', '00126', 5618, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sobre fluxo do dia de QT (chegada, preparo, infusão, alta); explicar duração e número de ciclos; esclarecer cuidados com acesso venoso/PAC; orientar sobre restrições durante o tratamento; apresentar equipe multiprofissional envolvida', 'Orientar sobre fluxo do dia de QT (chegada, preparo, infusão, alta)
Explicar duração e número de ciclos
Esclarecer cuidados com acesso venoso/PAC
Orientar sobre restrições durante o tratamento', TRUE),
  ('DXNIC0050', '00126', 7370, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Fornecer ficha de orientação domiciliar individualizada por ciclo; listar sinais de alarme que exigem contato imediato; fornecer números de contato do serviço para urgências; orientar sobre agendamento de retorno; verificar compreensão das orientações de alta', 'Listar sinais de alarme que exigem contato imediato
Fornecer números de contato do serviço para urgências
Orientar sobre agendamento de retorno', TRUE),
  ('DXNIC0051', '00047', 3590, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Inspecionar pele e mucosas a cada consulta; avaliar acesso venoso antes de cada infusão quanto à permeabilidade e sinais flogísticos; monitorar síndrome mão-pé em protocolos com capecitabina/taxanos; registrar achados e grau CTCAE; fotografar lesões evolutivas', NULL, TRUE),
  ('DXNIC0052', '00047', 3660, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Aplicar protocolo institucional de extravasamento imediatamente se confirmado; identificar droga extravasada e protocolo específico (antídoto se vesicante); acionar médico imediatamente; documentar volume, sintomas e conduta; acompanhar evolução da lesão', NULL, TRUE),
  ('DXNIC0053', '00047', 480, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Realizar curativo de PAC/CVC conforme protocolo institucional; inspecionar sítio de inserção a cada visita; trocar fixação conforme protocolo; orientar paciente sobre cuidados domiciliares com acesso; registrar aspecto do sítio', 'Orientar paciente sobre cuidados domiciliares com acesso', TRUE),
  ('DXNIC0054', '00047', 3500, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar uso de calçados confortáveis e meias de algodão (PPE); recomendar creme emoliente/ureia para mãos e pés; contraindicar atividades que aumentem pressão plantar em PPE grau ≥2; orientar proteção solar durante tratamento com agentes fotossensibilizantes', 'Orientar uso de calçados confortáveis e meias de algodão (PPE)
Recomendar creme emoliente/ureia para mãos e pés
Orientar proteção solar durante tratamento com agentes fotossensibilizantes', TRUE),
  ('DXNIC0055', '00047', 5606, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sobre sinais de extravasamento (dor, ardência, edema no sítio); ensinar inspeção diária de mãos e pés; recomendar hidratação intensiva da pele; orientar proteção solar adequada; fornecer material educativo sobre cuidados cutâneos durante QT', 'Orientar sobre sinais de extravasamento (dor, ardência, edema no sítio)
Ensinar inspeção diária de mãos e pés
Recomendar hidratação intensiva da pele
Orientar proteção solar adequada', TRUE),
  ('DXNIC0056', '00095', 1850, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Avaliar padrão de sono (duração, qualidade, fatores de interferência); aplicar ESAS para sono; orientar higiene do sono (horários regulares, ambiente escuro/silencioso, evitar telas); recomendar evitar cafeína após 14h; registrar qualidade do sono a cada consulta', 'Aplicar ESAS para sono
Orientar higiene do sono (horários regulares, ambiente escuro/silencioso, evitar telas)
Recomendar evitar cafeína após 14h', TRUE),
  ('DXNIC0057', '00095', 6040, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Ensinar técnicas de relaxamento progressivo muscular; orientar respiração diafragmática antes de dormir; recomendar meditação guiada ou sons relaxantes; orientar banho morno antes de dormir; encaminhar para psicologia se insônia persistente', 'Ensinar técnicas de relaxamento progressivo muscular
Orientar respiração diafragmática antes de dormir
Recomendar meditação guiada ou sons relaxantes
Orientar banho morno antes de dormir', TRUE),
  ('DXNIC0058', '00095', 2380, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Verificar corticosteroides e dexametasona no esquema antiemético como causa de insônia; orientar administração de corticoide pela manhã quando possível; registrar correlação entre medicamentos e padrão de sono; acionar médico para ajuste se necessário', 'Orientar administração de corticoide pela manhã quando possível', TRUE),
  ('DXNIC0059', '00095', 5270, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Avaliar ansiedade e depressão como causas de insônia; encaminhar para psicologia/psiquiatria se indicado; validar impacto da insônia na qualidade de vida; orientar família sobre suporte ao repouso do paciente', 'Validar impacto da insônia na qualidade de vida
Orientar família sobre suporte ao repouso do paciente', TRUE),
  ('DXNIC0060', '00095', 1400, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Avaliar dor noturna como causa de insônia; ajustar analgesia para cobertura noturna; recomendar posicionamento confortável; orientar técnicas de conforto não farmacológicas; registrar correlação dor-sono', 'Recomendar posicionamento confortável
Orientar técnicas de conforto não farmacológicas', TRUE),
  ('DXNIC0061', '00013', 430, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar frequência, consistência e volume das evacuações; classificar grau CTCAE; orientar loperamida conforme prescrição; monitorar hidratação e sinais de desidratação; registrar evolução e notificar médico se grau ≥3', 'Orientar loperamida conforme prescrição', TRUE),
  ('DXNIC0062', '00013', 450, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Diferenciar diarreia de pseudodiarreia por impactação; avaliar abdome; orientar dieta pobre em fibras insolúveis e lactose na fase aguda; recomendar BRAT (banana, arroz, maçã, torrada); monitorar retorno ao padrão normal', 'Orientar dieta pobre em fibras insolúveis e lactose na fase aguda
Recomendar BRAT (banana, arroz, maçã, torrada)', TRUE),
  ('DXNIC0063', '00013', 4120, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar reposição hídrica oral (SRO ou líquidos claros); monitorar diurese e turgor de pele; acionar médico para hidratação EV se diarreia grau ≥3; registrar balanço hídrico estimado; pesar paciente a cada consulta', 'Orientar reposição hídrica oral (SRO ou líquidos claros)', TRUE),
  ('DXNIC0064', '00013', 6540, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Colher coprocultura se diarreia persistente ou com sangue; orientar higiene rigorosa das mãos após evacuações; descartar Clostridium difficile em uso prévio de antibiótico; monitorar temperatura; registrar e notificar suspeita de infecção entérica', 'Orientar higiene rigorosa das mãos após evacuações', TRUE),
  ('DXNIC0065', '00013', 5614, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sinais de alarme (sangue, muco, febre, desidratação grave); ensinar uso correto da loperamida; fornecer lista de alimentos recomendados e contraindicados; orientar higiene perianal rigorosa; fornecer contato de urgência do serviço', 'Orientar sinais de alarme (sangue, muco, febre, desidratação grave)
Ensinar uso correto da loperamida
Orientar higiene perianal rigorosa
Fornecer contato de urgência do serviço', TRUE),
  ('DXNIC0066', '00011', 450, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar padrão evacuatório basal e atual; classificar grau CTCAE; orientar laxativo prescrito profilaticamente em uso de opioide; recomendar aumento de ingestão hídrica (≥2L/dia se tolerado); registrar frequência e características das evacuações', 'Orientar laxativo prescrito profilaticamente em uso de opioide
Recomendar aumento de ingestão hídrica (≥2L/dia se tolerado)', TRUE),
  ('DXNIC0067', '00011', 430, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar dieta com fibras solúveis (aveia, frutas); recomendar atividade física leve; orientar massa abdominal e posição de cócoras; monitorar distensão abdominal e náusea associada; acionar médico se sem evacuação por >3 dias', 'Orientar dieta com fibras solúveis (aveia, frutas)
Recomendar atividade física leve
Orientar massa abdominal e posição de cócoras', TRUE),
  ('DXNIC0068', '00011', 4120, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar ingestão hídrica adequada (mínimo 2L/dia); monitorar hidratação; avaliar correlação entre ingestão hídrica reduzida e constipação; orientar sobre bebidas que estimulam peristaltismo (suco de ameixa, água morna); registrar evolução', 'Orientar ingestão hídrica adequada (mínimo 2L/dia)
Orientar sobre bebidas que estimulam peristaltismo (suco de ameixa, água morna)', TRUE),
  ('DXNIC0069', '00011', 2380, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Revisar medicamentos constipantes (opioides, ondansetrona, ferro, carbonato de cálcio); propor ao médico rotação de antiemético se possível; orientar laxativo osmótico profilático em uso de opioide; registrar eficácia do laxativo', 'Orientar laxativo osmótico profilático em uso de opioide', TRUE),
  ('DXNIC0070', '00011', 5614, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sinais de alarme (distensão, dor intensa, ausência de gases); ensinar uso correto de laxativos; fornecer lista de alimentos que auxiliam o trânsito; orientar sobre importância de não suprimir urgência evacuatória; registrar compreensão', 'Orientar sinais de alarme (distensão, dor intensa, ausência de gases)
Ensinar uso correto de laxativos
Orientar sobre importância de não suprimir urgência evacuatória', TRUE),
  ('DXNIC0071', '00029', 4040, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Monitorar PA, FC e ritmo cardíaco antes de cada ciclo; registrar sinais e sintomas de insuficiência cardíaca (dispneia, edema, ortopneia); verificar resultado de ecocardiograma (FEVE) conforme protocolo; notificar médico se FEVE <50% ou queda ≥10%; registrar dose acumulada de antracíclico', NULL, TRUE),
  ('DXNIC0072', '00029', 4044, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Monitorar ECG conforme protocolo para drogas arritmogênicas; avaliar intervalo QT em drogas de risco; manter carrinho de emergência acessível; treinar equipe para reconhecimento de arritmias; registrar intercorrências cardiovasculares', 'Manter carrinho de emergência acessível', TRUE),
  ('DXNIC0073', '00029', 6650, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Monitorar sinais vitais durante infusão de drogas cardiotóxicas; avaliar sinais de hipotensão, bradicardia ou arritmia intrainfusional; acionar médico imediatamente se alterações hemodinâmicas; registrar parâmetros por turno', NULL, TRUE),
  ('DXNIC0074', '00029', 5602, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Orientar sobre sinais e sintomas de alerta cardíaco (dispneia, palpitações, edema súbito); orientar restrição de atividade física intensa em fase de cardiotoxicidade; recomendar controle de fatores de risco cardiovascular (PA, glicemia, tabagismo); fornecer material educativo', 'Orientar sobre sinais e sintomas de alerta cardíaco (dispneia, palpitações, edema súbito)
Orientar restrição de atividade física intensa em fase de cardiotoxicidade
Recomendar controle de fatores de risco cardiovascular (PA, glicemia, tabagismo)', TRUE),
  ('DXNIC0075', '00029', 4150, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Monitorar pressão arterial e FC antes, durante e após infusão; registrar variações hemodinâmicas; orientar sobre hidratação adequada; avaliar sinais de hipoperfusão; acionar cardiologia se indicado', 'Orientar sobre hidratação adequada', TRUE),
  ('DXNIC0076', '00027', 4120, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar sinais clínicos de desidratação (mucosas, turgor, diurese); pesar paciente antes de cada ciclo; orientar ingestão hídrica oral ≥30 mL/kg/dia; acionar médico para prescrição de hidratação EV se sinais de desidratação moderada/grave; registrar balanço hídrico estimado', 'Orientar ingestão hídrica oral ≥30 mL/kg/dia', TRUE),
  ('DXNIC0077', '00027', 4130, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Registrar diurese e características; monitorar PA e FC (sinais de hipovolemia); avaliar creatinina e ureia para função renal; monitorar eletrólitos em perdas prolongadas; documentar evolução do estado de hidratação', NULL, TRUE),
  ('DXNIC0078', '00027', 1450, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Controlar perdas por vômito com antiemético eficaz; monitorar volume e frequência de vômitos; orientar reposição hídrica oral fracionada; registrar correlação entre vômito e desidratação; acionar médico para resgate EV', 'Controlar perdas por vômito com antiemético eficaz
Orientar reposição hídrica oral fracionada', TRUE),
  ('DXNIC0079', '00027', 430, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar perdas pela diarreia; orientar soro de reidratação oral; calcular déficit hídrico estimado; acionar médico se desidratação grave; registrar número e volume estimado de evacuações', 'Orientar soro de reidratação oral', TRUE),
  ('DXNIC0080', '00027', 5614, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar ingestão de líquidos em pequenas quantidades e frequentes; ensinar sinais de desidratação para reconhecimento precoce; fornecer orientação sobre SRO caseiro; orientar evitar diuréticos naturais em excesso; fornecer contato para urgência', 'Orientar ingestão de líquidos em pequenas quantidades e frequentes
Ensinar sinais de desidratação para reconhecimento precoce
Orientar evitar diuréticos naturais em excesso
Fornecer contato para urgência', TRUE),
  ('DXNIC0081', '00118', 5220, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Avaliar impacto das mudanças corporais na autoestima (ESAS); validar sentimentos sem minimizar; fornecer orientações sobre alopecia e caráter reversível quando aplicável; apresentar recursos de apoio (Projeto Cabelegria, próteses capilares pelo SUS); encaminhar para psicologia', 'Validar sentimentos sem minimizar', TRUE),
  ('DXNIC0082', '00118', 5270, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Criar espaço seguro para expressão de sentimentos sobre corpo; envolver parceiro(a)/família com consentimento; conectar com grupos de apoio de pacientes oncológicos; identificar pontos de autoestima preservados; reforçar identidade além do corpo físico', 'Conectar com grupos de apoio de pacientes oncológicos
Reforçar identidade além do corpo físico', TRUE),
  ('DXNIC0083', '00118', 5440, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Identificar rede de suporte social; conectar com assistente social para recursos disponíveis; apresentar grupos de apoio presenciais ou online; orientar família sobre como apoiar sem reforçar estigma; registrar rede de suporte', 'Orientar família sobre como apoiar sem reforçar estigma', TRUE),
  ('DXNIC0084', '00118', 5400, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Identificar e reforçar pontos fortes do paciente; estimular atividades que promovam bem-estar (música, leitura, artesanato); orientar cuidados de imagem possíveis (maquiagem, lenços, roupas adaptadas); encaminhar para terapia ocupacional; registrar evolução da autoestima', 'Estimular atividades que promovam bem-estar (música, leitura, artesanato)
Orientar cuidados de imagem possíveis (maquiagem, lenços, roupas adaptadas)', TRUE),
  ('DXNIC0085', '00118', 7140, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Orientar família sobre impacto psicológico das mudanças corporais; orientar sobre linguagem de suporte sem reforçar estigma; incluir família nas estratégias de adaptação; encaminhar para psicologia familiar se necessário', 'Orientar família sobre impacto psicológico das mudanças corporais
Orientar sobre linguagem de suporte sem reforçar estigma
Incluir família nas estratégias de adaptação', TRUE),
  ('DXNIC0086', '00078', 4360, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Identificar barreiras específicas à adesão (transporte, trabalho, cuidado de filhos, letramento); desenvolver estratégias individualizadas de superação; negociar metas realistas de adesão; realizar follow-up telefônico em faltas; registrar padrão de adesão por ciclo', 'Realizar follow-up telefônico em faltas', TRUE),
  ('DXNIC0087', '00078', 7370, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Simplificar regime domiciliar ao máximo; fornecer lista escrita clara de medicamentos e horários; confirmar que paciente tem como buscar medicamentos; verificar transporte para próximas consultas; acionar assistente social para barreiras socioeconômicas', NULL, TRUE),
  ('DXNIC0088', '00078', 8100, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Encaminhar para serviço social para suporte de passagem, cesta básica, benefícios; articular com CAPS/UBS de referência para suporte próximo ao domicílio; identificar benefícios sociais elegíveis (BPC, auxílio-doença); registrar encaminhamentos realizados', NULL, TRUE),
  ('DXNIC0089', '00078', 5616, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Explicar consequências clínicas de interrupção do tratamento em linguagem acessível; reforçar positivamente pequenos progressos; envolver família/cuidador no suporte à adesão; disponibilizar contato fácil para dúvidas; aplicar teach-back sobre plano terapêutico', 'Explicar consequências clínicas de interrupção do tratamento em linguagem acessível
Reforçar positivamente pequenos progressos
Envolver família/cuidador no suporte à adesão
Disponibilizar contato fácil para dúvidas
Aplicar teach-back sobre plano terapêutico', TRUE),
  ('DXNIC0090', '00078', 7910, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Realizar reunião de equipe para casos de baixa adesão; envolver assistente social, psicólogo e farmácia; construir plano de cuidado pactuado com o paciente; registrar estratégias acordadas; monitorar evolução da adesão nos ciclos seguintes', 'Realizar reunião de equipe para casos de baixa adesão', TRUE),
  ('DXNIC0091', '00085', 221, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar grau de neuropatia periférica (CTCAE); monitorar força muscular distal e sensibilidade; encaminhar para fisioterapia; orientar exercícios de equilíbrio e fortalecimento adaptados; registrar evolução funcional a cada ciclo', 'Orientar exercícios de equilíbrio e fortalecimento adaptados', TRUE),
  ('DXNIC0092', '00085', 840, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar adaptações domiciliares para segurança (tapetes, barras); recomendar calçados fechados e antiderrapantes; avaliar risco de quedas (escala de Morse); orientar cuidador sobre auxílio na deambulação; registrar episódios de quedas', 'Orientar adaptações domiciliares para segurança (tapetes, barras)
Recomendar calçados fechados e antiderrapantes
Orientar cuidador sobre auxílio na deambulação', TRUE),
  ('DXNIC0093', '00085', 1800, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar dependência nas AVDs; orientar sobre adaptações para autocuidado; encaminhar para terapia ocupacional; envolver cuidador no plano de assistência; registrar nível de dependência por ciclo', 'Orientar sobre adaptações para autocuidado', TRUE),
  ('DXNIC0094', '00085', 2380, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar progressão da neuropatia periférica por ciclo; comunicar médico se grau ≥2 para avaliação de redução de dose; orientar sobre vitaminas do complexo B (se prescrito); recomendar fisioterapia neurológica; registrar grau CTCAE de neuropatia', 'Orientar sobre vitaminas do complexo B (se prescrito)
Recomendar fisioterapia neurológica', TRUE),
  ('DXNIC0095', '00085', 5602, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sobre risco de queimaduras por redução de sensibilidade térmica; ensinar inspeção diária de pés; recomendar proteção em atividades com risco de trauma; orientar sobre não andar descalço; fornecer material educativo sobre cuidados com neuropatia', 'Orientar sobre risco de queimaduras por redução de sensibilidade térmica
Ensinar inspeção diária de pés
Recomendar proteção em atividades com risco de trauma
Orientar sobre não andar descalço', TRUE),
  ('DXNIC0096', '00136', 5290, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Criar espaço seguro para expressão do luto; validar e nomear sentimentos sem julgamento; não apressar o processo de elaboração; identificar perdas específicas verbalizadas (trabalho, papel social, projetos de vida); encaminhar para psicologia/serviço de cuidados paliativos', 'Validar e nomear sentimentos sem julgamento', TRUE),
  ('DXNIC0097', '00136', 5270, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Oferecer presença terapêutica consistente; aplicar ESAS regularmente; avaliar risco de depressão maior (PHQ-9); encaminhar para psiquiatria se indicado; registrar estado emocional evolutivo', 'Oferecer presença terapêutica consistente
Aplicar ESAS regularmente', TRUE),
  ('DXNIC0098', '00136', 5280, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Identificar questões existenciais e espirituais associadas ao luto; conectar com suporte espiritual/religioso se desejado; articular com capelania hospitalar; respeitar crenças sem imposição; registrar necessidades espirituais', 'Respeitar crenças sem imposição', TRUE),
  ('DXNIC0099', '00136', 7140, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Orientar família sobre processo de luto do paciente; identificar sobrecarga emocional do cuidador; encaminhar família para suporte psicológico; criar espaço para luto familiar; orientar sobre comunicação empática com o paciente', 'Orientar família sobre processo de luto do paciente
Orientar sobre comunicação empática com o paciente', TRUE),
  ('DXNIC0100', '00136', 5440, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Conectar com grupos de apoio oncológico; identificar comunidade religiosa/espiritual como recurso; articular com serviço social para suporte integral; mobilizar rede de apoio; registrar recursos de suporte ativados', 'Conectar com grupos de apoio oncológico', TRUE),
  ('DXNIC0101', '00155', 6490, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Aplicar escala de risco de quedas (Morse) a cada consulta; identificar fatores de risco individuais; orientar adaptações domiciliares; recomendar calçados fechados e antiderrapantes; registrar episódios de quedas e circunstâncias', 'Aplicar escala de risco de quedas (Morse) a cada consulta
Orientar adaptações domiciliares
Recomendar calçados fechados e antiderrapantes', TRUE),
  ('DXNIC0102', '00155', 840, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar remoção de tapetes e obstáculos no domicílio; recomendar instalação de barras no banheiro; orientar iluminação adequada noturna; avaliar uso de andador/bengala se necessário; encaminhar para fisioterapia para treino de equilíbrio', 'Orientar remoção de tapetes e obstáculos no domicílio
Recomendar instalação de barras no banheiro
Orientar iluminação adequada noturna', TRUE),
  ('DXNIC0103', '00155', 221, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Encaminhar para fisioterapia para treino de equilíbrio e propriocepção; orientar exercícios domiciliares simples; monitorar evolução da neuropatia; reavaliar risco de quedas a cada ciclo; registrar progressão', 'Orientar exercícios domiciliares simples', TRUE),
  ('DXNIC0104', '00155', 2380, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Revisar medicamentos que causam hipotensão ou sedação; orientar sobre mudança lenta de posição (ortostase); monitorar PA em diferentes posições; comunicar médico se hipotensão ortostática sintomática; registrar episódios', 'Orientar sobre mudança lenta de posição (ortostase)', TRUE),
  ('DXNIC0105', '00155', 5602, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar paciente e família sobre risco aumentado de quedas durante QT; ensinar técnica segura de levantamento; recomendar solicitar ajuda quando necessário; fornecer material educativo; orientar sobre calçados e vestuário seguros', 'Orientar paciente e família sobre risco aumentado de quedas durante QT
Ensinar técnica segura de levantamento
Orientar sobre calçados e vestuário seguros', TRUE),
  ('DXNIC0106', '00032', 3140, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Monitorar SpO2 e padrão respiratório antes de cada ciclo; registrar dispneia (escala mMRC); avaliar ausculta pulmonar; monitorar dose acumulada de bleomicina; notificar médico se SpO2 <94% ou dispneia nova/piora', NULL, TRUE),
  ('DXNIC0107', '00032', 3350, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Registrar frequência respiratória, SpO2 e padrão ventilatório; avaliar sinais de derrame pleural (macicez, ausência de MV); solicitar radiografia de tórax se alteração clínica; monitorar tosse nova durante tratamento; documentar evolução respiratória', NULL, TRUE),
  ('DXNIC0108', '00032', 3320, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Disponibilizar oxigênio suplementar se SpO2 <94%; monitorar resposta à oxigenoterapia; posicionar paciente em semi-Fowler; acionar médico para avaliação urgente de insuficiência respiratória; registrar parâmetros ventilatórios', NULL, TRUE),
  ('DXNIC0109', '00032', 5602, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Orientar sobre sinais de toxicidade pulmonar (dispneia progressiva, tosse seca persistente); recomendar contato imediato se piora respiratória; contraindicar tabagismo durante tratamento; orientar sobre uso de máscara em ambientes poluídos; fornecer material educativo', 'Orientar sobre sinais de toxicidade pulmonar (dispneia progressiva, tosse seca persistente)
Recomendar contato imediato se piora respiratória
Orientar sobre uso de máscara em ambientes poluídos', TRUE),
  ('DXNIC0110', '00032', 4150, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Monitorar correlação entre toxicidade cardiovascular e pulmonar; avaliar sinais de insuficiência cardíaca como causa de dispneia; registrar intercorrências cardiorrespiratórias; articular com cardiologia/pneumologia conforme necessidade', NULL, TRUE),
  ('DXNIC0111', '00179', 2120, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar glicemia capilar em pacientes diabéticos e em uso de dexametasona; registrar valores e horários; orientar sinais de hiperglicemia (polidipsia, poliúria, visão turva); comunicar médico se glicemia >250 mg/dL; ajustar monitoramento no período pós-corticoide', 'Orientar sinais de hiperglicemia (polidipsia, poliúria, visão turva)', TRUE),
  ('DXNIC0112', '00179', 5614, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sobre impacto do corticoide na glicemia; ajustar dieta nos dias de corticoide; recomendar fracionamento e redução de carboidratos simples; encaminhar para nutricionista; fornecer material educativo adaptado', 'Orientar sobre impacto do corticoide na glicemia
Recomendar fracionamento e redução de carboidratos simples', TRUE),
  ('DXNIC0113', '00179', 2130, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sobre sinais de hipoglicemia; recomendar não realizar QT em jejum prolongado; orientar sobre alimento de resgate (açúcar, suco); monitorar glicemia pré-QT; registrar episódios hipoglicêmicos', 'Orientar sobre sinais de hipoglicemia
Recomendar não realizar QT em jejum prolongado
Orientar sobre alimento de resgate (açúcar, suco)', TRUE),
  ('DXNIC0114', '00179', 2300, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Verificar prescrição de insulina de correção para dias de corticoide; orientar técnica de aplicação se indicada; monitorar resposta glicêmica; articular com endocrinologia se necessário; registrar doses aplicadas', 'Orientar técnica de aplicação se indicada', TRUE),
  ('DXNIC0115', '00179', 6650, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar sinais de descompensação metabólica durante infusão de corticoide; registrar glicemias seriadas nos dias de dexametasona; avaliar ajuste de antidiabético oral ou insulina; comunicar alterações significativas ao médico', NULL, TRUE),
  ('DXNIC0116', '00205', 4250, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Manter carrinho de emergência completo e verificado; garantir acesso venoso pérvio antes de cada infusão; monitorar PA, FC e SpO2 nos primeiros 30-60 min de novas drogas; ter adrenalina e corticoide disponíveis; treinar equipe em protocolo de reação de hipersensibilidade', 'Manter carrinho de emergência completo e verificado', TRUE),
  ('DXNIC0117', '00205', 6412, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Aplicar protocolo de anafilaxia imediatamente se reação grau ≥3; administrar adrenalina IM 0,3 mg conforme prescrição; posicionar em decúbito dorsal com MMII elevados; acionar médico e equipe de emergência; registrar detalhadamente a reação e conduta', NULL, TRUE),
  ('DXNIC0118', '00205', 4040, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Monitorar PA, FC e SpO2 intrainfusional conforme protocolo; reduzir velocidade de infusão nos primeiros ciclos de drogas com alto risco de HSR; identificar pacientes com histórico de alergia; registrar sinais vitais na frequência determinada pelo protocolo', 'Reduzir velocidade de infusão nos primeiros ciclos de drogas com alto risco de HSR', TRUE),
  ('DXNIC0119', '00205', 6550, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Aplicar protocolo de febre neutropênica imediatamente se Tax ≥38,3°C com ANC <500; coletar hemoculturas antes do antibiótico; iniciar antibioticoterapia de amplo espectro conforme protocolo; hospitalizar imediatamente; registrar conduta e desfecho', NULL, TRUE),
  ('DXNIC0120', '00205', 6650, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Manter observação ativa durante toda a infusão; orientar paciente a comunicar imediatamente qualquer sintoma novo; não deixar paciente em RHS potencial sem monitoramento; registrar intercorrências em tempo real; manter equipe treinada e atualizada', 'Manter observação ativa durante toda a infusão
Orientar paciente a comunicar imediatamente qualquer sintoma novo
Manter equipe treinada e atualizada', TRUE),
  ('DXNIC0121', '00061', 7040, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Avaliar sobrecarga do cuidador a cada consulta (escala de Zarit simplificada ou pergunta direta); validar sentimentos do cuidador; fornecer orientações práticas sobre o cuidado domiciliar; encaminhar para serviço social e psicologia; registrar estado do cuidador', 'Validar sentimentos do cuidador', TRUE),
  ('DXNIC0122', '00061', 7110, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Incluir cuidador nas consultas e orientações; clarificar papéis e responsabilidades; orientar sobre limites saudáveis do cuidado; identificar outros membros da família que possam revezar; orientar sobre benefícios a que o cuidador tem direito', 'Orientar sobre limites saudáveis do cuidado
Orientar sobre benefícios a que o cuidador tem direito', TRUE),
  ('DXNIC0123', '00061', 5440, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Identificar rede de suporte ao cuidador; conectar com grupos de apoio para cuidadores; articular com CAPS para saúde mental do cuidador; identificar voluntários e ONGs de apoio; mobilizar rede comunitária', 'Conectar com grupos de apoio para cuidadores', TRUE),
  ('DXNIC0124', '00061', 7370, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Elaborar plano de cuidado domiciliar claro e factível; simplificar rotinas ao máximo; treinar cuidador em procedimentos essenciais; fornecer material de apoio escrito; orientar sobre quando e como acionar o serviço', 'Orientar sobre quando e como acionar o serviço', TRUE),
  ('DXNIC0125', '00061', 5602, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Orientar sinais de alarme que exigem contato imediato; treinar manejo de efeitos adversos comuns; orientar sobre medicamentos domiciliares; ensinar cuidados com acesso venoso/PAC se aplicável; verificar compreensão com teach-back', 'Orientar sinais de alarme que exigem contato imediato
Orientar sobre medicamentos domiciliares
Ensinar cuidados com acesso venoso/PAC se aplicável', TRUE),
  ('DXNIC0126', '00023', 590, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar diurese, frequência e características da urina; avaliar queixas de hesitância, esforço miccional ou sensação de esvaziamento incompleto; registrar padrão miccional; orientar sobre hidratação adequada; comunicar médico se alteração', 'Orientar sobre hidratação adequada', TRUE),
  ('DXNIC0127', '00023', 610, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar necessidade de sondagem se retenção confirmada; manter técnica asséptica rigorosa; monitorar diurese e aspecto da urina; registrar volume residual se sondado; planejar retirada precoce da sonda', 'Manter técnica asséptica rigorosa', TRUE),
  ('DXNIC0128', '00023', 2380, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar neuropatia autonômica em uso de vincristina e cisplatina; comunicar médico se retenção urinária confirmada para avaliação de dose; orientar sobre sintomas de neuropatia autonômica; registrar grau CTCAE de neuropatia autonômica', 'Orientar sobre sintomas de neuropatia autonômica', TRUE),
  ('DXNIC0129', '00023', 570, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar micção programada (a cada 3-4h); ensinar manobra de Credé se necessário; orientar sobre posicionamento adequado para micção; recomendar ingestão hídrica regular e não excessiva; registrar padrão de resposta', 'Orientar micção programada (a cada 3-4h)
Ensinar manobra de Credé se necessário
Orientar sobre posicionamento adequado para micção
Recomendar ingestão hídrica regular e não excessiva', TRUE),
  ('DXNIC0130', '00023', 5602, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar sobre sinais de retenção (distensão, urgência sem eliminação, dor suprapúbica); recomendar contato imediato se sem diurese por >8h; educar sobre hidratação adequada; fornecer orientações sobre neuropatia autonômica', 'Orientar sobre sinais de retenção (distensão, urgência sem eliminação, dor suprapúbica)
Recomendar contato imediato se sem diurese por >8h', TRUE),
  ('DXNIC0131', '00124', 5310, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Estabelecer relação terapêutica baseada na presença e escuta; identificar e fortalecer fontes de esperança individuais (família, fé, metas); reforçar conquistas durante o tratamento; apresentar opções terapêuticas disponíveis; encaminhar para cuidados paliativos integrados', 'Reforçar conquistas durante o tratamento', TRUE),
  ('DXNIC0132', '00124', 5270, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Aplicar PHQ-9 para rastreio de depressão; encaminhar para psiquiatria se indicado; validar sentimentos sem minimizar nem catastrofizar; oferecer presença consistente; registrar estado emocional e evolução', 'Aplicar PHQ-9 para rastreio de depressão
Validar sentimentos sem minimizar nem catastrofizar
Oferecer presença consistente', TRUE),
  ('DXNIC0133', '00124', 5280, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Acolher necessidades espirituais e existenciais; conectar com capelania/suporte espiritual se desejado; respeitar crenças religiosas; não impor perspectivas sobre morte ou cura; registrar necessidades espirituais', 'Respeitar crenças religiosas', TRUE),
  ('DXNIC0134', '00124', 7290, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Envolver família no plano de cuidado; orientar família sobre como oferecer esperança realista; conectar família com suporte psicológico; facilitar comunicação entre paciente e família; registrar dinâmica familiar', 'Envolver família no plano de cuidado
Orientar família sobre como oferecer esperança realista
Facilitar comunicação entre paciente e família', TRUE),
  ('DXNIC0135', '00124', 5440, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Conectar com grupos de apoio oncológico; identificar comunidade e pertencimento como fontes de esperança; articular com serviço social; mobilizar rede de apoio; registrar recursos de esperança ativados', 'Conectar com grupos de apoio oncológico', TRUE),
  ('DXNIC0136', '00007', 3740, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Monitorar temperatura, FC, FR e PA; aplicar protocolo de febre neutropênica se ANC <500 ou <1000 com queda rápida; coletar hemoculturas antes do antibiótico; iniciar antibioticoterapia EV em até 1 hora do diagnóstico; registrar evolução da temperatura', NULL, TRUE),
  ('DXNIC0137', '00007', 6550, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Isolar paciente em quarto privativo se disponível; aplicar precauções de contato; monitorar foco infeccioso (exame físico detalhado); solicitar exames complementares conforme protocolo (Rx tórax, urina I, hemograma); registrar foco presumido', 'Aplicar precauções de contato', TRUE),
  ('DXNIC0138', '00007', 4120, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Manter hidratação venosa adequada; monitorar balanço hídrico; avaliar sinais de choque séptico; acionar UTI se instabilidade hemodinâmica; registrar parâmetros hemodinâmicos horários se grave', 'Manter hidratação venosa adequada', TRUE),
  ('DXNIC0139', '00007', 3900, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Aplicar medidas físicas de resfriamento (compressas frias); monitorar temperatura a cada 1-2h; avaliar resposta ao antibiótico em 48-72h; registrar curva de temperatura; acionar infectologista se sem resposta em 72h', 'Aplicar medidas físicas de resfriamento (compressas frias)', TRUE),
  ('DXNIC0140', '00007', 6540, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Aplicar precauções padrão e específicas conforme foco; garantir higienização das mãos de toda equipe; monitorar perfil de resistência bacteriana; coletar culturas de vigilância; registrar e notificar IRAS se aplicável', 'Aplicar precauções padrão e específicas conforme foco', TRUE),
  ('DXNIC0141', '00108', 1801, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Avaliar nível de dependência para banho (escala de Barthel); orientar adaptações para banho seguro (cadeira, barras, chuveiro portátil); envolver cuidador no suporte à higiene; encaminhar para terapia ocupacional; registrar evolução da independência', 'Orientar adaptações para banho seguro (cadeira, barras, chuveiro portátil)', TRUE),
  ('DXNIC0142', '00108', 1800, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Identificar atividades de autocuidado comprometidas; planejar rotina de cuidados respeitando a energia disponível; orientar sobre conservação de energia; adaptar materiais de higiene para limitações motoras; registrar nível de dependência por ciclo', 'Orientar sobre conservação de energia
Adaptar materiais de higiene para limitações motoras', TRUE),
  ('DXNIC0143', '00108', 740, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar cuidador sobre higiene no leito se necessário; ensinar técnica de banho no leito; orientar sobre prevenção de lesão por pressão; monitorar integridade da pele; registrar condições de higiene e pele', 'Orientar cuidador sobre higiene no leito se necessário
Ensinar técnica de banho no leito
Orientar sobre prevenção de lesão por pressão', TRUE),
  ('DXNIC0144', '00108', 5400, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Estimular máxima autonomia preservada; reforçar positivamente cada conquista no autocuidado; adaptar tarefas ao nível de capacidade atual; valorizar esforço do paciente; registrar progressos', 'Estimular máxima autonomia preservada
Reforçar positivamente cada conquista no autocuidado
Adaptar tarefas ao nível de capacidade atual', TRUE),
  ('DXNIC0145', '00108', 6480, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Orientar adaptações domiciliares para facilitar autocuidado; avaliar segurança do banheiro; recomendar equipamentos de apoio disponíveis no SUS; articular com serviço social para recursos; registrar adaptações realizadas', 'Orientar adaptações domiciliares para facilitar autocuidado
Recomendar equipamentos de apoio disponíveis no SUS', TRUE),
  ('DXNIC0146', '00054', 5100, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Avaliar grau de isolamento social (ESAS/entrevista); identificar barreiras à socialização (vergonha, fadiga, medo); estimular contato social gradual e seguro; conectar com grupos de apoio oncológico; registrar rede social ativa', 'Estimular contato social gradual e seguro
Conectar com grupos de apoio oncológico', TRUE),
  ('DXNIC0147', '00054', 5270, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Validar sentimentos de solidão sem minimizar; explorar impacto do isolamento na qualidade de vida; encaminhar para psicologia; identificar atividades prazerosas ainda possíveis; registrar estado emocional', 'Validar sentimentos de solidão sem minimizar', TRUE),
  ('DXNIC0148', '00054', 5440, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Conectar com grupos de apoio presenciais ou online; identificar comunidade religiosa/associativa como recurso; mobilizar rede de amigos e família; articular com serviço social; registrar recursos de suporte social ativados', 'Conectar com grupos de apoio presenciais ou online', TRUE),
  ('DXNIC0149', '00054', 7140, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Orientar família sobre importância do contato social para o paciente; estimular visitas e interações seguras; orientar sobre precauções reais versus medos excessivos; combater mitos sobre contágio de câncer; registrar dinâmica de suporte familiar', 'Orientar família sobre importância do contato social para o paciente
Estimular visitas e interações seguras
Orientar sobre precauções reais versus medos excessivos', TRUE),
  ('DXNIC0150', '00054', 5602, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Esclarecer precauções reais de isolamento (apenas em neutropenia grave); desmistificar restrições desnecessárias; orientar sobre atividades sociais seguras; recomendar atividades adaptadas ao nível de energia; fornecer material educativo', 'Esclarecer precauções reais de isolamento (apenas em neutropenia grave)
Desmistificar restrições desnecessárias
Orientar sobre atividades sociais seguras
Recomendar atividades adaptadas ao nível de energia', TRUE);

-- 90 relações NANDA → NOC
INSERT INTO mapa_nanda_noc
  (dx_noc_id_lc, codigo_nanda, codigo_noc, prioridade_sugerida, contexto_uso_sugerido,
   indicadores_mensuraveis, criterio_avaliacao_sugerido, janela_reavaliacao_sugerida,
   ativo, notas_origem)
VALUES
  ('DXNOC0001', '00134', 1618, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente relata náusea ≤ grau 1 CTCAE; frequência de vômitos reduzida a ≤1 episódio/dia; paciente demonstra adesão ao esquema antiemético prescrito', 'Paciente relata náusea ≤ grau 1 CTCAE; frequência de vômitos reduzida a ≤1 episódio/dia; paciente demonstra adesão ao esquema antiemético prescrito', NULL, TRUE, 'Dieta fracionada com alimentos frios e de fácil digestão
Reduzir estímulos olfativos no ambiente'),
  ('DXNOC0002', '00134', 1014, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente mantém ingestão calórica ≥60% das necessidades diárias; refere melhora do apetite entre os ciclos; peso estável com variação ≤5%', 'Paciente mantém ingestão calórica ≥60% das necessidades diárias; refere melhora do apetite entre os ciclos; peso estável com variação ≤5%', NULL, TRUE, 'Fazer contato com o ambulatório de quimioterapia e ou Procurar serviço médico se mais de 6 episódios de vômito em 24 horas'),
  ('DXNOC0003', '00134', 2109, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente verbaliza conforto após intervenções; escala de desconforto ≤3/10; paciente relata qualidade de vida preservada durante o tratamento', 'Paciente verbaliza conforto após intervenções; escala de desconforto ≤3/10; paciente relata qualidade de vida preservada durante o tratamento', NULL, TRUE, 'Fracionar as refeições (6x/dia), recomendar alimentos frios, secos e de baixo teor lipídico, desestimular odores fortes no ambiente domiciliar, orientar ingestão hídrica entre refeições'),
  ('DXNOC0004', '00004', 702, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'ANC ≥1.000/mm³ antes do próximo ciclo; ausência de febre neutropênica durante o tratamento; hemograma dentro dos critérios de liberação para QT', 'ANC ≥1.000/mm³ antes do próximo ciclo; ausência de febre neutropênica durante o tratamento; hemograma dentro dos critérios de liberação para QT', 'Próximo ciclo', TRUE, 'Reduzir estímulos ambientais (odor, barulho, iluminação)
manter ambiente arejado
oferecer bala de gengibre ou chá frio conforme preferência
respeitar preferências do paciente quanto ao ambiente'),
  ('DXNOC0005', '00004', 1902, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente verbaliza sinais de alarme de infecção; demonstra técnica correta de higiene das mãos; relata temperatura diariamente no período de nadir', 'Paciente verbaliza sinais de alarme de infecção; demonstra técnica correta de higiene das mãos; relata temperatura diariamente no período de nadir', NULL, TRUE, 'orientar esquema domiciliar pós-alta'),
  ('DXNOC0006', '00004', 1101, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ausência de sinais flogísticos no acesso venoso; mucosas íntegras; porta de entrada de dispositivos invasivos sem sinais de infecção', 'Ausência de sinais flogísticos no acesso venoso; mucosas íntegras; porta de entrada de dispositivos invasivos sem sinais de infecção', NULL, TRUE, 'ANC antes de cada ciclo, orientar paciente e família sobre sinais de infecção, recomendar evitar aglomerações e contato com doentes, orientar higiene rigorosa das mãos
rastrear temperatura domiciliar diária no nadir'),
  ('DXNOC0007', '00132', 2102, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'EVA ≤3 após intervenção; paciente relata controle satisfatório da dor; ausência de expressão facial de dor em repouso', 'EVA ≤3 após intervenção; paciente relata controle satisfatório da dor; ausência de expressão facial de dor em repouso', NULL, TRUE, 'técnica asséptica rigorosa em procedimentos invasivos
higienizar mãos antes e após contato com paciente
inspecionar acesso venoso diariamente
orientar cuidados com cateter/PAC
garantir descarte adequado de materiais'),
  ('DXNOC0008', '00132', 2100, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente verbaliza conforto ≥7/10; mantém capacidade para atividades básicas da vida diária; sono preservado', 'Paciente verbaliza conforto ≥7/10; mantém capacidade para atividades básicas da vida diária; sono preservado', NULL, TRUE, 'período de nadir esperado conforme protocolo (D+7 a D+14)
solicitar hemograma no nadir
orientar contato imediato se Tax ≥38,3°C
definir fluxo de atendimento de urgência para febre neutropênica'),
  ('DXNOC0009', '00132', 1605, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente demonstra adesão à analgesia prescrita; reconhece sinais de piora e aciona equipe; utiliza corretamente técnicas não farmacológicas', 'Paciente demonstra adesão à analgesia prescrita; reconhece sinais de piora e aciona equipe; utiliza corretamente técnicas não farmacológicas', NULL, TRUE, 'Explicar mecanismo da neutropenia induzida pela QT
orientar sobre alimentos de risco (crus, não pasteurizados)
recomendar higiene rigorosa de feridas e mucosas
fornecer ficha de orientação sobre febre neutropênica
orientar não usar termômetro retal'),
  ('DXNOC0010', '00133', 2102, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Redução da EVA em ≥2 pontos em relação à avaliação inicial; paciente relata períodos de alívio ≥4h após analgesia', 'Redução da EVA em ≥2 pontos em relação à avaliação inicial; paciente relata períodos de alívio ≥4h após analgesia', NULL, TRUE, 'Manter kit de emergência disponível
estabelecer protocolo de febre neutropênica institucional
acionar médico imediatamente se Tax ≥38,3°C com ANC <500'),
  ('DXNOC0011', '00133', 2000, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente mantém AVDs básicas; relata melhora na qualidade do sono; participa de atividades sociais mínimas', 'Paciente mantém AVDs básicas; relata melhora na qualidade do sono; participa de atividades sociais mínimas', NULL, TRUE, 'dor com EVA a cada consulta
identificar localização, caráter, irradiação e fatores de melhora/piora
verificar adesão à analgesia prescrita'),
  ('DXNOC0012', '00133', 1307, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente demonstra estratégias de enfrentamento da dor; adere ao plano terapêutico; verbaliza compreensão sobre caráter crônico e manejo', 'Paciente demonstra estratégias de enfrentamento da dor; adere ao plano terapêutico; verbaliza compreensão sobre caráter crônico e manejo', NULL, TRUE, 'orientar horário fixo (não aguardar piora da dor)
orientar não interromper analgesia sem orientação médica'),
  ('DXNOC0013', '00093', 1, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente relata ESAS ≤3 para fadiga; mantém AVDs básicas sem auxílio; tolerância ao esforço preservada para atividades cotidianas', 'Paciente relata ESAS ≤3 para fadiga; mantém AVDs básicas sem auxílio; tolerância ao esforço preservada para atividades cotidianas', NULL, TRUE, 'Proporcionar posicionamento confortável
aplicar técnicas não farmacológicas (calor/frio localizado, massagem superficial, distração)
reduzir estímulos ambientais
respeitar preferências do paciente'),
  ('DXNOC0014', '00093', 2, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente demonstra técnicas de conservação de energia; planeja atividades respeitando limites; relata sono reparador ≥6h/noite', 'Paciente demonstra técnicas de conservação de energia; planeja atividades respeitando limites; relata sono reparador ≥6h/noite', NULL, TRUE, 'Validar a experiência dolorosa do paciente
demonstrar escuta ativa
envolver família no plano de conforto
encaminhar para clínica de dor se EVA persistente ≥7
oferecer suporte psicológico quando indicado'),
  ('DXNOC0015', '00093', 2000, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente relata melhora subjetiva da qualidade de vida; mantém participação social mínima; ESAS global ≤4', 'Paciente relata melhora subjetiva da qualidade de vida; mantém participação social mínima; ESAS global ≤4', NULL, TRUE, 'Revisar medicamentos em uso para identificar interações analgésicas
orientar escalonamento da OMS (degraus)
alertar sobre sinais de toxicidade opioide
educar sobre uso correto de analgésicos de resgate'),
  ('DXNOC0016', '00045', 1100, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Mucosa oral íntegra ou mucosite ≤ grau 1 OMS; ausência de lesões ulcerativas ativas; paciente refere ausência de dor oral em repouso', 'Mucosa oral íntegra ou mucosite ≤ grau 1 OMS; ausência de lesões ulcerativas ativas; paciente refere ausência de dor oral em repouso', NULL, TRUE, 'EVA, localização e impacto funcional a cada consulta
ajustar avaliação conforme grau CTCAE
encaminhar para clínica de dor se refratária
manter registro longitudinal da dor'),
  ('DXNOC0017', '00045', 1014, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente mantém ingestão oral adequada; sem necessidade de suporte nutricional parenteral; peso estável', 'Paciente mantém ingestão oral adequada; sem necessidade de suporte nutricional parenteral; peso estável', NULL, TRUE, 'técnicas de relaxamento e distração
ensinar auto-aplicação de calor/frio
encaminhar para fisioterapia quando indicado
orientar sobre TENS se disponível
integrar abordagem não farmacológica ao plano de cuidado'),
  ('DXNOC0018', '00045', 1605, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente demonstra técnica correta de higiene oral; utiliza analgesia tópica conforme orientação; verbaliza sinais de agravamento', 'Paciente demonstra técnica correta de higiene oral; utiliza analgesia tópica conforme orientação; verbaliza sinais de agravamento', NULL, TRUE, 'sobre alimentos anti-inflamatórios
encaminhar para nutricionista'),
  ('DXNOC0019', '00002', 1004, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Peso estável ±5% durante o tratamento; albumina sérica ≥3,5 g/dL; IMC dentro da faixa de referência', 'Peso estável ±5% durante o tratamento; albumina sérica ≥3,5 g/dL; IMC dentro da faixa de referência', NULL, TRUE, 'impacto da dor crônica na qualidade de vida (ESAS)
encaminhar para psicologia
envolver rede de apoio
validar limitações funcionais
oferecer recursos de suporte espiritual se desejado'),
  ('DXNOC0020', '00002', 1014, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente relata melhora do apetite; ingestão ≥60% das necessidades calóricas; aceita suplementação oral prescrita', 'Paciente relata melhora do apetite; ingestão ≥60% das necessidades calóricas; aceita suplementação oral prescrita', NULL, TRUE, 'Revisar escalonamento analgésico da OMS
orientar não interromper abruptamente'),
  ('DXNOC0021', '00002', 1006, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ingestão proteica ≥1,2 g/kg/dia; ingestão hídrica ≥30 mL/kg/dia; sem necessidade de suporte nutricional parenteral', 'Ingestão proteica ≥1,2 g/kg/dia; ingestão hídrica ≥30 mL/kg/dia; sem necessidade de suporte nutricional parenteral', NULL, TRUE, 'escala de fadiga (ESAS/BFI) a cada consulta
identificar causas tratáveis (anemia, dor, distúrbios do sono, depressão)
planejar atividades nas horas de maior disposição
orientar períodos de repouso estratégicos'),
  ('DXNOC0022', '00146', 1402, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'ESAS ≤3 para ansiedade; paciente verbaliza redução da angústia; demonstra estratégias de enfrentamento eficazes', 'ESAS ≤3 para ansiedade; paciente verbaliza redução da angústia; demonstra estratégias de enfrentamento eficazes', NULL, TRUE, 'Prescrever atividade física adaptada (caminhada 20-30min/dia se ECOG 0-2)
encaminhar para fisioterapia/reabilitação oncológica
orientar sobre benefícios do exercício na fadiga relacionada ao câncer'),
  ('DXNOC0023', '00146', 1300, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Paciente demonstra adaptação progressiva ao diagnóstico; mantém esperança realista; adere ao tratamento sem faltas injustificadas', 'Paciente demonstra adaptação progressiva ao diagnóstico; mantém esperança realista; adere ao tratamento sem faltas injustificadas', NULL, TRUE, 'priorização de atividades essenciais
ensinar técnicas de conservação de energia
envolver cuidador no suporte às AVDs
adaptar ambiente domiciliar para segurança'),
  ('DXNOC0024', '00146', 1603, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Paciente participa ativamente das consultas; faz perguntas sobre o tratamento; busca informações em fontes confiáveis', 'Paciente participa ativamente das consultas; faz perguntas sobre o tratamento; busca informações em fontes confiáveis', NULL, TRUE, 'Validar experiência de fadiga (frequentemente subestimada)
diferenciar fadiga de depressão
encaminhar para psicologia se componente emocional significativo
aplicar ESAS regularmente'),
  ('DXNOC0025', '00148', 1404, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Paciente verbaliza redução da intensidade do medo; mantém funcionalidade nas atividades cotidianas; demonstra estratégias de manejo do medo', 'Paciente verbaliza redução da intensidade do medo; mantém funcionalidade nas atividades cotidianas; demonstra estratégias de manejo do medo', NULL, TRUE, 'Hb e ferritina como causas tratáveis de fadiga
encaminhar para nutricionista
orientar dieta hiperproteica e hipercalórica'),
  ('DXNOC0026', '00148', 1300, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Paciente aceita suporte psicológico quando indicado; não falta ao tratamento por medo; verbaliza esperança no tratamento', 'Paciente aceita suporte psicológico quando indicado; não falta ao tratamento por medo; verbaliza esperança no tratamento', NULL, TRUE, 'mucosa oral a cada consulta (escala OMS 0-4)
orientar escovação com escova macia 4x/dia
prescrever bochechos com solução salina 0,9% após cada refeição
contraindicar enxaguantes alcoólicos'),
  ('DXNOC0027', '00148', 2600, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Família demonstra suporte emocional adequado; não reforça comportamentos de evitação; participa das consultas quando convidada', 'Família demonstra suporte emocional adequado; não reforça comportamentos de evitação; participa das consultas quando convidada', NULL, TRUE, 'Encaminhar para cirurgião-dentista antes do início da QT
orientar higiene de próteses dentárias
recomendar hidratação labial
orientar sobre sinais de progressão (disfagia, sangramento, febre)'),
  ('DXNOC0028', '00126', 1820, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente descreve corretamente o regime terapêutico; verbaliza objetivos do tratamento; demonstra conhecimento sobre protocolos de cada ciclo', 'Paciente descreve corretamente o regime terapêutico; verbaliza objetivos do tratamento; demonstra conhecimento sobre protocolos de cada ciclo', NULL, TRUE, 'Prescrever analgesia tópica (lidocaína gel) conforme prescrição médica
orientar alimentação fria e pastosa em mucosite grau ≥2
acionar médico se disfagia impedir hidratação'),
  ('DXNOC0029', '00126', 1803, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente explica sinais de alarme que exigem contato imediato; identifica efeitos adversos esperados; sabe diferenciar urgência de desconforto esperado', 'Paciente explica sinais de alarme que exigem contato imediato; identifica efeitos adversos esperados; sabe diferenciar urgência de desconforto esperado', NULL, TRUE, 'capacidade de deglutição em mucosite grau ≥3
encaminhar para fonoaudiologia
orientar consistência alimentar adequada'),
  ('DXNOC0030', '00126', 1813, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente demonstra adesão ao esquema medicamentoso domiciliar; relata medicamentos corretamente no teach-back; não realiza automedicação sem orientação', 'Paciente demonstra adesão ao esquema medicamentoso domiciliar; relata medicamentos corretamente no teach-back; não realiza automedicação sem orientação', NULL, TRUE, 'Colher cultura de lesões suspeitas de infecção fúngica/viral
orientar antifúngico tópico se prescrito
orientar isolamento de utensílios domésticos'),
  ('DXNOC0031', '00047', 1101, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ausência de extravasamento confirmado; pele íntegra no sítio de infusão; síndrome mão-pé ≤ grau 1 CTCAE', 'Ausência de extravasamento confirmado; pele íntegra no sítio de infusão; síndrome mão-pé ≤ grau 1 CTCAE', NULL, TRUE, 'triagem nutricional NRS-2002 a cada consulta
calcular necessidades calóricas (25-30 kcal/kg/dia) e proteicas (1,2-2,0 g/kg/dia)
orientar dieta hipercalórica e hiperproteica fracionada'),
  ('DXNOC0032', '00047', 1902, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente verbaliza sinais precoces de extravasamento; demonstra cuidados corretos com mãos e pés; inspeciona sítio de acesso diariamente', 'Paciente verbaliza sinais precoces de extravasamento; demonstra cuidados corretos com mãos e pés; inspeciona sítio de acesso diariamente', NULL, TRUE, 'albumina, pré-albumina e hemoglobina
encaminhar para nutricionista se perda ≥5% em 3 meses'),
  ('DXNOC0033', '00047', 1103, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Em caso de lesão por extravasamento: evolução favorável da ferida; ausência de sinais de infecção secundária; cicatrização progressiva documentada', 'Em caso de lesão por extravasamento: evolução favorável da ferida; ausência de sinais de infecção secundária; cicatrização progressiva documentada', NULL, TRUE, 'suplementação oral hipercalórica (200-400 kcal/dia extra)
ensinar enriquecimento calórico de preparações (azeite, leite em pó, mel)
desmistificar restrições alimentares desnecessárias
orientar sobre alimentos de risco em imunossupressão'),
  ('DXNOC0034', '00095', 4, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Paciente relata sono reparador ≥6h/noite; latência para início do sono ≤30 minutos; acordares noturnos ≤2 por noite', 'Paciente relata sono reparador ≥6h/noite; latência para início do sono ≤30 minutos; acordares noturnos ≤2 por noite', NULL, TRUE, 'Oferecer pequenas refeições frequentes (6-8x/dia)
orientar ambiente agradável durante refeições
identificar alimentos preferidos e tolerados
adaptar consistência conforme sintomas'),
  ('DXNOC0035', '00095', 2002, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Paciente relata sensação de descanso ao acordar; ESAS para sono ≤3; mantém disposição para AVDs', 'Paciente relata sensação de descanso ao acordar; ESAS para sono ≤3; mantém disposição para AVDs', NULL, TRUE, 'Encaminhar para nutricionista para prescrição individualizada
orientar família/cuidador sobre preparo de refeições enriquecidas'),
  ('DXNOC0036', '00095', 1402, 'Suporte', 'Ambulatório; Telemonitoramento; Intercorrência; Consulta inicial', 'Paciente demonstra técnicas de relaxamento antes de dormir; redução da ansiedade noturna; ESAS ansiedade ≤3', 'Paciente demonstra técnicas de relaxamento antes de dormir; redução da ansiedade noturna; ESAS ansiedade ≤3', NULL, TRUE, 'ESAS para ansiedade a cada consulta
estabelecer comunicação terapêutica com escuta ativa
fornecer informações claras sobre o tratamento e o que esperar
respeitar o ritmo de adaptação do paciente
encaminhar para psicologia se ESAS ≥7'),
  ('DXNOC0037', '00013', 501, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Redução para ≤3 evacuações/dia acima do padrão basal; fezes com consistência semiformada; ausência de cólicas incapacitantes', 'Redução para ≤3 evacuações/dia acima do padrão basal; fezes com consistência semiformada; ausência de cólicas incapacitantes', NULL, TRUE, 'Validar sentimentos e medos expressos
envolver família/rede de apoio nas consultas
conectar com grupos de apoio oncológico
oferecer suporte espiritual se desejado'),
  ('DXNOC0038', '00013', 601, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Mucosas úmidas; diurese ≥0,5 mL/kg/h; ausência de sinais clínicos de desidratação', 'Mucosas úmidas; diurese ≥0,5 mL/kg/h; ausência de sinais clínicos de desidratação', NULL, TRUE, 'Identificar recursos internos e externos de enfrentamento
promover autonomia nas decisões sobre o cuidado
orientar sobre direitos do paciente oncológico no SUS
encaminhar para serviço social se vulnerabilidade socioeconômica'),
  ('DXNOC0039', '00013', 1902, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente identifica sinais de agravamento; usa loperamida corretamente; mantém hidratação oral adequada', 'Paciente identifica sinais de agravamento; usa loperamida corretamente; mantém hidratação oral adequada', NULL, TRUE, 'Desmistificar o tratamento quimioterápico
explicar com linguagem acessível os efeitos adversos esperados
disponibilizar material educativo impresso
realizar ensino com teach-back
esclarecer dúvidas de forma objetiva e empática'),
  ('DXNOC0040', '00011', 501, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Evacuações ≥3x/semana; fezes de consistência adequada; ausência de esforço evacuatório intenso', 'Evacuações ≥3x/semana; fezes de consistência adequada; ausência de esforço evacuatório intenso', NULL, TRUE, 'técnicas de respiração diafragmática
orientar sobre meditação e mindfulness adaptados
recomendar atividade física leve como ansiolítico natural
orientar higiene do sono
encaminhar para terapia ocupacional se disponível'),
  ('DXNOC0041', '00011', 602, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ingestão hídrica ≥2L/dia; mucosas úmidas; ausência de sinais de desidratação', 'Ingestão hídrica ≥2L/dia; mucosas úmidas; ausência de sinais de desidratação', NULL, TRUE, 'Criar ambiente de cuidado seguro e acolhedor
manter consistência na equipe de referência
ser honesto e empático nas comunicações
respeitar o pace do paciente para receber informações
garantir continuidade do cuidado'),
  ('DXNOC0042', '00011', 1605, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente usa laxativo profilático corretamente; relata melhora do padrão evacuatório; identifica sinais de impactação', 'Paciente usa laxativo profilático corretamente; relata melhora do padrão evacuatório; identifica sinais de impactação', NULL, TRUE, 'Nomear e validar o medo sem minimizá-lo
identificar medos específicos (morte, dor, abandono)
envolver família no suporte emocional
encaminhar para psicologia/psiquiatria se necessário'),
  ('DXNOC0043', '00029', 400, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'FEVE ≥50% durante o tratamento; ausência de sinais clínicos de insuficiência cardíaca; FC e PA dentro dos parâmetros normais', 'FEVE ≥50% durante o tratamento; ausência de sinais clínicos de insuficiência cardíaca; FC e PA dentro dos parâmetros normais', NULL, TRUE, 'Fornecer informações baseadas em evidências de forma clara
desmistificar mitos sobre o câncer
apresentar casos de sucesso quando apropriado
orientar sobre suporte paliativo integrado ao tratamento ativo
aplicar ESAS a cada consulta'),
  ('DXNOC0044', '00029', 401, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Ausência de arritmias clinicamente significativas; perfusão periférica preservada; ausência de edema de membros inferiores', 'Ausência de arritmias clinicamente significativas; perfusão periférica preservada; ausência de edema de membros inferiores', NULL, TRUE, 'Incluir família nas orientações
orientar cuidadores sobre como apoiar sem superproteger
encaminhar família para grupos de apoio
identificar sobrecarga do cuidador
oferecer espaço para dúvidas da família'),
  ('DXNOC0045', '00029', 1902, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Paciente verbaliza sinais de alerta cardíaco; realiza ecocardiograma conforme cronograma; adere ao controle de fatores de risco', 'Paciente verbaliza sinais de alerta cardíaco; realiza ecocardiograma conforme cronograma; adere ao controle de fatores de risco', NULL, TRUE, 'Identificar e fortalecer recursos de enfrentamento prévios
conectar com grupos de apoio
estimular participação em atividades prazerosas
promover autonomia nas decisões'),
  ('DXNOC0046', '00027', 601, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Mucosas úmidas; turgor de pele preservado; diurese ≥0,5 mL/kg/h; ausência de hipotensão ortostática', 'Mucosas úmidas; turgor de pele preservado; diurese ≥0,5 mL/kg/h; ausência de hipotensão ortostática', NULL, TRUE, 'nível de letramento em saúde
adaptar linguagem e material ao perfil do paciente
realizar educação em saúde estruturada na 1ª consulta
aplicar teach-back para verificar compreensão'),
  ('DXNOC0047', '00027', 602, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ingestão hídrica ≥2L/dia; peso estável entre consultas; ausência de cefaleia e tontura por desidratação', 'Ingestão hídrica ≥2L/dia; peso estável entre consultas; ausência de cefaleia e tontura por desidratação', NULL, TRUE, 'Explicar o diagnóstico e estadiamento em linguagem acessível
descrever o mecanismo de ação do tratamento
esclarecer objetivos da QT (curativo, adjuvante, paliativo)
disponibilizar contato para dúvidas'),
  ('DXNOC0048', '00027', 500, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Diurese de aspecto claro-amarelado; frequência urinária preservada; ausência de oligúria', 'Diurese de aspecto claro-amarelado; frequência urinária preservada; ausência de oligúria', NULL, TRUE, 'orientar sobre efeitos adversos esperados e como manejá-los
alertar sobre interações com automedicação e fitoterápicos
orientar não interromper medicações sem consulta
fornecer lista escrita de medicamentos'),
  ('DXNOC0049', '00118', 1200, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente verbaliza adaptação progressiva às mudanças físicas; mantém autocuidado básico; não evita espelhos ou interações sociais por vergonha do corpo', 'Paciente verbaliza adaptação progressiva às mudanças físicas; mantém autocuidado básico; não evita espelhos ou interações sociais por vergonha do corpo', NULL, TRUE, 'sobre fluxo do dia de QT (chegada, preparo, infusão, alta)
explicar duração e número de ciclos
esclarecer cuidados com acesso venoso/PAC
orientar sobre restrições durante o tratamento
apresentar equipe multiprofissional envolvida'),
  ('DXNOC0050', '00118', 1205, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente demonstra autoestima preservada; verbaliza aspectos positivos de si mesmo; mantém participação em atividades valorizadas', 'Paciente demonstra autoestima preservada; verbaliza aspectos positivos de si mesmo; mantém participação em atividades valorizadas', NULL, TRUE, 'Fornecer ficha de orientação domiciliar individualizada por ciclo
listar sinais de alarme que exigem contato imediato
fornecer números de contato do serviço para urgências
orientar sobre agendamento de retorno
verificar compreensão das orientações de alta'),
  ('DXNOC0051', '00118', 1303, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente elabora perdas associadas às mudanças corporais; mantém projetos de vida durante o tratamento; busca suporte quando necessário', 'Paciente elabora perdas associadas às mudanças corporais; mantém projetos de vida durante o tratamento; busca suporte quando necessário', NULL, TRUE, 'Inspecionar pele e mucosas a cada consulta
fotografar lesões evolutivas'),
  ('DXNOC0052', '00078', 1601, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Comparecimento a ≥80% dos ciclos programados; ausência de interrupções não programadas do tratamento; adesão ao esquema medicamentoso domiciliar', 'Comparecimento a ≥80% dos ciclos programados; ausência de interrupções não programadas do tratamento; adesão ao esquema medicamentoso domiciliar', NULL, TRUE, 'protocolo institucional de extravasamento imediatamente se confirmado
identificar droga extravasada e protocolo específico (antídoto se vesicante)
acionar médico imediatamente
acompanhar evolução da lesão'),
  ('DXNOC0053', '00078', 1609, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente cumpre orientações de autocuidado; busca serviço em situações de urgência; agenda e comparece às consultas de seguimento', 'Paciente cumpre orientações de autocuidado; busca serviço em situações de urgência; agenda e comparece às consultas de seguimento', NULL, TRUE, 'Realizar curativo de PAC/CVC conforme protocolo institucional
inspecionar sítio de inserção a cada visita
trocar fixação conforme protocolo
orientar paciente sobre cuidados domiciliares com acesso'),
  ('DXNOC0054', '00078', 2605, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Família apoia e facilita o comparecimento ao tratamento; participa de consultas quando necessário; suporta adesão domiciliar ao plano terapêutico', 'Família apoia e facilita o comparecimento ao tratamento; participa de consultas quando necessário; suporta adesão domiciliar ao plano terapêutico', NULL, TRUE, 'uso de calçados confortáveis e meias de algodão (PPE)
recomendar creme emoliente/ureia para mãos e pés
contraindicar atividades que aumentem pressão plantar em PPE grau ≥2
orientar proteção solar durante tratamento com agentes fotossensibilizantes'),
  ('DXNOC0055', '00085', 208, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente mantém deambulação independente ou com auxílio mínimo; ausência de quedas no período; amplitude de movimento preservada para AVDs essenciais', 'Paciente mantém deambulação independente ou com auxílio mínimo; ausência de quedas no período; amplitude de movimento preservada para AVDs essenciais', NULL, TRUE, 'sobre sinais de extravasamento (dor, ardência, edema no sítio)
ensinar inspeção diária de mãos e pés
recomendar hidratação intensiva da pele
orientar proteção solar adequada'),
  ('DXNOC0056', '00085', 200, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente tolera atividade física leve diária; sem piora da neuropatia com exercício orientado; ECOG estável ou melhorado', 'Paciente tolera atividade física leve diária; sem piora da neuropatia com exercício orientado; ECOG estável ou melhorado', NULL, TRUE, 'padrão de sono (duração, qualidade, fatores de interferência)
aplicar ESAS para sono
orientar higiene do sono (horários regulares, ambiente escuro/silencioso, evitar telas)
recomendar evitar cafeína após 14h'),
  ('DXNOC0057', '00085', 1902, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ambiente domiciliar adaptado para segurança; paciente usa calçados adequados; cuidador orientado sobre suporte à deambulação', 'Ambiente domiciliar adaptado para segurança; paciente usa calçados adequados; cuidador orientado sobre suporte à deambulação', NULL, TRUE, 'técnicas de relaxamento progressivo muscular
orientar respiração diafragmática antes de dormir
recomendar meditação guiada ou sons relaxantes
orientar banho morno antes de dormir
encaminhar para psicologia se insônia persistente'),
  ('DXNOC0058', '00136', 1304, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente verbaliza elaboração progressiva das perdas; mantém projetos de vida durante o tratamento; busca suporte ativo quando necessário', 'Paciente verbaliza elaboração progressiva das perdas; mantém projetos de vida durante o tratamento; busca suporte ativo quando necessário', NULL, TRUE, 'corticosteroides e dexametasona no esquema antiemético como causa de insônia
orientar administração de corticoide pela manhã quando possível
acionar médico para ajuste se necessário'),
  ('DXNOC0059', '00136', 1300, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente demonstra adaptação progressiva à doença; mantém esperança realista; adere ao tratamento mesmo diante de dificuldades emocionais', 'Paciente demonstra adaptação progressiva à doença; mantém esperança realista; adere ao tratamento mesmo diante de dificuldades emocionais', NULL, TRUE, 'ansiedade e depressão como causas de insônia
encaminhar para psicologia/psiquiatria se indicado
validar impacto da insônia na qualidade de vida
orientar família sobre suporte ao repouso do paciente'),
  ('DXNOC0060', '00136', 2000, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente relata sentido e propósito na vida; ESAS para bem-estar emocional ≤4; mantém relações afetivas significativas', 'Paciente relata sentido e propósito na vida; ESAS para bem-estar emocional ≤4; mantém relações afetivas significativas', NULL, TRUE, 'dor noturna como causa de insônia
ajustar analgesia para cobertura noturna
recomendar posicionamento confortável
orientar técnicas de conforto não farmacológicas'),
  ('DXNOC0061', '00155', 1909, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente demonstra adaptações domiciliares implementadas; usa calçados adequados; solicita auxílio para deambulação quando necessário', 'Paciente demonstra adaptações domiciliares implementadas; usa calçados adequados; solicita auxílio para deambulação quando necessário', NULL, TRUE, 'frequência, consistência e volume das evacuações
classificar grau CTCAE
orientar loperamida conforme prescrição'),
  ('DXNOC0062', '00155', 1828, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente verbaliza fatores de risco personalizados; identifica situações de maior risco; demonstra estratégias de prevenção', 'Paciente verbaliza fatores de risco personalizados; identifica situações de maior risco; demonstra estratégias de prevenção', NULL, TRUE, 'Diferenciar diarreia de pseudodiarreia por impactação
orientar dieta pobre em fibras insolúveis e lactose na fase aguda
recomendar BRAT (banana, arroz, maçã, torrada)'),
  ('DXNOC0063', '00155', 1912, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ausência de quedas com lesão durante o tratamento; episódios de quase-queda comunicados e avaliados; ambiente domiciliar adaptado', 'Ausência de quedas com lesão durante o tratamento; episódios de quase-queda comunicados e avaliados; ambiente domiciliar adaptado', NULL, TRUE, 'reposição hídrica oral (SRO ou líquidos claros)
acionar médico para hidratação EV se diarreia grau ≥3
pesar paciente a cada consulta'),
  ('DXNOC0064', '00032', 403, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'SpO2 ≥95% em ar ambiente; ausência de dispneia em repouso; padrão respiratório eupneico', 'SpO2 ≥95% em ar ambiente; ausência de dispneia em repouso; padrão respiratório eupneico', NULL, TRUE, 'Colher coprocultura se diarreia persistente ou com sangue
orientar higiene rigorosa das mãos após evacuações
descartar Clostridium difficile em uso prévio de antibiótico'),
  ('DXNOC0065', '00032', 402, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Ausência de cianose; frequência respiratória 12-20 ipm; ausência de tiragem ou uso de musculatura acessória', 'Ausência de cianose; frequência respiratória 12-20 ipm; ausência de tiragem ou uso de musculatura acessória', NULL, TRUE, 'sinais de alarme (sangue, muco, febre, desidratação grave)
ensinar uso correto da loperamida
fornecer lista de alimentos recomendados e contraindicados
orientar higiene perianal rigorosa
fornecer contato de urgência do serviço'),
  ('DXNOC0066', '00032', 1902, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Paciente verbaliza sinais de alerta respiratório; não fuma durante o tratamento; busca atendimento imediato se dispneia aguda', 'Paciente verbaliza sinais de alerta respiratório; não fuma durante o tratamento; busca atendimento imediato se dispneia aguda', NULL, TRUE, 'padrão evacuatório basal e atual
classificar grau CTCAE
orientar laxativo prescrito profilaticamente em uso de opioide
recomendar aumento de ingestão hídrica (≥2L/dia se tolerado)'),
  ('DXNOC0067', '00179', 2300, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Glicemia em jejum ≤130 mg/dL; ausência de episódios de hipoglicemia grave durante tratamento; glicemia pós-corticoide <200 mg/dL', 'Glicemia em jejum ≤130 mg/dL; ausência de episódios de hipoglicemia grave durante tratamento; glicemia pós-corticoide <200 mg/dL', NULL, TRUE, 'dieta com fibras solúveis (aveia, frutas)
recomendar atividade física leve
orientar massa abdominal e posição de cócoras
acionar médico se sem evacuação por >3 dias'),
  ('DXNOC0068', '00179', 1820, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente monitora glicemia conforme orientado; reconhece sinais de hipo e hiperglicemia; adapta alimentação nos dias de corticoide', 'Paciente monitora glicemia conforme orientado; reconhece sinais de hipo e hiperglicemia; adapta alimentação nos dias de corticoide', NULL, TRUE, 'ingestão hídrica adequada (mínimo 2L/dia)
orientar sobre bebidas que estimulam peristaltismo (suco de ameixa, água morna)'),
  ('DXNOC0069', '00179', 2111, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ausência de episódios de hiperglicemia grave; sem cetonúria; sem internações por descompensação diabética durante QT', 'Ausência de episódios de hiperglicemia grave; sem cetonúria; sem internações por descompensação diabética durante QT', NULL, TRUE, 'Revisar medicamentos constipantes (opioides, ondansetrona, ferro, carbonato de cálcio)
propor ao médico rotação de antiemético se possível
orientar laxativo osmótico profilático em uso de opioide'),
  ('DXNOC0070', '00205', 414, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Ausência de episódios de choque durante o tratamento; reações de hipersensibilidade identificadas e tratadas precocemente; hemodinâmica estável durante todas as infusões', 'Ausência de episódios de choque durante o tratamento; reações de hipersensibilidade identificadas e tratadas precocemente; hemodinâmica estável durante todas as infusões', NULL, TRUE, 'sinais de alarme (distensão, dor intensa, ausência de gases)
ensinar uso correto de laxativos
fornecer lista de alimentos que auxiliam o trânsito
orientar sobre importância de não suprimir urgência evacuatória'),
  ('DXNOC0071', '00205', 802, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'PA, FC e SpO2 dentro dos parâmetros normais durante e após infusão; ausência de hipotensão ou taquicardia durante QT', 'PA, FC e SpO2 dentro dos parâmetros normais durante e após infusão; ausência de hipotensão ou taquicardia durante QT', NULL, TRUE, 'PA, FC e ritmo cardíaco antes de cada ciclo
verificar resultado de ecocardiograma (FEVE) conforme protocolo
notificar médico se FEVE <50% ou queda ≥10%'),
  ('DXNOC0072', '00205', 1902, 'Alta', 'Ambulatório; Intercorrência; Seguimento', 'Equipe treinada e capacitada para manejo de emergências; kit de anafilaxia disponível e verificado; protocolo de febre neutropênica implementado e acessível', 'Equipe treinada e capacitada para manejo de emergências; kit de anafilaxia disponível e verificado; protocolo de febre neutropênica implementado e acessível', NULL, TRUE, 'ECG conforme protocolo para drogas arritmogênicas
manter carrinho de emergência acessível
treinar equipe para reconhecimento de arritmias'),
  ('DXNOC0073', '00061', 2202, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Cuidador demonstra competência para os cuidados essenciais; verbaliza sinais de alarme; sabe quando e como acionar o serviço', 'Cuidador demonstra competência para os cuidados essenciais; verbaliza sinais de alarme; sabe quando e como acionar o serviço', NULL, TRUE, 'sinais vitais durante infusão de drogas cardiotóxicas
acionar médico imediatamente se alterações hemodinâmicas'),
  ('DXNOC0074', '00061', 2208, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Cuidador relata redução da sobrecarga; utiliza estratégias de autocuidado; tem revezamento no cuidado', 'Cuidador relata redução da sobrecarga; utiliza estratégias de autocuidado; tem revezamento no cuidado', NULL, TRUE, 'sobre sinais e sintomas de alerta cardíaco (dispneia, palpitações, edema súbito)
orientar restrição de atividade física intensa em fase de cardiotoxicidade
recomendar controle de fatores de risco cardiovascular (PA, glicemia, tabagismo)'),
  ('DXNOC0075', '00061', 2600, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Família organiza revezamento no cuidado; busca suporte quando necessário; mantém comunicação aberta com a equipe', 'Família organiza revezamento no cuidado; busca suporte quando necessário; mantém comunicação aberta com a equipe', NULL, TRUE, 'pressão arterial e FC antes, durante e após infusão
orientar sobre hidratação adequada
acionar cardiologia se indicado'),
  ('DXNOC0076', '00023', 503, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente esvazia bexiga completamente; ausência de resíduo pós-miccional significativo; diurese preservada ≥0,5 mL/kg/h', 'Paciente esvazia bexiga completamente; ausência de resíduo pós-miccional significativo; diurese preservada ≥0,5 mL/kg/h', NULL, TRUE, 'sinais clínicos de desidratação (mucosas, turgor, diurese)
pesar paciente antes de cada ciclo
orientar ingestão hídrica oral ≥30 mL/kg/dia
acionar médico para prescrição de hidratação EV se sinais de desidratação moderada/grave'),
  ('DXNOC0077', '00023', 500, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Ausência de retenção urinária aguda; paciente reconhece e relata alterações do padrão miccional; sem necessidade de sondagem de alívio', 'Ausência de retenção urinária aguda; paciente reconhece e relata alterações do padrão miccional; sem necessidade de sondagem de alívio', NULL, TRUE, 'diurese e características'),
  ('DXNOC0078', '00023', 1902, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente verbaliza sinais de retenção urinária; monitora diurese diariamente; busca atendimento imediato se ausência de diurese', 'Paciente verbaliza sinais de retenção urinária; monitora diurese diariamente; busca atendimento imediato se ausência de diurese', NULL, TRUE, 'Controlar perdas por vômito com antiemético eficaz
orientar reposição hídrica oral fracionada
acionar médico para resgate EV'),
  ('DXNOC0079', '00124', 1201, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente verbaliza perspectivas para o futuro próximo; mantém algum projeto de vida; demonstra motivação para o tratamento', 'Paciente verbaliza perspectivas para o futuro próximo; mantém algum projeto de vida; demonstra motivação para o tratamento', NULL, TRUE, 'perdas pela diarreia
orientar soro de reidratação oral
calcular déficit hídrico estimado
acionar médico se desidratação grave'),
  ('DXNOC0080', '00124', 1409, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'PHQ-9 <10; paciente busca suporte quando sentimentos de desesperança intensificam; adere ao tratamento psicológico/psiquiátrico', 'PHQ-9 <10; paciente busca suporte quando sentimentos de desesperança intensificam; adere ao tratamento psicológico/psiquiátrico', NULL, TRUE, 'ingestão de líquidos em pequenas quantidades e frequentes
ensinar sinais de desidratação para reconhecimento precoce
fornecer orientação sobre SRO caseiro
orientar evitar diuréticos naturais em excesso
fornecer contato para urgência'),
  ('DXNOC0081', '00124', 2000, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente identifica fontes de significado e prazer na vida; mantém vínculos afetivos; participa de decisões sobre seu cuidado', 'Paciente identifica fontes de significado e prazer na vida; mantém vínculos afetivos; participa de decisões sobre seu cuidado', NULL, TRUE, 'impacto das mudanças corporais na autoestima (ESAS)
validar sentimentos sem minimizar
fornecer orientações sobre alopecia e caráter reversível quando aplicável
apresentar recursos de apoio (Projeto Cabelegria, próteses capilares pelo SUS)
encaminhar para psicologia'),
  ('DXNOC0082', '00007', 800, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Temperatura axilar <37,8°C em 48-72h após início do antibiótico; ausência de calafrios; FC e FR normalizadas', 'Temperatura axilar <37,8°C em 48-72h após início do antibiótico; ausência de calafrios; FC e FR normalizadas', '72h', TRUE, 'Criar espaço seguro para expressão de sentimentos sobre corpo
envolver parceiro(a)/família com consentimento
conectar com grupos de apoio de pacientes oncológicos
identificar pontos de autoestima preservados
reforçar identidade além do corpo físico'),
  ('DXNOC0083', '00007', 703, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Sem progressão para choque séptico; hemoculturas negativas em 72h; parâmetros inflamatórios em queda', 'Sem progressão para choque séptico; hemoculturas negativas em 72h; parâmetros inflamatórios em queda', '72h', TRUE, 'Identificar rede de suporte social
conectar com assistente social para recursos disponíveis
apresentar grupos de apoio presenciais ou online
orientar família sobre como apoiar sem reforçar estigma'),
  ('DXNOC0084', '00007', 1902, 'Alta', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente e família reconhecem temperatura de alarme; ligam imediatamente ao serviço se febre; comparecem à urgência sem atrasos', 'Paciente e família reconhecem temperatura de alarme; ligam imediatamente ao serviço se febre; comparecem à urgência sem atrasos', NULL, TRUE, 'Identificar e reforçar pontos fortes do paciente
estimular atividades que promovam bem-estar (música, leitura, artesanato)
orientar cuidados de imagem possíveis (maquiagem, lenços, roupas adaptadas)
encaminhar para terapia ocupacional'),
  ('DXNOC0085', '00108', 301, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente realiza higiene corporal básica com auxílio mínimo; mantém pele e mucosas higienizadas; sem lesões por falta de higiene', 'Paciente realiza higiene corporal básica com auxílio mínimo; mantém pele e mucosas higienizadas; sem lesões por falta de higiene', NULL, TRUE, 'família sobre impacto psicológico das mudanças corporais
orientar sobre linguagem de suporte sem reforçar estigma
incluir família nas estratégias de adaptação
encaminhar para psicologia familiar se necessário'),
  ('DXNOC0086', '00108', 300, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente mantém independência nas AVDs básicas compatível com seu estado clínico; usa adaptações e equipamentos disponíveis; solicita auxílio quando necessário', 'Paciente mantém independência nas AVDs básicas compatível com seu estado clínico; usa adaptações e equipamentos disponíveis; solicita auxílio quando necessário', NULL, TRUE, 'Identificar barreiras específicas à adesão (transporte, trabalho, cuidado de filhos, letramento)
desenvolver estratégias individualizadas de superação
negociar metas realistas de adesão
realizar follow-up telefônico em faltas'),
  ('DXNOC0087', '00108', 1308, 'Intermediária', 'Ambulatório; Telemonitoramento; Intercorrência; Seguimento', 'Paciente adapta-se progressivamente às limitações; utiliza recursos de auxílio sem resistência; mantém dignidade no autocuidado', 'Paciente adapta-se progressivamente às limitações; utiliza recursos de auxílio sem resistência; mantém dignidade no autocuidado', NULL, TRUE, 'Simplificar regime domiciliar ao máximo
fornecer lista escrita clara de medicamentos e horários
confirmar que paciente tem como buscar medicamentos
verificar transporte para próximas consultas
acionar assistente social para barreiras socioeconômicas'),
  ('DXNOC0088', '00054', 1503, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente mantém ≥2 contatos sociais significativos por semana; participa de grupo de apoio; relata redução da solidão', 'Paciente mantém ≥2 contatos sociais significativos por semana; participa de grupo de apoio; relata redução da solidão', NULL, TRUE, 'Encaminhar para serviço social para suporte de passagem, cesta básica, benefícios
articular com CAPS/UBS de referência para suporte próximo ao domicílio
identificar benefícios sociais elegíveis (BPC, auxílio-doença)'),
  ('DXNOC0089', '00054', 1205, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente verbaliza sentimento de pertencimento; mantém identidade social além da doença; demonstra iniciativa em contatos sociais', 'Paciente verbaliza sentimento de pertencimento; mantém identidade social além da doença; demonstra iniciativa em contatos sociais', NULL, TRUE, 'Explicar consequências clínicas de interrupção do tratamento em linguagem acessível
reforçar positivamente pequenos progressos
envolver família/cuidador no suporte à adesão
disponibilizar contato fácil para dúvidas
aplicar teach-back sobre plano terapêutico'),
  ('DXNOC0090', '00054', 2000, 'Suporte', 'Ambulatório; Telemonitoramento; Consulta inicial', 'Paciente relata melhora no suporte social percebido; ESAS para bem-estar social ≤3; mantém papel social compatível com estado clínico', 'Paciente relata melhora no suporte social percebido; ESAS para bem-estar social ≤3; mantém papel social compatível com estado clínico', NULL, TRUE, 'Realizar reunião de equipe para casos de baixa adesão
envolver assistente social, psicólogo e farmácia
construir plano de cuidado pactuado com o paciente');