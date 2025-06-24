# PRODUCT BACKLOG BUILDING (PBB) – TechFix

<iframe width="768" height="432" src="https://miro.com/app/live-embed/uXjVInqxgAE=/?embedMode=view_only_without_ui&moveToViewport=-16304,-538,44264,13272&embedId=500805429829" frameborder="0" scrolling="no" allow="fullscreen; clipboard-read; clipboard-write" allowfullscreen></iframe>

## PRODUCT NAME

**TechFix Service Hub** – plataforma web e mobile para gestão de chamados de assistência técnica de equipamentos eletrônicos.

## PROBLEMAS

- Atrasos e falta de previsibilidade na chegada dos técnicos devido a conflitos de agenda.
- Registros manuais de serviços geram retrabalho e perda de dados cruciais.
- Comunicação fragmentada entre cliente, atendente e técnico causa confusão sobre status do chamado.
- Relatórios inconsistentes dificultam decisões operacionais pela gestão.

## EXPECTATIVAS

**Redução no tempo e aumento da eficiência operacional**  
A plataforma deve reduzir em até 30% o tempo médio de atendimento, otimizando a roteirização dos técnicos e eliminando retrabalhos com registros manuais.

**Comunicação centralizada e transparente**  
Ao integrar chat e rastreamento em tempo real, a solução trará mais clareza para clientes e maior coordenação entre suporte e técnicos.

**Decisões baseadas em dados confiáveis**  
Relatórios automáticos e dashboards em tempo real permitirão que gestores acompanhem KPIs com precisão e agilidade.

**Melhoria na experiência e satisfação do cliente**  
Com processos mais rápidos, feedback facilitado e maior previsibilidade, espera-se alcançar um CSAT ≥ 4,5/5.

---

## PERSONAS

| Persona             | Descrição                                      | Necessidade-chave                                               |
|---------------------|-----------------------------------------------|------------------------------------------------------------------|
| Técnico de Campo    | Profissional que realiza reparos em campo.     | Roteiro otimizado e informações claras do chamado no app mobile. |
| Gestor de Operações | Responsável por acompanhar KPIs e alocar técnicos. | Visão em tempo real dos atendimentos e relatórios automáticos. |
| Cliente Empresarial | Empresa que contrata manutenção recorrente.    | Agendamento rápido e transparência no status.                    |
| Cliente Residencial | Consumidora que solicita reparo pontual.       | Acompanhamento do técnico e feedback simplificado.              |

---

## FEATURES (FUNCIONALIDADES DE ALTO NÍVEL)

- Agenda inteligente com roteirização automática.
- App mobile offline-first para check-in/out do técnico.
- Chat integrado (cliente ↔ suporte ↔ técnico).
- Painel de métricas (dashboard) em tempo real.
- Módulo de faturamento com emissão de NF-e.
- Integração CRM/ERP via API REST.

---

## BENEFÍCIOS GERADOS PELA SOLUÇÃO TECHFIX

**Redução de atrasos e maior previsibilidade**  
Agenda inteligente com roteirização automática evita conflitos de agenda e garante atendimentos dentro do prazo.

**Eliminação de retrabalho e perda de dados**  
App mobile offline garante registro de serviços sem papel e sem perda de dados.

**Comunicação clara e centralizada**  
Chat integrado elimina ruídos e melhora a experiência de todos os envolvidos.

**Gestão orientada por dados em tempo real**  
Painel de métricas atualizadas facilita decisões rápidas e estratégicas.

---

## PBIs: PRODUCT BACKLOG ITEMS (Histórias de Usuário Prioritárias)

### PBI‑01 – Cadastro de Técnicos (Alta)

**Cenário**  
Dado que o gestor acessa o painel de administração,  
Quando ele preenche os dados do técnico e confirma o cadastro,  
Então o técnico é incluído na escala e aparece na lista de técnicos disponíveis.

**História de Usuário**  
Como Gestor, quero cadastrar técnicos para montar a escala.

**Critérios de Aceitação**
- Adição com nome, especialidade e horários.
- Técnico aparece na escala.
- Validação de campos obrigatórios.
- Possibilidade de editar ou excluir.

---

### PBI‑02 – Consulta de Chamados do Dia (Alta)

**Cenário**  
Dado que o técnico está logado,  
Quando acessa a aba de chamados,  
Então vê atendimentos do dia com local, horário e tipo.

**História de Usuário**  
Como Técnico, quero ver meus chamados do dia para planejar meu trajeto.

**Critérios de Aceitação**
- Lista por ordem de atendimento.
- Exibe cliente, endereço, horário e tipo.
- Atualizações automáticas.
- Marcar como “em andamento” ou “concluído”.

---

### PBI‑03 – Acompanhamento da Localização do Técnico (Alta)

**Cenário**  
Dado que o técnico ativou o check-in,  
Quando o cliente acessa o chamado,  
Então vê a localização no mapa e tempo estimado.

**História de Usuário**  
Como Cliente, quero acompanhar a localização do técnico para saber quando ele chegará.

**Critérios de Aceitação**
- Mostrar posição no mapa após check-in.
- Exibir tempo estimado de chegada.
- Notificar atrasos significativos.
- Atualização periódica da localização.

