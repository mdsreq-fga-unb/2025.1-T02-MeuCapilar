## **9. Product Backlog – User Stories**

---

### **9.1 Backlog Geral**

Nosso backlog é mantido no <em>Github Projects</em>, onde especificamos <strong>critérios de aceitação</strong> e <strong>regras de negócio</strong> em cada US, além de utilizarmos tags para:
<ul>
  <li>Priorizar as User Stories (US).</li>
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
      <td>MUST</td>
      <td>Como terapeuta, quero visualizar e filtrar o histórico de atendimentos por paciente, data ou tipo para acompanhar a evolução do tratamento.</td>
      <td>- Exibir lista cronológica de atendimentos.<br>- Permitir filtros múltiplos.<br>- Visualizar detalhes de cada atendimento.</td>
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

<strong>Tema 2:</strong> Relatórios e Documentação Clínica

<strong>Épico 2.1:</strong> Geração e Consulta de Relatórios Clínicos

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
      <td>Como terapeuta, quero visualizar o histórico de relatórios clínicos do paciente para acompanhar sua evolução.</td>
      <td>- Listar relatórios anteriores.<br>- Permitir visualizar detalhes de cada entrada.</td>
    </tr>
  </tbody>
</table>
<br>
<strong>Épico 2.2:</strong> Compartilhamento e Exportação de Relatórios

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
      <td>MUST</td>
      <td>Como terapeuta, quero exportar relatórios clínicos em PDF para arquivamento ou envio ao paciente.</td>
      <td>- Gerar PDF com relatórios filtrados ou completos.<br>- Opção de download <br> - Disponibilizado no perfil do paciente.</td>
    </tr>
    <tr>
      <td>US 2.2.2</td>
      <td>COULD</td>
      <td>Como terapeuta, quero compartilhar relatórios clínicos de forma segura com outros profissionais, quando autorizado pelo paciente.</td>
      <td>- Compartilhamento controlado.<br>- Registro de acessos.</td>
    </tr>
  </tbody>
</table>

---

### **9.2 Priorização do Backlog Geral**

A priorização do backlog foi realizada utilizando o modelo <strong>MoSCoW</strong> (<em>Must Have</em>, <em>Should Have</em>, <em>Could Have</em> e <em>Won't Have</em>), que auxilia na identificação das funcionalidades essenciais, desejáveis e opcionais. Esse modelo orienta o desenvolvimento de acordo com os objetivos do projeto, garantindo que as entregas mais importantes sejam priorizadas.

#### <strong>9.2.1 Critérios de Priorização</strong>

A pontuação de cada User Story (US) foi definida a partir de um checklist de critérios de negócio e critérios técnicos:

<strong>Critérios de Negócio:</strong>
<ul>
  <li>(+1) O projeto não é concluído sem essa US? - Se não, +1 ponto.</li>
  <li>(+1) Não pode ser adiado? - Se não, +1 ponto </li>
  <li>(+1) Pode não ser entregue? - Se não, +1 ponto</li>
  <li>(+1) Agrega valor de negócio? - Se sim, +1 ponto</li>
</ul>
<strong>Critérios Técnicos:</strong>
<ul>
  <li>(+1) Complexidade técnica baixa? (implementação rápida e segura) - Se sim, +1 ponto</li>
  <li>(+1) Reduz riscos técnicos ou de integração? - Se sim, +1 ponto</li>
  <li>(+1) Facilita manutenção futura? - Se sim, +1 ponto</li>
  <li>(+1) Alinha-se com padrões técnicos do projeto? - Se sim, +1 ponto</li>
</ul>
Quanto maior a pontuação, maior a prioridade da US.

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
    <tr><td>US 1.1.1</td><td>MUST</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 1.1.2</td><td>MUST</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 1.1.3</td><td>MUST</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 1.1.4</td><td>MUST</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 1.2.1</td><td>MUST</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 1.2.2</td><td>MUST</td><td>6</td><td>3/4</td></tr>
    <tr><td>US 1.2.3</td><td>MUST</td><td>6</td><td>3/4</td></tr>
    <tr><td>US 1.2.4</td><td>SHOULD</td><td>5</td><td>3/4</td></tr>
    <tr><td>US 2.1.1</td><td>MUST</td><td>7</td><td>3/4</td></tr>
    <tr><td>US 2.1.2</td><td>MUST</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 2.2.1</td><td>MUST</td><td>8</td><td>4/4</td></tr>
    <tr><td>US 2.2.2</td><td>COULD</td><td>4</td><td>1/4</td></tr>
  </tbody>
</table>
<p><em>Legenda: O primeiro número em "Critérios Atendidos" refere-se aos critérios de negócio, o segundo aos critérios técnicos.</em></p>

A priorização foi feita somando os pontos de cada US. As US com maior pontuação foram classificadas como "Must Have" (MUST), seguidas por "Should Have" (SHOULD) e "Could Have" (COULD). Critérios técnicos foram considerados para garantir que funcionalidades essenciais também sejam viáveis e sustentáveis do ponto de vista de desenvolvimento.

Dessa forma, a priorização foi realizada de maneira estruturada, transparente e alinhada tanto com os interesses de negócio quanto com a viabilidade técnica do projeto, promovendo uma gestão eficiente do backlog.

---

### **9.3 MVP**

<strong>Objetivo Específico:</strong> Agendamento completo dos tratamentos capilares e documentação clínica eficiente.<br>
<strong>Tema 1:</strong> Gestão de Pacientes e Atendimento<br>
<strong>Épico 1.1:</strong> Cadastro e Gerenciamento de Pacientes<br>
US 1.1.1 (MUST)<br>
US 1.1.2 (MUST)<br>
US 1.1.3 (MUST)<br>
US 1.1.4 (MUST)<br>
<strong>Épico 1.2:</strong> Agendamento e Gerenciamento de Atendimentos<br>
US 1.2.1 (MUST)<br>
US 1.2.2 (MUST)<br>
US 1.2.3 (MUST)<br>
<br>
<strong>Objetivo Específico:</strong> Automatização e profissionalização dos relatórios da terapeuta<br>
<strong>Tema 2:</strong> Relatórios e Documentação Clínica<br>
<strong>Épico 2.1:</strong> Geração e Consulta de Relatórios Clínicos<br>
US 2.1.1 (MUST)<br>
US 2.1.2 (MUST)<br>