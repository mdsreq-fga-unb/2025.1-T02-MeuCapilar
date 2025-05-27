## **9. Product Backlog – User Stories**

---

### **9.1 Backlog Geral** 

Nosso backlog é mantido no *Github Projects*, onde especificamos **critérios de aceitação** e **regras de negócio** em cada US, além de utilizarmos tags para:

  - Priorizar as User Stories (US).
  - Identificar a qual funcionalidade ou agrupamento cada US pertence.
  - Classificar o nível de granularidade: Tema, Épico ou User Story.

Essa estrutura organiza e facilita a gestão do backlog, garantindo clareza no desenvolvimento e alinhamento com os objetivos do projeto. 

#### **9.1.1 Objetivo Específico: Agendamento completo dos tratamentos capilares**

<strong>Tema 1:</strong>: Gestão de Pacientes e Atendimento

<strong>Épico 1.1</strong>: Cadastro e Manutenção de Pacientes

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Código</strong></th>
      <th><strong>Prioridade</strong></th>
      <th><strong>User Story</strong></th>
      <th><strong>Critérios de Aceitação</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>US 1.1.1</td>
      <td>MUST</td>
      <td>Como recepcionista, quero cadastrar um novo paciente para iniciar seu acompanhamento.</td>
      <td>
        - Formulário deve conter nome, contato e data de nascimento.<br>
        - Registro salvo no banco de dados.
      </td>
    </tr>
    <tr>
      <td>US 1.1.2</td>
      <td>MUST</td>
      <td>Como terapeuta ou recepcionista, quero buscar e visualizar informações completas do paciente para preparar a sessão.</td>
      <td>
        - Permitir busca por nome ou identificador.<br>
        - Exibir todos os dados relevantes do paciente.
      </td>
    </tr>
    <tr>
      <td>US 1.1.3</td>
      <td>MUST</td>
      <td>Como recepcionista, quero editar os dados do paciente para manter o cadastro sempre atualizado.</td>
      <td>
        - Permitir atualização de nome, contato, data de nascimento.<br>
        - Salvar alterações com segurança.
      </td>
    </tr>
    <tr>
      <td>US 1.1.4</td>
      <td>MUST</td>
      <td>Como recepcionista, quero deletar um paciente registrado por equívoco ou engano.</td>
      <td>
        - Solicitar confirmação antes da exclusão.<br>
        - Remover registro e dependências seguras (com aviso, se necessário).
      </td>
    </tr>
  </tbody>
</table>

<strong>Épico 1.2</strong>: Cadastro e Manutenção de Pacientes

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Código</strong></th>
      <th><strong>Prioridade</strong></th>
      <th><strong>User Story</strong></th>
      <th><strong>Critérios de Aceitação</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>US 1.2.1</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero cadastrar um novo atendimento informando o serviço e horário para manter minha agenda organizada.</td>
      <td>
        - Formulário deve conter serviço, data e horário.<br>
        - Registro salvo no banco de dados.
      </td>
    </tr>
    <tr>
      <td>US 1.2.2</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero editar um atendimento registrado para corrigir informações ou atualizar dados.</td>
      <td>
        - Permitir alteração de serviço, data e horário.<br>
        - Garantir que as alterações sejam persistidas com segurança.
      </td>
    </tr>
    <tr>
      <td>US 1.2.3</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero visualizar o histórico de atendimentos por paciente para acompanhar a evolução do tratamento.</td>
      <td>
        - Exibir lista cronológica de atendimentos.<br>
        - Permitir visualizar detalhes de cada atendimento.
      </td>
    </tr>
    <tr>
      <td>US 1.2.4</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero filtrar os atendimentos por data, profissional ou tipo para facilitar a busca e análise.</td>
      <td>
        - Permitir aplicação de múltiplos filtros.<br>
        - Exibir resultados conforme os critérios selecionados.
      </td>
    </tr>
    <tr>
      <td>US 1.2.5</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero exportar o histórico de atendimentos em PDF para arquivamento.</td>
      <td>
        - Gerar arquivo PDF com todos os atendimentos filtrados ou completos.<br>
        - Disponibilizar opção de download ou envio por e-mail.
      </td>
    </tr>
    <tr>
      <td>US 1.2.6</td>
      <td>SHOULD</td>
      <td>Como recepcionista, quero reagendar atendimentos para atender às solicitações de mudança feitas pelos pacientes.</td>
      <td>
        - Permitir alteração de data e horário.<br>
        - Notificar paciente e terapeuta sobre a mudança.
      </td>
    </tr>
    <tr>
      <td>US 1.2.7</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero cancelar atendimentos para liberar o horário em casos de desistência ou imprevistos.</td>
      <td>
        - Confirmar intenção antes do cancelamento.<br>
        - Atualizar agenda e notificar as partes envolvidas.
      </td>
    </tr>
  </tbody>
</table>



#### **9.1.2 Objetivo: Automatização e profissionalização dos relatórios da terapeuta**


<strong>Tema 2:</strong>Geração de Relatório

