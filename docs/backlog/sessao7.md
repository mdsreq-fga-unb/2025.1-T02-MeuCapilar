## Lista de Requisitos

<p style="text-align: justify;">A seguir, apresenta-se a lista detalhada dos requisitos do projeto, dividida entre requisitos funcionais e não funcionais. Essa lista serve como referência para orientar o desenvolvimento, garantir o atendimento das necessidades dos usuários e assegurar a qualidade do sistema.</p>

## 📋 Tabela de Requisitos Funcionais

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
      <td rowspan="6">Gestão do Paciente</td>
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
      <td>Exibir disponibilidade em tempo real</td>
      <td>Mostrar em tempo real as vagas disponíveis para agendamento.</td>
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
      <td>Gerar relatório clínico</td>
      <td>Produzir relatório clínico com base nas informações do diagnóstico.</td>
    </tr>
    <tr>
      <td>RF3.2</td>
      <td>Editar relatório clínico</td>
      <td>Permitir correção e complementação dos relatórios clínicos.</td>
    </tr>
    <tr>
      <td>RF3.3</td>
      <td>Anexar imagens ao relatório clínico</td>
      <td>Incluir evidências visuais nos relatórios.</td>
    </tr>
    <tr>
      <td>RF3.4</td>
      <td>Visualizar histórico de relatórios clínicos</td>
      <td>Exibir lista completa dos relatórios já gerados para o paciente.</td>
    </tr>
    <tr>
      <td>RF3.5</td>
      <td>Disponibilizar relatório ao cliente</td>
      <td>Oferecer acesso digital ao relatório para o paciente via plataforma.</td>
    </tr>
    <tr>
      <td>RF3.6</td>
      <td>Exportar relatório clínico em PDF</td>
      <td>Gerar arquivo PDF do relatório clínico para impressão ou envio.</td>
    </tr>
  </tbody>
</table>

### 📋 Tabela de Requisitos Não Funcionais

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
      <td>Facilidade e prazer para aprender e usar o sistema, incluindo ergonomia, estética, consistência visual, mensagens de ajuda e materiais de treinamento.</td>
    </tr>
    <tr>
      <td>RNF02</td>
      <td>Confiabilidade</td>
      <td>Capacidade do sistema de funcionar sem falhas e se recuperar quando ocorrerem problemas, considerando frequência, gravidade e tempo médio entre falhas.</td>
    </tr>
    <tr>
      <td>RNF03</td>
      <td>Desempenho</td>
      <td>Rapidez e eficiência da resposta e uso de recursos, abrangendo tempo de resposta, throughput, disponibilidade e uso de CPU/memória.</td>
    </tr>
    <tr>
      <td>RNF04</td>
      <td>Suportabilidade</td>
      <td>Facilidade para testar, manter, estender, configurar ou instalar o software, incluindo extensibilidade, compatibilidade e capacidade de localização.</td>
    </tr>
  </tbody>
</table>
