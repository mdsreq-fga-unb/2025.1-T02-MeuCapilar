## **9. Product Backlog – User Stories**

---

### **9.1 Backlog Geral**

Nosso backlog é mantido no <em>Github Projects</em>, onde especificamos <strong>critérios de aceitação</strong> e <strong>regras de negócio</strong> em cada US, além de utilizarmos tags para:
<ul>
  <li>Identificar a priorização das User Stories (US).</li>
  <li>Identificar a qual funcionalidade ou agrupamento cada US pertence.</li>
  <li>Classificar o nível de granularidade: Tema, Épico ou User Story.</li>
</ul>
Essa estrutura organiza e facilita a gestão do backlog, garantindo clareza no desenvolvimento e alinhamento com os objetivos do projeto.

#### <strong>9.1.1 Objetivo Específico: Agendamento completo dos tratamentos capilares</strong>

<strong>Tema 1:</strong> Gestão de Pacientes e Atendimento

<strong>Épico 1.1:</strong> Cadastro e Gerenciamento de Pacientes

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
      <td>Como terapeuta, quero cadastrar um novo paciente para iniciar o acompanhamento.</td>
      <td>- Formulário deve conter nome, contato e data de nascimento.<br>- Registro salvo no banco de dados.</td>
    </tr>
    <tr>
      <td>US 1.1.2</td>
      <td>MUST</td>
      <td>Como terapeuta, quero buscar e visualizar informações completas do paciente para preparar a sessão.</td>
      <td>- Permitir busca por nome ou identificador.<br>- Exibir todos os dados relevantes do paciente.</td>
    </tr>
    <tr>
      <td>US 1.1.3</td>
      <td>MUST</td>
      <td>Como terapeuta, quero editar os dados do paciente para manter o cadastro sempre atualizado.</td>
      <td>- Permitir atualização de nome, contato, data de nascimento.<br>- Salvar alterações com segurança.</td>
    </tr>
    <tr>
      <td>US 1.1.4</td>
      <td>MUST</td>
      <td>Como terapeuta, quero deletar um paciente registrado por engano.</td>
      <td>- Solicitar confirmação antes da exclusão.<br>- Remover registro e dependências seguras.</td>
    </tr>
  </tbody>
</table>
<br>
<strong>Épico 1.2:</strong> Agendamento e Gerenciamento de Atendimentos

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
      <td>MUST</td>
      <td>Como terapeuta, quero cadastrar um novo atendimento informando serviço, data e horário para organizar minha agenda.</td>
      <td>- Formulário deve conter serviço, data e horário.<br>- Registro salvo no banco de dados.</td>
    </tr>
    <tr>
      <td>US 1.2.2</td>
      <td>MUST</td>
      <td>Como terapeuta, quero editar um atendimento registrado para corrigir ou atualizar informações, incluindo anexar imagens.</td>
      <td>- Permitir alteração de serviço, data, horário e anexar imagens (JPG, PNG).<br>- Garantir persistência das alterações.</td>
    </tr>
    <tr>
      <td>US 1.2.3</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero visualizar o histórico de atendimentos por paciente, data ou tipo para acompanhar a evolução do tratamento.</td>
      <td>- Exibir lista cronológica de atendimentos.<br>- Permitir filtros poe paciente e data .<br>- Visualizar detalhes de cada atendimento.</td>
    </tr>
    <tr>
      <td>US 1.2.4</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero reagendar ou cancelar atendimentos para atender solicitações de mudança ou imprevistos.</td>
      <td>- Permitir alteração de data/horário.<br>- Notificar paciente.<br>- Confirmar intenção antes do cancelamento.</td>
    </tr>
  </tbody>
</table>

<br>

#### <strong>9.1.2 Objetivo Específico: Automatização e profissionalização dos relatórios da terapeuta</strong>

<strong>Tema 2:</strong> Registro e Documentação Clínica

<strong>Épico 2.1:</strong> Geração e Consulta de Registro Clínicos

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
      <td>Como terapeuta, quero gerar um relatório clínico baseado no registro do atendimento para documentar o caso do paciente.</td>
      <td>- Permitir input de diagnóstico.<br>- Salvar e associar relatório ao paciente.</td>
    </tr>
    <tr>
      <td>US 2.1.2</td>
      <td>MUST</td>
      <td>Como terapeuta, quero visualizar o histórico de registros clínicos do paciente para acompanhar sua evolução.</td>
      <td>- Listar relatórios anteriores.<br>- Permitir visualizar detalhes de cada entrada.</td>
    </tr>
    <tr>
      <td>US 2.1.3</td>
      <td>MUST</td>
      <td>Como terapeuta, quero editar um registro clínico para corrigir ou complementar informações..</td>
      <td>- Permitir edição do conteúdo do relatório.</td>
    </tr>
  </tbody>
</table>
<br>
<strong>Épico 2.2:</strong> Compartilhamento e Exportação de Registros

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
      <td>US 2.2.1</td>
      <td>SHOULD</td>
      <td>Como terapeuta, quero exportar registro clínicos em formato de um relatório PDF para arquivamento ou envio ao paciente.</td>
      <td>- Gerar PDF com relatórios filtrados ou completos.<br>- Opção de download <br> - Disponibilizar download para o paciente.</td>
    </tr>
    <tr>
      <td>US 2.2.2</td>
      <td>MUST</td>
      <td>Como terapeuta, quero entregar o relatório clínico digitalmente ao cliente pela plataforma para maior comodidade..</td>
      <td>- Visualizar relatório pela plataforma.</td>
    </tr>
  </tbody>
