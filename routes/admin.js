const express = require('express');
const router  = express.Router();
const pool    = require('../db/connection');

// POST /api/admin/migrate-col-f?secret=oncoguia2024
// One-time migration: populate contexto_uso (Column F family orientations) in intervencoes_nic
router.post('/migrate-col-f', async (req, res) => {
    if (req.query.secret !== 'oncoguia2024') {
        return res.status(401).json({ erro: 'Não autorizado.' });
    }

    const updates = [
        { codigo: 180,  texto: `Entenda que a fadiga não é "preguiça".\nAjude nas atividades quando necessário.\nRespeite os momentos de descanso.\nIncentive, mas sem pressionar.\nSono: Tente manter horários regulares para dormir; Evite celular/TV antes de dormir; Avise se tiver dificuldade para dormir.` },
        { codigo: 200,  texto: `Emoções: O cansaço pode afetar o humor. Fale sobre como está se sentindo; Buscar apoio psicológico pode ajudar.` },
        { codigo: 221,  texto: `Ajudar com segurança, sem fazer tudo pelo paciente\nIncentivar independência\nEstar atento ao risco de quedas e atuar na prevenção\nApoiar, mas respeitar limites\nSinais de alerta - procurar atendimento: queda ou fraqueza intensa` },
        { codigo: 430,  texto: `Ajudar na hidratação\nObservar sinais de piora\nAuxiliar nos cuidados com higiene` },
        { codigo: 450,  texto: `Incentivar ingestão de líquidos\nAjudar na alimentação adequada\nEstimular mobilidade\nObservar alterações no hábito intestinal` },
        { codigo: 460,  texto: `Apoiar na alimentação adequada` },
        { codigo: 590,  texto: `Observar se o paciente está urinando\nIncentivar hidratação\nComunicar alterações à equipe` },
        { codigo: 1100, texto: `Incentivar sem forçar.\nOferecer alimentos preferidos do paciente.\nRespeitar limites, mas estimular a alimentação.\nAjudar na organização das refeições.` },
        { codigo: 1160, texto: `Se tiver dor na boca: escolha alimentos macios e pastosos.\nSe tiver alteração de paladar: testar novos temperos pode ajudar.\nHidratação: Beba líquidos ao longo do dia; Evite beber muito líquido junto das refeições (para não "encher rápido").` },
        { codigo: 1400, texto: `Acreditar no relato do paciente.\nAjudar na administração dos medicamentos.\nObservar sinais de piora.\nAcredite quando o paciente relata dor.\nAjude a lembrar os horários dos medicamentos.\nObserve mudanças de comportamento.\nOfereça apoio sem julgar.` },
        { codigo: 1450, texto: `Ajudar na alimentação.\nObservar sinais de desidratação: boca seca, pouca urina, urina escura, fraqueza.\nIncentivar uso correto da medicação.` },
        { codigo: 1570, texto: `Oferecer alimentos em pequenas porções.\nIncentivar a alimentação oferecendo alimentos variados` },
        { codigo: 1710, texto: `Incentivar e ajudar na higiene oral.\nObservar lesões na boca.\nApoiar na alimentação adequada.\nComunicar alterações à equipe.` },
        { codigo: 1720, texto: `Sinais de alerta - Procurar atendimento se esses sinais aparecerem ou piorarem: feridas na boca; placas brancas, sangramento; dificuldade para engolir.` },
        { codigo: 1801, texto: `Ajudar sem tirar autonomia\nRespeitar privacidade\nEstimular participação\nEvitar: fazer tudo pelo paciente, expor desnecessariamente\nProcurar ajuda se: Paciente não consegue mais realizar higiene, apresenta lesões, há piora rápida da funcionalidade` },
        { codigo: 1850, texto: `Respeitar o momento de descanso\nEvitar interrupções desnecessárias` },
        { codigo: 2120, texto: `Ajudar no controle da glicemia\nObservar sinais de alteração\nAuxiliar na alimentação\nApoiar adesão ao tratamento` },
        { codigo: 2380, texto: `Quando procurar ajuda: Uso frequente de medicação para dormir\nInforme se estiver usando remédios que prendem o intestino\nSinais de alerta - Procurar atendimento: Muitos dias sem evacuar` },
        { codigo: 2440, texto: `Avisar a equipe imediatamente: Vermelhidão que não desaparece\nAvisar a equipe imediatamente: Dor em alguma região` },
        { codigo: 3140, texto: `Manter ambiente calmo\nAjudar a posicionar o paciente\nObservar sinais de piora\nAcionar ajuda quando necessário` },
        { codigo: 3590, texto: `Ajudar na mudança de posição\nObservar a pele diariamente\nAuxiliar na higiene\nIncentivar alimentação e hidratação` },
        { codigo: 3740, texto: `Observar sinais de alerta\nAjudar a medir temperatura\nLevar rapidamente ao serviço\nContato com o serviço: Ter telefone acessível, procurar ajuda imediatamente` },
        { codigo: 4040, texto: `Ajudar no controle de medicamentos\nObservar sinais de piora\nApoiar na alimentação adequada\nIncentivar acompanhamento médico` },
        { codigo: 4120, texto: `Incentivar ingestão de líquidos\nObservar sinais de desidratação\nAjudar no controle de ingestão` },
        { codigo: 4130, texto: `Procurar ajuda se houver piora\nObserve diarreia ou vômitos e avise a equipe se estiver perdendo muito líquido\nSinais de desidratação: Boca seca, pouca urina, tontura, olhos fundos` },
        { codigo: 4250, texto: `Observar sinais de piora\nNão esperar para procurar ajuda\nApoiar no acompanhamento do paciente` },
        { codigo: 4360, texto: `Ajudar na organização dos horários\nApoiar sem pressionar\nParticipar das orientações\nEstar atento a sinais de dificuldade` },
        { codigo: 5100, texto: `Estar presente emocionalmente\nManter contato frequente\nEscutar sem julgamento\nEvitar: Superproteção, minimizar sentimentos, afastamento excessivo` },
        { codigo: 5220, texto: `Respeitar o tempo do paciente\nEvitar críticas ou comparações\nOferecer apoio emocional\nOuvir com atenção\nComunique com a equipe quando observar: tristeza intensa, isolamento social` },
        { codigo: 5270, texto: `Quando procurar ajuda: ansiedade intensa ou constante, crises de pânico, insônia persistente, dificuldade para realizar atividades do dia a dia.\nBuscar ajuda profissional\nNão esperar piorar` },
        { codigo: 5290, texto: `Esteja presente\nOuça sem julgar\nEvite minimizar a dor\nRespeite o tempo do paciente` },
        { codigo: 5310, texto: `Ouvir sem julgar\nEvitar frases como: "Você precisa ser forte"\nEstar presente\nIncentivar tratamento` },
        { codigo: 5380, texto: `Ouça o paciente sem julgar.\nNão minimize o medo.\nEsteja presente.\nAjude a buscar informações com a equipe.` },
        { codigo: 5602, texto: `Sinais de alerta: Saiba quando procurar atendimento; Em caso de dúvida, entre em contato com a equipe.` },
        { codigo: 5606, texto: `Participar das orientações ajuda muito.\nAjudar a lembrar horários e cuidados.\nIncentivar o paciente a seguir o tratamento.\nAjudar na organização das informações.` },
        { codigo: 5614, texto: `Sinais de alerta - Informar a equipe: perda de peso; falta de apetite persistente; dificuldade para engolir; fraqueza intensa.\nProcurar atendimento imediatamente: Fraqueza ou tontura\nSinais de alerta - Procurar atendimento: Dor abdominal intensa\nSinais de alerta - Procurar atendimento: Barriga muito inchada\nSinais de alerta - Procurar atendimento: Fezes muito duras ou com sangue\nOrientar sinais de início de desidratação (Sede aumentada, Boca e mucosas secas, Redução da saliva, Urina mais escura e concentrada, Diminuição da frequência urinária, Pele seca).` },
        { codigo: 5820, texto: `Ouça sem julgar.\nEvite minimizar o sentimento ("isso não é nada").\nAjude a esclarecer dúvidas com a equipe.\nOfereça presença e apoio.` },
        { codigo: 6040, texto: `Ajudar a manter ambiente tranquilo\nQuando procurar ajuda: Insônia persistente\nQuando procurar ajuda: Cansaço intenso durante o dia` },
        { codigo: 6490, texto: `Acompanhar pacientes de risco\nAdaptar o ambiente: Evite tapetes soltos pela casa, deixe o caminho livre e use boa iluminação, principalmente à noite\nIncentivar segurança (sem superproteger)\nEstar atento a mudanças` },
        { codigo: 6540, texto: `Procurar atendimento imediatamente: Sangue nas fezes` },
        { codigo: 6550, texto: `Apoiar nos cuidados com higiene, alimentação.\nObservar sinais de alerta.\nEvitar exposição desnecessária do paciente a aglomerações, locais fechados ou contato com pessoas doentes.\nSinais de alerta - Procurar atendimento IMEDIATO se: febre ≥ 38°C, calafrios, fraqueza intensa ou qualquer sinal de infecção.` },
        { codigo: 7040, texto: `Compartilhar responsabilidades\nApoiar o cuidador principal\nEvitar sobrecarga em uma única pessoa\nManter comunicação aberta` },
        { codigo: 7370, texto: `Alimentação, hidratação e atividade são importantes` },
    ];

    const client = await pool.connect();
    try {
        await client.query('BEGIN');
        let updated = 0;
        for (const u of updates) {
            const r = await client.query(
                'UPDATE intervencoes_nic SET contexto_uso = $1, updated_at = NOW() WHERE codigo_nic = $2',
                [u.texto, u.codigo]
            );
            updated += r.rowCount;
        }
        await client.query('COMMIT');
        res.json({ ok: true, atualizados: updated, total: updates.length });
    } catch (err) {
        await client.query('ROLLBACK');
        console.error('[admin.migrate-col-f]', err.message);
        res.status(500).json({ erro: err.message });
    } finally {
        client.release();
    }
});

module.exports = router;
