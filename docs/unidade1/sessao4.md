## **4 Cronograma e Entregas**

<p style="text-align: justify;">A partir da estratégia de desenvolvimento de software estabelecida, tem-se a seguinte proposta de cronograma,  suas fases e resultados esperados:</p>

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Sprint</strong></th>
      <th><strong>Início</strong></th>
      <th><strong>Fim</strong></th>
      <th><strong>Objetivo Principal</strong></th>
      <th><strong>Entregas Esperadas</strong></th>
      <th><strong>Validação do Cliente</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Sprint 1</strong></td>
      <td>15/04/2025</td>
      <td>12/05/2025</td>
      <td>Construção do Backlog e configuração dos ambientes</td>
        <td>- Definição do backlog  inicial.  
            - Configuração da  
            arquitetura (Rails,PostgreSQL).  
            - Ambiente de desenvolvimento configurado para todo os membros.
            - Documento de Visão do Produto e Projeto
        </td>
      <td>Revisão do backlog e confirmação de prioridades.</td>
</td>
    </tr>
    <tr>
      <td><strong>Sprint 2</strong></td>
      <td>13/05/2025</td>
      <td>26/05/2025</td>
      <td>Cadastro de Agendamentos clientes</td>
        <td>
            - Funcionalidade de cadastro de cliente.
            - Tela e lógica de agendamento.
            - Validação de campos e integração inicial com o banco de dados.
        </td>
      <td>Cliente testa o cadastro e simula agendamentos</td>
    </tr>
    <tr>
      <td><strong>Sprint 3</strong></td>
      <td>27/05/2025</td>
      <td>09/06/2025</td>
      <td><strong>Entrega Parcial 1(Release): </strong>Geração de Relatórios</td>
        <td>
            - Geração automática de relatórios com campos editáveis.
            - Upload de imagens organizadas por cliente.
            - Armazenamento seguro.
        </td>
      <td>O cliente valida a praticidade e organização dos relatórios. Subimos para produção</td>
    </tr>
    <tr>
      <td><strong>Sprint 4</strong></td>
      <td>10/06/2025</td>
      <td>23/06/2025</td>
      <td><strong>Entrega Parcial 2(Release): </strong> - Histórico e consulta dos atendimentos</td>
        <td>
            - Visualização do histórico de sessões por cliente.
            - Edição e reenvio de relatórios anteriores.
            - Integração com armazenamento externo (AWS/Firebase).
        </td>
      <td>Avaliação da navegação e funcionalidade do histórico. Avaliação do checkout.</td>
    </tr>
    <tr>
      <td><strong>Sprint 5</strong></td>
      <td>24/06/2025</td>
      <td>07/07/2025</td>
      <td><strong>Entrega Parcial 3(Release): </strong>Módulo Financeiro e Relatórios Gerenciais</td>
        <td>
            - Registro de pacotes e sessões.
            - Lançamentos financeiros separados da terapia capilar.
            - Relatórios de faturamento por cliente e período.
        </td>
      <td>O cliente valida os lançamentos e usabilidade dos relatórios financeiros. Avaliação do Checkout</td>
    </tr>
    <tr>
      <td><strong>Sprint 6</strong></td>
      <td>08/07/2025</td>
      <td>14/07/2025</td>
      <td>Ajustes Finais e Preparação para Homologação</td>
        <td>- Correções gerais com base nos feedbacks.
            - Testes de requisitos não funcionais.
            - Refatoração.
      
        </td>
      <td>Validação das recomendações, ajustes baseados em feedbacks.</td>
    </tr>
  </tbody>
</table>

## **4.1 Atividades e Técnicas de ER**
## Elicitação e Descoberta

- **Entrevistas semi-estruturadas**: Utilizada nas conversas com a cliente para entender suas dores e necessidades, coletando insumos para escrever temas, épicos e histórias de usuário.

- **Brainstorm**: Realizada em sessões com a equipe para levantar perspectivas sobre o problema, explorar abordagens e redigir histórias que atendam aos objetivos do projeto.

