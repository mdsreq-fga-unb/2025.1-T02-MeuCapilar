[Clique Aqui (Disponível apenas para pessoas em UnB.br).](https://unbbr.sharepoint.com/:v:/s/MeuCapilar-Requisitos/EUbg9XloSRdIlyWkvBRYHaMBcSaqBCvfRpCKO_NuX-FNUw?e=DbVfN2&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D)

# Sprint Review - Sprint 4

**Data:** 11/07/2025  
**Horário:** 21:31 (Início da gravação)  
**Duração:** 40m 51s  
**Local:** Teams
**Participantes:**  
- Ian Costa Guimaraes (Scrum Master)  
- Jose Andre Rabelo Rocha  
- Pedro Luciano De Azevedo
- Caua Araujo Dos Santos
- Flavia Rabello (Cliente/Product Owner)

---

## Objetivo da Reunião
Apresentar à cliente (Flavia Rabello) as funcionalidades desenvolvidas na Sprint 4, com foco na autenticação de usuários e no histórico de atendimentos do paciente. Adicionalmente, apresentar um *spoiler* das funcionalidades de geração de registros clínicos (relatórios) que serão formalmente entregues na próxima sprint.

---

## Funcionalidades Apresentadas e Validadas

### 1. **Autenticação e Autorização (Login e Cadastro)**
- **Fluxo de Cadastro do Terapeuta**:
    - O terapeuta se cadastra com e-mail e senha.
    - Recebe um e-mail de confirmação para ativar a conta.
    - Após a confirmação, é redirecionado para completar o perfil.
- **Fluxo de Cadastro do Paciente**:
    - O terapeuta cadastra o paciente apenas com o e-mail.
    - O paciente recebe um e-mail para confirmar sua conta e definir sua própria senha.
    - O status do paciente muda de "Inativo" para "Ativo" no painel do terapeuta somente após a confirmação do e-mail.
- **Feedback da Cliente**: **Positivo**. A cliente elogiou o fluxo, considerando-o "muito bom" e profissional.

### 2. **Histórico de Atendimentos (Visão do Paciente)**
- Foi demonstrado que, após o login, o paciente consegue visualizar seus próximos atendimentos agendados em seu dashboard, com informações como data, horário, nome do terapeuta e tipo de serviço.
- **Feedback da Cliente**: **Positivo**. A funcionalidade foi bem recebida.

### 3. **Demonstração Antecipada (Spoiler da Próxima Sprint)**
- **Geração de Registros Clínicos**:
    - Apresentado o novo módulo de "Registros Clínicos", onde o terapeuta pode criar, filtrar e visualizar registros por paciente ou tipo de atendimento.
    - **Upload de Imagens**: Demonstração do upload de até 10 imagens (incluindo formato .bmp, eliminando a necessidade de conversão manual).
    - **Edição de Imagens**: Mostrada a capacidade de desenhar círculos e setas diretamente nas imagens para destacar pontos de interesse.
    - **Exportação para PDF**: Apresentada a funcionalidade de exportar o registro clínico completo, com dados e imagens, para um arquivo PDF.
- **Feedback da Cliente**: **Extremamente positivo**. A cliente ficou muito satisfeita, afirmando que "evoluiu bastante", "está ficando muito bom" e que a funcionalidade de edição de imagens é um grande diferencial.

---

## Pontos de Discussão e Novos Requisitos

1.  **Anamnese e Protocolo de Tratamento**:
    - **Necessidade**: A cliente solicitou a inclusão dos campos do formulário de anamnese na avaliação inicial para torná-la mais completa.
    - **Distinção de Protocolos**: Foi esclarecido que o "Protocolo Realizado" (detalhes técnicos do tratamento) é confidencial e não deve ser exportado para o paciente. A sugestão foi renomear o campo visível para "Tratamento Proposto".
    - **Ação**: Criar um campo de anotações visível apenas para o terapeuta, onde ele possa registrar o "Protocolo Realizado" sem que o paciente tenha acesso.

2.  **Acesso do Paciente Pós-Tratamento**:
    - **Questão**: A cliente levantou a necessidade de controlar o acesso do paciente à plataforma após o término do tratamento.
    - **Solução Proposta**: O terapeuta poderá marcar o paciente como "inativo", revogando seu acesso ao sistema.

3.  **Exportação de Relatórios**:
    - A cliente validou que a opção de baixar o PDF para enviar via WhatsApp é mais útil do que um envio automático por e-mail, dando mais flexibilidade ao terapeuta.

---

## Próximos Passos
- **Finalizar Módulo de Registros**: Concluir o desenvolvimento do módulo de registros clínicos, incluindo os ajustes de layout no PDF e a implementação dos feedbacks da cliente.
- **Implementar Novos Requisitos**:
    - Adicionar um campo de anotações privadas para o "Protocolo Realizado".
    - Renomear o campo público para "Tratamento Proposto".
    - Implementar a funcionalidade para o terapeuta inativar o acesso de um paciente.
- **Agendar Próxima Review**: Apresentar formalmente o módulo de registros clínicos completo na próxima reunião, marcada para a segunda-feira seguinte.