---

### PBI‑04 – Registro Offline de Serviço (Alta)

**Cenário**  
Dado que o técnico está sem internet,  
Quando realiza check-in e check-out,  
Então os dados são armazenados localmente e sincronizados depois.

**História de Usuário**  
Como Técnico, quero registrar início e fim do serviço mesmo sem internet para não perder dados.

**Critérios de Aceitação**
- Permitir check-in/out offline.
- Armazenamento local até sincronização.
- Incluir data, hora e localização.
- Gestor vê registros sincronizados.

---

### PBI‑05 – Relatório de Desempenho (Média)

**Cenário**  
Dado que o gestor acessa a área de relatórios,  
Quando seleciona técnico e período,  
Então vê dados com opção de exportar PDF.

**História de Usuário**  
Como Gestor, quero gerar relatório por técnico para identificar gargalos.

**Critérios de Aceitação**
- Filtrar por técnico e período.
- Incluir atendimentos, tempo médio e avaliações.
- Exportar em PDF.
- Dados atualizados automaticamente.

---

### PBI‑06 – Avaliação do Serviço (Média)

**Cenário**  
Dado que o atendimento foi finalizado,  
Quando o cliente acessa a avaliação,  
Então pode atribuir nota e comentário.

**História de Usuário**  
Como Cliente, quero avaliar o serviço após a conclusão para fornecer feedback.

**Critérios de Aceitação**
- Convite enviado ao cliente após finalização.
- Avaliação de 1 a 5 e comentário opcional.
- Vínculo da avaliação com atendimento e técnico.
- Visualização no painel do gestor.

---

### PBI‑07 – Alerta de Atraso do Técnico (Média)

**Cenário**  
Dado que o técnico atrasa mais de 15 min,  
Quando o sistema detecta isso,  
Então envia alerta ao gestor com detalhes.

**História de Usuário**  
Como Gestor, quero receber alertas automáticos de atraso para agir rapidamente.

**Critérios de Aceitação**
- Calcular tempo estimado de chegada.
- Enviar notificação ao gestor se atraso > 15 min.
- Incluir técnico, chamado e motivo estimado.
- Permitir reagendamento ou redistribuição.

---

### PBI‑08 – Anexar Fotos ao Laudo (Baixa)

**Cenário**  
Dado que o técnico finaliza o atendimento,  
Quando acessa anexar imagens,  
Então pode tirar ou selecionar fotos para o laudo.

**História de Usuário**  
Como Técnico, quero anexar fotos ao laudo para comprovar o serviço.

**Critérios de Aceitação**
- Tirar fotos ou escolher da galeria.
- Salvar com data/hora e vincular ao chamado.
- Limite de 5 fotos por chamado.
- Visualização pelo gestor no histórico.

---

### PBI‑09 – Exportação de Dados (Baixa)

**Cenário**  
Dado que o gestor deseja análise externa,  
Quando seleciona filtros e clica em exportar,  
Então sistema gera arquivo CSV.

**História de Usuário**  
Como Gestor, quero exportar dados em CSV para análises externas.

**Critérios de Aceitação**
- Exportar por data, técnico e status.
- Arquivo disponível no painel.
- Colunas com ID, cliente, técnico, datas, status.
- Dados atualizados no momento da exportação.

---

### PBI‑10 – Emissão de NF-e Automática (Baixa)

**Cenário**  
Dado que o cliente empresarial tem CNPJ,  
Quando o chamado é concluído,  
Então o sistema emite automaticamente a NF-e.

**História de Usuário**  
Como Cliente Empresarial, quero emitir NF-e automaticamente para fins contábeis.

**Critérios de Aceitação**
- Gerar NF-e após conclusão do serviço.
- Envio automático por e-mail.
- Consulta ao histórico de NF-es.
- Integração com sistema SEFAZ via API.

---

## CRITÉRIOS DE PRIORIZAÇÃO – PROJETO TECHFIX

### 1. Valor para o Usuário

| Nota | Descrição                                |
|------|------------------------------------------|
| 5    | Impacto crítico (essencial)              |
| 3    | Importante (melhora muito a experiência) |
| 1    | Desejável (não essencial)                |

### 2. Urgência / Necessidade Imediata

| Nota | Descrição                               |
|------|-----------------------------------------|
| 5    | Bloqueia entregas ou tem prazo definido |
| 3    | Necessária a curto prazo                |
| 1    | Pode esperar sem grandes impactos       |

### 3. Clareza e Prontidão

| Nota | Descrição           |
|------|---------------------|
| 5    | Totalmente clara    |
| 3    | Requer ajustes      |
| 1    | Pouco definida      |

### 4. Esforço Estimado

| Nota | Descrição     |
|------|---------------|
| 1    | Baixo esforço |
| 3    | Médio esforço |
| 5    | Alto esforço  |

### 5. Fórmula de Priorização

**Prioridade = (Valor + Urgência + Clareza) – Esforço**

**Classificação Final:**

- Alta Prioridade: 11 a 15  
- Média Prioridade: 8 a 10  
- Baixa Prioridade: 7 ou menos