</table>

---

### **9.2 Priorização do Backlog Geral**

A priorização do backlog foi realizada com base no modelo **MoSCoW** (*Must Have*, *Should Have*, *Could Have* e *Won't Have*), que auxilia na identificação e categorização das funcionalidades como essenciais, desejáveis ou opcionais. Esse modelo orienta o desenvolvimento conforme os objetivos do projeto, garantindo que as entregas mais importantes sejam priorizadas.

Cada User Story (US) foi avaliada segundo dois grupos de critérios: **Negócio** e **Esforço**.

### 9.2.1 Critérios de Priorização

**Critérios de Negócio:**  
O checklist abaixo foi utilizado para determinar a importância da US para o negócio:

- (+1) O projeto não é concluído sem essa US? → Se sim, +1 ponto.  
- (+1) Não pode ser adiada? → Se sim, +1 ponto.  
- (+1) Agrega valor de negócio? → Se sim, +1 ponto.  

Com base na quantidade de pontos obtidos nesse checklist, a US é classificada conforme o modelo MoSCoW:

- Se atender a **3 critérios** → **MUST**  
- Se atender a **2 critérios** → **SHOULD**  
- Se atender a **1 critério** → **COULD**  
- Se atender a **0 critérios** → **WON'T HAVE**

Após essa classificação, é atribuído um peso específico para a pontuação de negócio:

- **MUST** → peso **9**  
- **SHOULD** → peso **4**  
- **COULD** → peso **2**

---

**Critérios de Esforço:**  
Adicionalmente, a US foi avaliada sob o aspecto técnico, com os seguintes pontos:

- (+1) Habilidade Técnica: a equipe já realizou algo semelhante? → Se sim, +1 ponto.  
- (+1) Volume de Trabalho: demanda menos de quatro horas? → Se sim, +1 ponto.  
- (+1) Complexidade Técnica: é uma solução simples, sem necessidade de pesquisa ou novas tecnologias? → Se sim, +1 ponto.  
- (+1) A tarefa está alinhada aos padrões técnicos e arquiteturais do projeto? → Se sim, +1 ponto.

---

Por fim, a pontuação total obtida — combinando critérios de negócio e esforço — determina a prioridade de desenvolvimento da User Story: **quanto maior a pontuação, maior a prioridade**.

#### <strong>9.2.2 Tabela de Priorização e Pontuação</strong>

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Código</strong></th>
      <th><strong>Prioridade</strong></th>
      <th><strong>Pontuação</strong></th>
      <th><strong>Critérios Atendidos de Negócio</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr><td>US 1.1.1</td><td>MUST</td><td>13</td><td>9/4</td></tr>
    <tr><td>US 1.1.2</td><td>MUST</td><td>13</td><td>9/4</td></tr>
    <tr><td>US 1.1.3</td><td>MUST</td><td>13</td><td>9/4</td></tr>
    <tr><td>US 1.1.4</td><td>MUST</td><td>13</td><td>9/4</td></tr>
    <tr><td>US 1.2.1</td><td>MUST</td><td>13</td><td>9/4</td></tr>
    <tr><td>US 1.2.2</td><td>MUST</td><td>13</td><td>9/4</td></tr>
    <tr><td>US 1.2.3</td><td>SHOULD</td><td>7</td><td>4/3</td></tr>
    <tr><td>US 1.2.4</td><td>SHOULD</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 2.1.1</td><td>MUST</td><td>9</td><td>9/0</td></tr>
    <tr><td>US 2.1.2</td><td>MUST</td><td>12</td><td>9/3</td></tr>
    <tr><td>US 2.1.3</td><td>MUST</td><td>9</td><td>9/0</td></tr>>
    <tr><td>US 2.2.1</td><td>SHOULD</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 2.2.2</td><td>MUST</td><td>12</td><td>9/3</td></tr>
  </tbody>
</table>
<p><em>Legenda: O primeiro número em "Critérios Atendidos" refere-se aos critérios de negócio, o segundo aos critérios de esforço.</em></p>



Dessa forma, a priorização foi realizada de maneira estruturada, transparente e alinhada tanto com os interesses de negócio quanto com a viabilidade técnica do projeto, promovendo uma gestão eficiente do backlog.



---


### **9.3 MVP**

<h3>Objetivo Específico:</h3>
<p>Agendamento completo dos tratamentos capilares e documentação clínica eficiente.</p>

<strong>Tema 1:</strong> Gestão de Pacientes e Atendimento<br>

<strong>Épico 1.1:</strong> Cadastro e Gerenciamento de Pacientes<br>
<ul>
  <li>US 1.1.1 (MUST)</li>
  <li>US 1.1.2 (MUST)</li>
  <li>US 1.1.3 (MUST)</li>
  <li>US 1.1.4 (MUST)</li>
</ul>

<strong>Épico 1.2:</strong> Agendamento e Gerenciamento de Atendimentos<br>
<ul>
  <li>US 1.2.1 (MUST)</li>
  <li>US 1.2.2 (MUST)</li>
</ul>

<h3>Objetivo Específico:</h3>
<p>Automatização e profissionalização dos relatórios da terapeuta.</p>

<strong>Tema 2:</strong> Registro e Documentação Clínica<br>

<strong>Épico 2.2:</strong> Compartilhamento e Exportação de Registros<br>
<ul>
  <li>US 2.2.2 (MUST)</li>
</ul>
