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

## Behavior-Driven Development (BDD) – Critérios de Aceitação

### PBI‑01 – Cadastro de Técnicos (Alta)

**Cenário: Cadastro de Técnicos**  
Dado que o gestor acessa o painel de administração,  
Quando ele preenche os dados do técnico (nome, especialidade, disponibilidade) e confirma o cadastro,  
Então o técnico é incluído na escala e aparece na lista de técnicos disponíveis.

**Critérios de Aceitação:**
- O gestor consegue adicionar técnicos com nome, especialidade e horários.
- Técnicos aparecem disponíveis para escala após cadastro.
- O sistema impede cadastro com campos obrigatórios vazios.
- É possível editar ou excluir um técnico cadastrado.

---

### PBI‑02 – Consulta de Chamados do Dia (Alta)

**Cenário: Consulta de Chamados do Dia**  
Dado que o técnico está logado no app mobile,  
Quando ele acessa a aba de chamados,  
Então é exibida a lista de atendimentos do dia com detalhes como local, horário e tipo de serviço.

**Critérios de Aceitação:**
- O técnico vê todos os chamados do dia organizados por ordem de atendimento.
- Cada chamado exibe cliente, endereço, horário e tipo de serviço.
- Chamados atualizam automaticamente em caso de alteração pelo gestor.
- O técnico pode marcar chamados como "em andamento" ou "concluído".

---

### PBI‑03 – Acompanhamento da Localização do Técnico (Alta)

**Cenário: Acompanhamento da Localização do Técnico**  
Dado que o técnico iniciou o deslocamento e ativou o check-in,  
Quando o cliente acessa o chamado pelo app,  
Então ele vê a localização atual do técnico no mapa com tempo estimado de chegada.

**Critérios de Aceitação:**
- O cliente visualiza a posição do técnico no mapa após o check-in.
- O app mostra o tempo estimado de chegada.
- O cliente é notificado se houver atrasos significativos.
- A localização é atualizada periodicamente.

---

### PBI‑04 – Registro Offline de Serviço (Alta)

**Cenário: Registro Offline de Serviço**  
Dado que o técnico está sem conexão com a internet,  
Quando ele realiza o check-in e o check-out pelo app,  
Então os dados são armazenados localmente e sincronizados automaticamente quando houver conexão.

**Critérios de Aceitação:**
- O app permite check-in/out mesmo offline.
- Dados são armazenados localmente até a sincronização com a nuvem.
- O registro inclui data, hora e localização.
- O gestor pode ver os registros assim que sincronizados.

---

### PBI‑05 – Geração de Relatório de Desempenho (Média)

**Cenário: Geração de Relatório de Desempenho**  
Dado que o gestor acessa a área de relatórios,  
Quando ele seleciona o técnico e o período desejado,  
Então o sistema exibe os dados de desempenho com opção de exportação em PDF.

**Critérios de Aceitação:**
- O sistema gera relatórios filtrando por técnico e período.
- O relatório inclui número de atendimentos, tempo médio e avaliações.
- É possível exportar o relatório em PDF.
- Dados são atualizados automaticamente a cada novo atendimento registrado.

---

### PBI‑06 – Avaliação do Serviço (Média)

**Cenário: Avaliação do Serviço**  
Dado que o atendimento foi finalizado,  
Quando o cliente acessa a avaliação via app ou e-mail,  
Então ele pode atribuir uma nota e comentário, e o feedback é registrado no sistema.

**Critérios de Aceitação:**
- O cliente recebe um convite para avaliar o serviço após a finalização.
- A avaliação inclui nota de 1 a 5 e campo opcional para comentário.
- O sistema registra a avaliação com vínculo ao atendimento e técnico.
- O gestor pode visualizar avaliações no painel.

---

### PBI‑07 – Alerta de Atraso do Técnico (Média)

**Cenário: Alerta de Atraso do Técnico**  
Dado que o tempo estimado do técnico excede 15 minutos do horário previsto,  
Quando o sistema detecta esse atraso,  
Então um alerta é enviado automaticamente ao gestor com detalhes do chamado e do técnico.

**Critérios de Aceitação:**
- O sistema calcula o tempo previsto de chegada de cada técnico.
- Se houver atraso maior que 15 minutos, o gestor recebe uma notificação.
- O alerta mostra o técnico, chamado e motivo estimado do atraso.
- O gestor pode reagendar ou redistribuir o chamado com base no alerta.

---

### PBI‑08 – Anexar Fotos ao Laudo (Baixa)

**Cenário: Anexar Fotos ao Laudo**  
Dado que o técnico está finalizando o atendimento,  
Quando ele acessa a opção de anexar imagens,  
Então pode tirar fotos ou escolher da galeria para incluir no laudo técnico do chamado.

**Critérios de Aceitação:**
- O técnico pode tirar fotos diretamente do app ou selecionar da galeria.
- As imagens são vinculadas ao chamado e salvas com data/hora.
- É possível anexar até 5 fotos por chamado.
- O gestor pode visualizar as fotos no histórico de atendimento.

---

### PBI‑09 – Exportação de Dados (Baixa)

**Cenário: Exportação de Dados**  
Dado que o gestor deseja realizar uma análise externa,  
Quando ele seleciona os filtros de dados e clica em “Exportar CSV”,  
Então o sistema gera um arquivo com os dados correspondentes para download.

**Critérios de Aceitação:**
- O sistema oferece a opção de exportar dados filtrados por data, técnico e status.
- O arquivo CSV pode ser baixado no painel do gestor.
- As colunas incluem ID do chamado, cliente, técnico, datas e status.
- Os dados são atualizados no momento da exportação.

---

### PBI‑10 – Emissão de NF-e Automática (Baixa)

**Cenário: Emissão de NF-e Automática**  
Dado que o cliente empresarial possui CNPJ e serviço finalizado,  
Quando o chamado é encerrado com status "concluído",  
Então o sistema emite automaticamente a nota fiscal e envia por e-mail.

**Critérios de Aceitação:**
- O sistema gera a NF-e automaticamente após a conclusão do serviço.
- A nota fiscal é enviada para o e-mail cadastrado do cliente.
- O cliente pode consultar o histórico de NF-e emitidas pelo sistema.
- A emissão é integrada a um sistema SEFAZ válido por meio de API.

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
