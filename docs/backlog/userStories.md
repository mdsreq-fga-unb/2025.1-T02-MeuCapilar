## Product Backlog – User Stories

---

### 🎯 Objetivo: Gerir Paciente

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


### 🎯 Objetivo: Gerar Relatório Clínico do Paciente

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