- **Análise Comparativa**: Aplicada na análise de concorrência, visando compreender soluções existentes e identificar oportunidades de inovação para o projeto.

---

## Análise e Consenso

- **Walkthrough**: Utilizado na revisão dos requisitos, apresentando temas, épicos e histórias à equipe para validação e consenso, assegurando o alinhamento de todos com os objetivos definidos.

- **MoSCoW**: Técnica aplicada na priorização do backlog, garantindo que os itens mais importantes sejam tratados primeiro, conforme o valor e a urgência para o cliente.

---

## Declaração de Requisitos

- **Temas, Épicos e Histórias de Usuário**: Estruturação dos requisitos de forma hierárquica e compreensível, organizando-os para facilitar o planejamento e o desenvolvimento.

- **Brainstorm**: Utilizado no detalhamento dos requisitos, promovendo a colaboração da equipe para refinar e ajustar temas, épicos e histórias conforme evolui a compreensão do problema.

---

## Representação de Requisitos

- **Wireframes**: Produção de esboços para apresentar à cliente uma visão antecipada das funcionalidades planejadas para as próximas sprints, facilitando alinhamento e validação prévia.

- **Sketches**: Criação de representações visuais rápidas e simples que ilustram as soluções propostas, promovendo o entendimento compartilhado entre a equipe e a cliente.

---

## Verificação e Validação de Requisitos

- **Definition of Ready (DoR)**: Aplicada para confirmar que os itens do backlog estão bem definidos e prontos para serem desenvolvidos durante o Sprint Planning.

- **INVEST**: Utilizado como critério dentro do DoR, validando se cada história de usuário está escrita de forma que permita seu desenvolvimento de maneira independente, negociável, valiosa, estimável, pequena e testável.

- **DEEP**: Técnica aplicada na organização do backlog para manter os itens prioritários bem estruturados e prontos para o desenvolvimento contínuo.

- **Definition of Done (DoD)**: Utilizada para verificar se a entrega realizada pode ser apresentada ao cliente, avaliando se cada história de usuário atende aos critérios estabelecidos de conclusão.

- **Feedback do Cliente**: Técnica central na Sprint Review, onde as funcionalidades desenvolvidas são apresentadas ao cliente para validação e ajuste, garantindo que o produto atenda às expectativas.

- **Walkthrough**: Realizado ao final da sprint, com a equipe, para rever como foi conduzida e identificar pontos de melhoria para as próximas iterações.

---

## Organização e Atualização de Requisitos

- **Reuniões de Revisão**: Aplicadas para coletar feedback da equipe sobre os requisitos, ajustando e melhorando o backlog conforme necessário ao longo do desenvolvimento.

- **Organização do Backlog**: Mantida através de técnicas como DEEP e MoSCoW, assegurando que os requisitos estejam atualizados, bem estruturados e priorizados de acordo com o valor de negócio e viabilidade técnica.


## **4.2 Engenharia de Requisitos e o SCRUM/XP**

