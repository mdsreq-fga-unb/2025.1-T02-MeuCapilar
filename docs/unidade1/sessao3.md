# **3. ESTRATÉGIAS DE ENGENHARIA DE SOFTWARE**

## **3.1 Estratégia Priorizada**

- **Abordagem**: Ágil
- **Ciclo de Vida**: Ágil
- **Processo**: Scrum/XP

## **3.2 Quadro Comparativo**
<p style="text-align: justify;"> 
O Quadro, a seguir, apresenta algumas características que podem ser relacionadas ao <strong>RAD</strong> e ao <strong>ScrumXP</strong>,  visando auxiliar no entendimento e justificativa da escolha do processo mais adequado ao caso da Meu Capilar, já que os dois são “parecidos” em certos aspectos.
</p>

<table border="1">
  <thead style="background-color: #D3D3D3;">
    <tr>
      <th><strong>Características</strong></th>
      <th><strong>RAD</strong></th>
      <th><strong>Scrum/XP</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Abordagem geral</strong></td>
      <td>Iterativa e incremental, com foco em desenvolvimento rápido e prototipação contínua.</td>
      <td>Ágil com  entregas rápidas(Sendo incrementos ou não) e feedback contínuo. </td>
    </tr>
    <tr>
      <td><strong>Foco em arquitetura</strong></td>
      <td>PMenor foco em uma arquitetura robusta no início. A arquitetura evolui com base em protótipos e interação com o cliente. </td>
      <td>Menor foco na arquitetura inicialmente,  com evolução da arquitetura ao longo do  tempo e conforme a necessidade.</td>
    </tr>
    <tr>
      <td><strong>Estrutura de Processo</strong></td>
      <td>Baseado em fases como planejamento de requisitos, prototipagem, testes e implementação. Foco em velocidade e iteração com o cliente.</td>
      <td>Focado em sprints curtos e flexíveis (2-4  semanas) com entregas incrementais e  adaptação contínua durante o projeto.</td>
    </tr>
    <tr>
      <td><strong>Flexibilidade de requisitos</strong></td>
      <td>Bastante flexibilidade, com mudanças frequentes durante a prototipação. Os requisitos evoluem com o tempo.</td>
      <td>Alta flexibilidade para mudanças  contínuas de requisitos a cada sprint.  Muda conforme o feedback frequente do  cliente. </td>
    </tr>
    <tr>
      <td><strong>Colaboração com cliente</strong></td>
      <td>Envolvimento intensivo do cliente durante todo o processo, especialmente nas fases de prototipação e feedback.</td>
      <td>Envolvimento constante do cliente, com  feedback ao final de cada sprint,  garantindo que os requisitos estejam</td>
    </tr>
    <tr>
      <td><strong>Complexidade do processo</strong></td>
      <td>Processo menos formal, mas pode se tornar complexo se não houver controle sobre mudanças rápidas.</td>
      <td>Mais leve e ágil, com menos  documentação formal e mais foco na  entrega funcional, facilitando a adaptação  contínua.</td>
    </tr>
    <tr>
      <td><strong>Qualidade Técnica</strong></td>
      <td>Qualidade depende da rapidez dos ciclos e do envolvimento do cliente. Menor foco em práticas técnicas estruturadas.</td>
      <td>Alta ênfase na qualidade técnica, com  práticas como TDD (Test-Driven  Development), pair programming e  integração contínua para garantir um  código limpo e principalmente funcional durante a maioria do processo.</td>
    </tr>
    <tr>
      <td><strong>Práticas de desenvolvimento</strong></td>
      <td>Uso de prototipação rápida e feedback constante. Pouca ênfase em práticas como TDD ou refatoração contínua.</td>
      <td>TDD, refatoração contínua, integração contínua e pair programming promovem alta qualidade no código.</td>
    </tr>
    <tr>
      <td><strong>Adaptação ao Projeto da Meu Capilar</strong></td>
      <td>Ideal para projetos de interação constante com o cliente e para equipes com habilidosas na prototipação.</td>
      <td>Ideal para projetos onde a interação  constante com o cliente e a evolução  contínua do produto são fundamentais.  Adaptável a mudanças frequentes e  rápidos ciclos de feedback. </td>
    </tr>
    <tr>
      <td><strong>Documentação</strong></td>
      <td>Documentação mínima, focando mais em protótipos e comunicação direta com o cliente.</td>
      <td>Minimiza a documentação formal, focando em comunicação e feedback rápido.</td>
    </tr>
    <tr>
      <td><strong>Controle de Qualidade</strong></td>
      <td>A qualidade é verificada por meio de testes e revisões rápidas, com base em protótipos.</td>
      <td>Embutido nas práticas XP (TDD, integração contínua), garantindo testes a cada nova funcionalidade.</td>
    </tr>
    <tr>
      <td><strong>Escalabilidade</strong></td>
      <td>Mais indicado para projetos de pequeno a médio porte, onde mudanças rápidas são possíveis.</td>
      <td>Escalável, mas mais indicado para equipes menores e médias.</td>
    </tr>
    <tr>
      <td><strong>Suporte a Equipes de Desenvolvimento</strong></td>
      <td>Suporta equipes pequenas com alta colaboração e rapidez. Menor definição de papeis formais.</td>
      <td>Suporta equipes menores e colaborativas, com papeis mais flexíveis.</td>
    </tr>
  </tbody>
</table>


## **3.3 Justificativa**

<p style="text-align: justify;">Com base na análise comparativa entre os modelos RAD e Scrum XP, optamos pela utilização do Scrum XP para o desenvolvimento do produto Meu Capilar, considerando os seguintes pontos:</p>

<ul>
    <li style="text-align: justify;"><strong>Adaptação Contínua e Entregas Frequentes:</strong> O <strong>ScrumXP</strong> foi escolhido por sua abordagem ágil, que permite entregas rápidas por meio de sprints curtos e constantes ciclos de feedback com o cliente. Essa característica é essencial para o projeto Meu Capilar, que pode sofrer alterações frequentes conforme o uso e a percepção dos usuários. Ao final de cada sprint, é possível validar funcionalidades, identificar melhorias e adaptar o sistema com agilidade, garantindo que o produto esteja sempre alinhado às necessidades reais do público.</li>
    <li style="text-align: justify;"><strong>Qualidade Técnica e Eficiência no Desenvolvimento:</strong> Diferentemente do RAD, que prioriza a prototipação rápida com menor foco em práticas técnicas estruturadas, o <strong>ScrumXP</strong> incorpora ferramentas como TDD (Test-Driven Development), integração contínua, refatoração e pair programming. Essas práticas não apenas elevam o nível de qualidade do código desde os primeiros ciclos de desenvolvimento, como também contribuem para a redução de erros, melhoria da manutenibilidade e robustez do sistema a longo prazo. No prazo atual do trabalho, entregar um MVP e código rodando é mais importante que design.</li>
    <li style="text-align: justify;"><strong>Compatibilidade com a Estrutura do Projeto:</strong><strong> ScrumXP</strong> se mostra mais compatível com a natureza do projeto Meu Capilar, tanto pelo seu suporte a equipes pequenas e colaborativas quanto pela flexibilidade na gestão de requisitos. A leveza do processo, aliada a uma estrutura clara de papeis e entregas, facilita o trabalho do time e promove uma comunicação mais eficiente com o cliente. Além disso, sua escalabilidade o torna uma opção viável mesmo em cenários de crescimento futuro.</li>
</ul>