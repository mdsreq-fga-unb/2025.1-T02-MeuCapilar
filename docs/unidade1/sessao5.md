## **5 Cronograma e Entregas**

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
      <th><strong>Engenheiro de Requisitos Chefe da Sprint</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Sprint 1</strong></td>
      <td>15/04/2025</td>
      <td>12/05/2025</td>
      <td>Construção do Backlog e configuração dos ambientes</td>
      <td>
        - Definição do backlog inicial.<br>
        - Configuração da arquitetura (Rails, PostgreSQL).<br>
        - Ambiente de desenvolvimento configurado para todos os membros.<br>
        - Documento de Visão do Produto e Projeto
      </td>
      <td>Revisão do backlog e confirmação de prioridades.</td>
      <td>José</td>
    </tr>
    <tr>
      <td><strong>Sprint 2</strong></td>
      <td>13/05/2025</td>
      <td>09/06/2025</td>
      <td>Definição do MVP, DoR, DoD e criação de wireframes</td>
      <td>
        - Wireframes de Agendamento e registros (aguardando aprovação do MVP).<br>
        - Integração do Banco e mudança nos requisitos
      </td>
      <td>Entrega do MVP para o Professor para Validação. Demonstração dos Wireframes para a Cliente</td>
      <td>Ian</td>
    </tr>
    <tr>
      <td><strong>Sprint 3</strong></td>
      <td>10/06/2025</td>
      <td>23/06/2025</td>
      <td><strong>Entrega Parcial 1 (Release): </strong> - Cadastro de Agendamentos, clientes e login básico</td>
      <td>
        - Épico 1.1 completo.
        - US 1.2.1 , US 1.2.2 e US 1.2.4
        - US 1.3.1, US 1.3.2 e US 1.3.3

      </td>
      <td>Cliente testa o cadastro e simula agendamentos</td>
      <td>Cauã</td>
    </tr>
    <tr>
      <td><strong>Sprint 4</strong></td>
      <td>24/06/2025</td>
      <td>07/07/2025</td>
      <td><strong>Entrega Parcial 2 (Release):</strong>Histórico e consulta dos atendimentos e Login Completo</td>
      <td>
        - Acesso e Login: US 1.3.4
        - Épico 1.2 Completo.
      </td>
      <td>Avaliação da navegação e funcionalidade do histórico.</td>
      <td>Pedro</td>
    </tr>
    <tr>
      <td><strong>Sprint 5</strong></td>
      <td>08/07/2025</td>
      <td>14/07/2025</td>
      <td><strong>Entrega Parcial 3 (Release):</strong> Histórico e consulta dos atendimentos</td>
      <td>
        - Tema 2
      </td>
      <td>Cliente valida a praticidade e organização dos registros.</td>
      <td>Wallyson</td>
    </tr>
    <tr>
      <td><strong>Sprint 6</strong></td>
      <td>15/07/2025</td>
      <td>21/07/2025</td>
      <td>Refinamento final e preparação para entrega final</td>
      <td>
        - Ajustes finais no sistema.<br>
        - Correção de bugs.<br>
        - Preparação da documentação final.
      </td>
      <td>Cliente aprova o sistema para entrega final.</td>
      <td>Miguel</td>
    </tr>
  </tbody>
</table>

## Reorganização do Cronograma

Durante a execução do projeto, enfrentamos alguns empecilhos que nos levaram a reavaliar e reorganizar o cronograma inicialmente proposto. 

A seguir, apresentamos os cronogramas anteriormente definidos, mas que não foram integralmente seguidos. Essa diferença ocorreu tanto por ajustes no calendário da disciplina — que impactaram diretamente no ritmo de desenvolvimento — quanto por decisões internas da equipe quanto à priorização das funcionalidades. 

Vale destacar que a principal mudança entre o último cronograma preliminar e a versão final foi a retirada do **módulo financeiro**, que acabou sendo excluído por não estar alinhado com o escopo do **MVP** definido pela equipe.

### Primeiro Cronograma Definido

| **Sprint**  | **Início**   | **Fim**      | **Objetivo Principal**                                     | **Entregas Esperadas**                                                                                                                                                      | **Validação do Cliente**                                                                                     |
|-------------|--------------|--------------|-------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| Sprint 1    | 15/04/2025   | 28/04/2025   | Construção do Backlog e configuração dos ambientes         | - Definição do backlog inicial.  <br> - Configuração da arquitetura (Rails, PostgreSQL). <br> - Ambiente de desenvolvimento configurado para todos os membros. <br> - Documento de Visão do Produto e Projeto | Revisão do backlog e confirmação de prioridades.                                                             |
| Sprint 2    | 29/04/2025   | 12/05/2025   | Cadastro de Agendamentos e Clientes                         | - Funcionalidade de cadastro de cliente. <br> - Tela e lógica de agendamento. <br> - Validação de campos e integração inicial com o banco de dados.                        | Cliente testa o cadastro e simula agendamentos.                                                              |
| Sprint 3    | 13/05/2025   | 26/05/2025   | Geração de Relatórios                                       | - Geração automática de relatórios com campos editáveis. <br> - Upload de imagens organizadas por cliente. <br> - Armazenamento seguro.                                    | O cliente valida a praticidade e organização dos relatórios.                                                 |
| Sprint 4    | 27/05/2025   | 09/06/2025   | Primeira Entrega Parcial (Checkout) <br> Histórico e Consulta de Atendimentos | - Visualização do histórico de sessões por cliente. <br> - Edição e reenvio de relatórios anteriores. <br> - Integração com armazenamento externo (AWS/Firebase).        | Avaliação da navegação e funcionalidade do histórico. <br> Avaliação do checkout.                           |
| Sprint 5    | 10/06/2025   | 23/06/2025   | Módulo Financeiro e Relatórios Gerenciais (Entrega Parcial 2) | - Registro de pacotes e sessões. <br> - Lançamentos financeiros separados da terapia capilar. <br> - Relatórios de faturamento por cliente e período.                     | O cliente valida os lançamentos e usabilidade dos relatórios financeiros. <br> Avaliação do checkout.       |
| Sprint 6    | 24/06/2025   | 07/07/2025   | Aju   stes Finais e Preparação para Homologação                | - Correções gerais com base nos feedbacks. <br> - Testes de usabilidade. <br> - Refatoração. <br> - Preparação do ambiente de homologação.                                 | Validação das recomendações, ajustes baseados em feedbacks.                                                  |

### Segundo Cronograma Definido

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
