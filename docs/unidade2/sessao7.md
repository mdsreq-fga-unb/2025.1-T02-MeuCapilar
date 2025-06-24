## **7.Lista de Requisitos**

<p style="text-align: justify;">A seguir, apresenta-se a lista detalhada dos requisitos do projeto, dividida entre requisitos funcionais e não funcionais. Essa lista serve como referência para orientar o desenvolvimento, garantir o atendimento das necessidades dos usuários e assegurar a qualidade do sistema.</p>

## **7.1.Tabela de Requisitos Funcionais**

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Objetivo Específico</strong></th>
      <th><strong>Código</strong></th>
      <th><strong>Requisito</strong></th>
      <th><strong>Descrição</strong></th>
    </tr>
  </thead>
  <tbody>
    <!-- Gestão do Paciente -->
    <tr>
      <td rowspan="7">Gestão do Paciente</td>
      <td>RF1.1</td>
      <td>Cadastrar novo paciente</td>
      <td>Permitir cadastro de novos pacientes no sistema.</td>
    </tr>
    <tr>
      <td>RF1.2</td>
      <td>Editar dados do paciente</td>
      <td>Permitir edição dos dados pessoais do paciente.</td>
    </tr>
    <tr>
      <td>RF1.3</td>
      <td>Visualizar informações do paciente</td>
      <td>Exibir informações completas do paciente cadastrado.</td>
    </tr>
    <tr>
      <td>RF1.4</td>
      <td>Deletar paciente cadastrado</td>
      <td>Permitir exclusão de paciente cadastrado no sistema.</td>
    </tr>
    <tr>
      <td>RF1.5</td>
      <td>Pesquisar paciente por identificador</td>
      <td>Buscar pacientes utilizando identificadores únicos.</td>
    </tr>
    <tr>
      <td>RF1.6</td>
      <td>Validar dados do paciente</td>
      <td>Garantir que os dados inseridos estejam completos e corretos.</td>
    </tr>
    <tr>
      <td>RF1.7</td>
      <td>Exibir lista de pacientes à terapeuta</td>
      <td>Permitir que o perfil de terapeuta visualize uma lista com todos os pacientes cadastrados.</td>
    </tr>
    <!-- Gestão de Atendimentos -->
    <tr>
      <td rowspan="6">Gestão de Atendimentos</td>
      <td>RF2.1</td>
      <td>Cadastrar novos atendimentos</td>
      <td>Registrar atendimentos com serviço, profissional e horário definidos.</td>
    </tr>
    <tr>
      <td>RF2.2</td>
      <td>Editar informações dos atendimentos</td>
      <td>Permitir alteração de data, terapeuta e outros dados do atendimento.</td>
    </tr>
    <tr>
      <td>RF2.3</td>
      <td>Visualizar atendimentos cadastrados</td>
      <td>Exibir lista de atendimentos já registrados no sistema.</td>
    </tr>
    <tr>
      <td>RF2.4</td>
      <td>Deletar atendimentos cadastrados</td>
      <td>Excluir atendimentos do sistema.</td>
    </tr>
    <tr>
      <td>RF2.5</td>
      <td>Filtrar atendimentos</td>
      <td>Permitir filtro por data, profissional ou tipo de atendimento.</td>
    </tr>
    <tr>
      <td>RF2.6</td>
      <td>Exportar histórico de atendimentos</td>
      <td>Gerar arquivo PDF com o histórico de atendimentos de um paciente.</td>
    </tr>
    <!-- Relatório Clínico do Paciente -->
    <tr>
      <td rowspan="5">Registros Clínicos do Paciente</td>
      <td>RF3.1</td>
      <td>Registrar informações clínicas</td>
      <td>Permitir que a terapeuta registre informações clínicas e diagnósticos do paciente.</td>
    </tr>
    <tr>
      <td>RF3.2</td>
      <td>Atualizar registros clínicos</td>
      <td>Permitir a atualização e inclusão de novas informações e evidências visuais nos registros clínicos.</td>
    </tr>
    <tr>
      <td>RF3.3</td>
      <td>Consultar registros clínicos</td>
      <td>Permitir que a terapeuta consulte o histórico de registros clínicos de cada paciente.</td>
    </tr>
    <tr>
      <td>RF3.4</td>
      <td>Compartilhar registros clínicos</td>
      <td>Permitir que a terapeuta libere o acesso aos registros clínicos para o paciente.</td>
    </tr>
    <tr>
      <td>RF3.5</td>
      <td>Gerar documento dos registros</td>
      <td>Permitir a geração de documento em formato PDF com os registros clínicos do paciente.</td>
    </tr>
  </tbody>
  <tbody>
    <!-- Autenticação e Acesso -->
    <tr>
      <!-- A célula abaixo cobre as 5 linhas de requisitos -->
      <td rowspan="5">Autenticação e Acesso</td>
      <td>RF4.1</td>
      <td>Escolher perfil</td>
      <td>Permitir que o visitante selecione se é Terapeuta ou Paciente antes de informar as credenciais.</td>
    </tr>
    <tr>
      <td>RF4.2</td>
      <td>Autenticar usuário</td>
      <td>Autenticar o usuário pelo e-mail e senha.</td>
    </tr>
    <tr>
      <td>RF4.3</td>
      <td>Acesso diferenciado</td>
      <td>Direcionar cada tipo de usuário ao painel apropriado após o login (terapeuta ⇢ dashboard de terapeuta; paciente ⇢ dashboard de paciente).</td>
    </tr>
    <tr>
      <td>RF4.4</td>
      <td>Trocar senha</td>
      <td>Permitir que qualquer usuário possa mudar a senha.</td>
    </tr>
    <tr>
      <td>RF4.5</td>
      <td>Logout</td>
      <td>Permitir que qualquer usuário possa encerrar a sessão.</td>
    </tr>
    <tr>
      <!-- A célula abaixo agrupa os dois requisitos -->
      <td rowspan="2">Autoatendimento do Paciente</td>
      <td>RF5.1</td>
      <td>Verificar agendamentos</td>
      <td>O sistema deve exibir ao paciente a lista de seus próximos atendimentos, ordenada da data mais próxima à mais distante.</td>
    </tr>
    <tr>
      <td>RF5.2</td>
      <td>Visualizar relatório da consulta</td>
      <td>O sistema deve disponibilizar ao paciente o relatório completo de cada atendimento concluído, incluindo diagnóstico e observações.</td>
    </tr>
  </tbody>