<strong>Épico 2.1:</strong>Geração e Edição de Relatórios Clínicos

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Código</strong></th>
      <th><strong>Prioridade</strong></th>
      <th><strong>User Story</strong></th>
      <th><strong>Critérios de Aceitação</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>US 2.1.1</td>
      <td>MUST</td>
      <td>Como terapeuta, quero gerar um relatório clínico com base no diagnóstico para documentar o atendimento.</td>
      <td>
        - Deve permitir input de diagnóstico.<br>
        - Deve salvar e associar o relatório ao paciente.
      </td>
    </tr>
    <tr>
      <td>US 2.1.2</td>
      <td>MUST</td>
      <td>Como terapeuta, quero editar um relatório clínico para corrigir ou complementar informações.</td>
      <td>
        - Deve permitir alterar campos previamente preenchidos.<br>
        - Deve manter histórico de edições.
      </td>
    </tr>
    <tr>
      <td>US 2.1.3</td>
      <td>MUST</td>
      <td>Como terapeuta, quero visualizar o histórico de relatórios do paciente para acompanhar sua evolução.</td>
      <td>
        - Deve listar relatórios anteriores.<br>
        - Deve permitir visualizar detalhes de cada entrada.
      </td>
    </tr>
    <tr>
      <td>US 2.1.4</td>
      <td>MUST</td>
      <td>Como terapeuta, quero anexar imagens ao relatório clínico para incluir evidências visuais.</td>
      <td>
        - Deve suportar upload de imagens (JPG, PNG).<br>
        - Imagens devem ser exibidas no relatório.
      </td>
    </tr>
  </tbody>
</table>

### **9.2 Priorização do Backlog Geral**

A priorização do backlog foi realizada utilizando o modelo **MoSCoW** (*Must* Have, *Should* Have, *Could* Have e *Won't Have*), que auxilia na identificação das funcionalidades essenciais, desejáveis e opcionais. Esse modelo orienta o desenvolvimento de acordo com os objetivos do projeto, garantindo que as entregas mais importantes sejam priorizadas.

Além disso, utilizamos um **checklist complementar** para reforçar a análise e atribuir uma pontuação a cada funcionalidade, considerando os seguintes critérios:

- (+1) O projeto é concluído sem essa User Story (US)?
- (+1) Não pode ser adiado?
- (+1) Pode não ser entregue?
- (+1) Agrega valor de negócio?

Cada item positivo acrescenta um ponto, permitindo uma avaliação rápida e objetiva sobre a prioridade da funcionalidade. Funcionalidades com maior pontuação tendem a ser classificadas como "Must Have", enquanto aquelas com menor pontuação podem ser categorizadas como "Should Have" ou "Could Have".

Dessa forma, a priorização foi realizada de maneira estruturada e alinhada com os interesses e necessidades do projeto, promovendo uma gestão eficiente do backlog.

### **9.3 MVP**

<strong>Objetivo Específico:</strong> Agendamento completo dos tratamentos capilares

<strong>Tema 1:</strong> Gestão de Pacientes e Atendimento
<strong>Épico 1.1:</strong> Cadastro e Manutenção de Pacientes

<strong>US 1.1.1</strong> (MUST)
Como recepcionista, quero cadastrar um novo paciente para iniciar seu acompanhamento.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Formulário</strong> deve conter nome, contato e data de nascimento.</li> <li><strong>Registro</strong> salvo no banco de dados.</li> </ul>
<strong>US 1.1.2</strong> (MUST)
Como terapeuta ou recepcionista, quero buscar e visualizar informações completas do paciente para preparar a sessão.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Permitir busca</strong> por nome ou identificador.</li> <li><strong>Exibir</strong> todos os dados relevantes do paciente.</li> </ul>
<strong>US 1.1.3</strong> (MUST)
Como recepcionista, quero editar os dados do paciente para manter o cadastro sempre atualizado.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Permitir atualização</strong> de nome, contato, data de nascimento.</li> <li><strong>Salvar alterações</strong> com segurança.</li> </ul>
<strong>US 1.1.4</strong> (MUST)
Como recepcionista, quero deletar um paciente registrado por equívoco ou engano.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Solicitar confirmação</strong> antes da exclusão.</li> <li><strong>Remover registro</strong> e dependências seguras (com aviso, se necessário).</li> </ul>
<strong>Objetivo:</strong> Automatização e profissionalização dos relatórios da terapeuta

<strong>Tema 2:</strong> Geração de Relatório
<strong>Épico 2.1:</strong> Geração e Edição de Relatórios Clínicos

<strong>US 2.1.1</strong> (MUST)
Como terapeuta, quero gerar um relatório clínico com base no diagnóstico para documentar o atendimento.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Deve permitir</strong> input de diagnóstico.</li> <li><strong>Deve salvar</strong> e associar o relatório ao paciente.</li> </ul>
<strong>US 2.1.2</strong> (MUST)
Como terapeuta, quero editar um relatório clínico para corrigir ou complementar informações.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Deve permitir</strong> alterar campos previamente preenchidos.</li> <li><strong>Deve manter</strong> histórico de edições.</li> </ul>
<strong>US 2.1.3</strong> (MUST)
Como terapeuta, quero visualizar o histórico de relatórios do paciente para acompanhar sua evolução.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Deve listar</strong> relatórios anteriores.</li> <li><strong>Deve permitir</strong> visualizar detalhes de cada entrada.</li> </ul>
<strong>US 2.1.4</strong> (MUST)
Como terapeuta, quero anexar imagens ao relatório clínico para incluir evidências visuais.
<strong>Critérios de Aceitação:</strong>

<ul> <li><strong>Deve suportar</strong> upload de imagens (JPG, PNG).</li> <li><strong>Imagens devem</strong> ser exibidas no relatório.</li> </ul>