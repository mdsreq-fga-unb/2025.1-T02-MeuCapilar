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
      <td rowspan="7">Gestão de Atendimentos</td>
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
      <td>Exibir horários vagos para atendimento</td>
      <td>Mostrar os horários disponíveis para agendamento de atendimentos.</td>
    </tr>
    <tr>
      <td>RF2.7</td>
      <td>Exportar histórico de atendimentos</td>
      <td>Gerar arquivo PDF com o histórico de atendimentos de um paciente.</td>
    </tr>
    <!-- Relatório Clínico do Paciente -->
    <tr>
      <td rowspan="6">Gerar Relatório Clínico do Paciente</td>
      <td>RF3.1</td>
      <td>Criar relatório clínico</td>
      <td>Permitir a terapeuta gerar um relatório clínico com base nas informações do diagnóstico do paciente.</td>
    </tr>
    <tr>
      <td>RF3.2</td>
      <td>Editar relatório clínico</td>
      <td>Permitir a correção, complementação e inclusão de evidências visuais (como imagens) nos relatórios clínicos.</td>
    </tr>
    <tr>
      <td>RF3.3</td>
      <td>Visualizar relatórios clínicos</td>
      <td>Permitir que a terapeuta visualize todos os relatórios clínicos gerados para cada paciente.</td>
    </tr>
    <tr>
      <td>RF3.4</td>
      <td>Disponibilizar relatório ao paciente</td>
      <td>Permitir que o paciente acesse o histórico de relatório clínico via plataforma, após liberação pela terapeuta.</td>
    </tr>
    <tr>
      <td>RF3.5</td>
      <td>Exportar relatório clínico em PDF</td>
      <td>Permitir a exportação do relatório clínico em formato PDF para impressão ou envio.</td>
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
        A interface deve permitir que o usuário acesse as funcionalidades principais em no máximo três cliques a partir da tela inicial. Mensagens de erro devem ser exibidas com instruções claras de correção, visíveis em até 2 segundos após a ocorrência da falha.
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
        O tempo de resposta para qualquer funcionalidade não deve exceder 2 segundos em cenários de carga normal. O sistema deve suportar no mínimo 20 acessos simultâneos sem interrupções ou travamentos. A execução de consultas ao banco de dados deve ocorrer em no máximo 1 segundo para conjuntos de até 200 registros.
      </td>
    </tr>
    <tr>
      <td>RNF04</td>
      <td>Suportabilidade</td>
      <td>
        O site deve funcionar corretamente nos navegadores Google Chrome (versão 90 ou superior), Mozilla Firefox (versão 88 ou superior), Safari (versão 14 ou superior) e Microsoft Edge (versão 90 ou superior), mantendo o layout e as funcionalidades consistentes. A interface do site deve se ajustar automaticamente a diferentes tamanhos de tela, incluindo smartphones, tablets e desktops, sem perda de conteúdo ou funcionalidade, garantindo navegação fluida em todos os dispositivos.
      </td>
    </tr>
  </tbody>
</table>