<table border="1">
  <thead style="background-color: #F02464;">
    <tr>
      <th><strong>Fase do Processo</strong></th>
      <th><strong>Atividade de ER</strong></th>
      <th><strong>Prática</strong></th>
      <th><strong>Técnica</strong></th>
      <th><strong>Resultado Esperado</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Captura e Representação</td>
      <td>Elicitação e Descoberta</td>
      <td>Conversa com a cliente</td>
      <td>Entrevistas semi-estruturadas</td>
      <td>Entender a dor da cliente e capturar necessidades direto da fonte</td>
    </tr>
    <tr>
      <td></td>
      <td>Elicitação e Descoberta</td>
      <td>Sessão de brainstorm</td>
      <td>Brainstorm</td>
      <td>Levantar perspectivas da equipe sobre o problema e explorar abordagens</td>
    </tr>
    <tr>
      <td></td>
      <td>Elicitação e Descoberta</td>
      <td>Análise de concorrência</td>
      <td>Análise Comparativa</td>
      <td>Compreender soluções existentes e identificar oportunidades de inovação</td>
    </tr>
    <tr>
      <td></td>
      <td>Declaração de Requisitos</td>
      <td>Organização dos requisitos</td>
      <td>Temas, Épicos e Histórias de Usuário</td>
      <td>Estruturar os requisitos de forma hierárquica e compreensível</td>
    </tr>
    <tr>
      <td></td>
      <td>Elicitação e Descoberta</td>
      <td>Conversa com a cliente</td>
      <td>Entrevistas semi-estruturadas</td>
      <td>Coletar insumos para escrever temas, épicos e histórias de usuário</td>
    </tr>
    <tr>
      <td></td>
      <td>Elicitação e Descoberta</td>
      <td>Sessão de brainstorm</td>
      <td>Brainstorm</td>
      <td>Explorar, com a equipe, formas de abordar o problema e redigir histórias</td>
    </tr>
    <tr>
      <td>Priorização e Refinamento</td>
      <td>Análise e Consenso</td>
      <td>Revisão do Requisito</td>
      <td>Walkthrough</td>
      <td>Apresentar temas, épicos e histórias à equipe para validação e consenso</td>
    </tr>
    <tr>
      <td></td>
      <td>Verificação e Validação</td>
      <td>Feedback da equipe</td>
      <td>Reuniões de revisão</td>
      <td>Melhorar e ajustar o backlog com base no feedback</td>
    </tr>
    <tr>
      <td></td>
      <td>Declaração</td>
      <td>Detalhamento</td>
      <td>Brainstorm</td>
      <td>Refinar e ajustar temas, épicos e histórias, conforme a evolução da compreensão</td>
    </tr>
    <tr>
      <td></td>
      <td>Análise e Consenso</td>
      <td>Priorização do backlog</td>
      <td>MoSCoW</td>
      <td>Garantir que os itens mais importantes sejam tratados primeiro</td>
    </tr>
    <tr>
      <td>Compromisso e Planejamento (Sprint Planning)</td>
      <td>Verificação e Validação</td>
      <td>Validação de Requisitos</td>
      <td>Definition of Ready (DoR)</td>
      <td>Confirmar que os itens do backlog estão bem definidos e prontos para serem desenvolvidos</td>
    </tr>
    <tr>
      <td></td>
      <td>Verificação e Validação</td>
      <td>Validação de Requisitos</td>
      <td>INVEST</td>
      <td>INVEST será um dos itens do DoR, validar se a US está escrita de uma forma que permita o desenvolvimento</td>
    </tr>
    <tr>
      <td></td>
      <td>Verificação e Validação</td>
      <td>Organização do Backlog</td>
      <td>DEEP</td>
      <td>Manter os itens prioritários do backlog em um formato que permite desenvolvimento</td>
    </tr>
    <tr>
      <td>Validação e Feedback (Sprint Review)</td>
      <td>Verificação e Validação</td>
      <td>Verificação se a entrega pode ser apresentada ao cliente</td>
      <td>Definition of Done (DoD)</td>
      <td>Avalia se aquela US que foi desenvolvida pode ser apresentada para o cliente</td>
    </tr>
    <tr>
      <td></td>
      <td>Verificação e Validação</td>
      <td>Apresentação das funcionalidades para o cliente</td>
      <td>Feedback do Cliente</td>
      <td>Apresentar o que foi desenvolvido na sprint para validação do cliente</td>
    </tr>
    <tr>
      <td></td>
      <td>Representação</td>
      <td>Sketches</td>
      <td>Wireframes</td>
      <td>Apresentar para a cliente um esboço da próxima sprint sempre que possível</td>
    </tr>
    <tr>
      <td>Adaptação (Retrospectiva)</td>
      <td>Verificação e Validação</td>
      <td>Feedback da Equipe</td>
      <td>Walkthrough</td>
      <td>Rever como lidamos com a sprint para identificar pontos de melhoria</td>
    </tr>
  </tbody>
</table>