</table>

## **7.2 Tabela de Requisitos Não Funcionais**

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Código</strong></th>
      <th><strong>Requisito Não Funcional</strong></th>
      <th><strong>Descrição</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>RNF01</td>
      <td>Usabilidade</td>
      <td>
        A interface deve permitir que o usuário acesse as funcionalidades principais (cadastrar paciente, cadastrar consulta, criar o relatório clínico…) em no mínimo três cliques, desde a tela inicial. Mensagens de erro devem ser exibidas com instruções claras de correção, visíveis em até 2 segundos após a falha.
      </td>
    </tr>
    <tr>
      <td>RNF02</td>
      <td>Confiabilidade</td>
      <td>
        Em caso de falhas críticas que causem indisponibilidade do sistema web, o ambiente de produção deve ser reiniciado automaticamente e restaurado com base nos dados persistidos no banco, sem perda de registros confirmados. O processo de reinicialização deve ser concluído em até 5 minutos.
      </td>
    </tr>
    <tr>
      <td>RNF03</td>
      <td>Desempenho</td>
      <td>
        O tempo de resposta para qualquer funcionalidade não deve exceder 2 segundos em cenários de carga normal (a situação em que ele atende as demandas usuais do negócio, sem picos sazonais nem testes de estresse). O sistema deve suportar no mínimo 20 acessos simultâneos sem interrupções ou travamentos. A execução de consultas ao banco de dados deve ocorrer em no máximo 1 segundo para conjuntos de até 200 registros.
      </td>
    </tr>
    <tr>
      <td>RNF04</td>
      <td>Suportabilidade</td>
      <td>
        O site deve funcionar nos navegadores Google Chrome (versão 137 ou mais), Mozilla Firefox (versão 139 ou mais), Safari (versão 18 ou mais) e Microsoft Edge (versão 137 ou mais), mantendo layout e funcionalidades. A interface do site deve ajustar-se a tamanhos de tela de smartphones, tablets, desktops modernos, sem perda de conteúdo ou funcionalidade.
      </td>
    </tr>
  </tbody>
</table>
