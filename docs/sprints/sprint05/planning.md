[Clique Aqui (Disponível apenas para pessoas em UnB.br).](https://unbbr.sharepoint.com/:v:/s/MeuCapilar-Requisitos/EX8BdQsq4y5CoS0M4gegAUgB9nOe4hRi2_zleL8ROxze-Q?e=4MJcs9&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D)

# Sprint Planning - Sprint 5

**Data:** 10/07/2025  
**Horário:** 19:26 (Início da gravação)  
**Duração:** 21m 50s  
**Local:** Teams
**Participantes:**  
- Ian Costa Guimaraes (Scrum Master)  
- Jose Andre Rabelo Rocha  
- Wallyson Paulo Costa Souza  
- Pedro Luciano De Azevedo
- Miguel Pires Gomes (mencionado)
- Caua Araujo Dos Santos (mencionado)

---

## Objetivo da Reunião
Realizar o planejamento da Sprint 5, que é a última sprint antes da entrega final (marcada para a terça-feira da semana seguinte). O foco é definir e distribuir as tarefas restantes, incluindo débitos técnicos da sprint anterior e a criação de uma nova User Story para aprimoramento de texto com IA.

---

## Pontos Principais Discutidos

### 1. **Revisão e Refinamento do Backlog**
- **Redundância de User Stories**: A equipe identificou que a US 2.1.3 ("visualizar histórico de relatórios") era redundante com a US 2.2.2 ("exportar históricos") e outras funcionalidades já implementadas. **Decisão**: A US 2.1.3 foi removida do backlog.
- **Ajuste de Nomenclatura e Escopo**:
    - A US 2.1.1 ("gerar um relatório clínico com base no diagnóstico") foi redefinida. A equipe concluiu que a funcionalidade já desenvolvida era, na verdade, "cadastrar um registro clínico". O título da US foi alterado para refletir isso.
    - A US 2.2.1 ("entregar o relatório digitalmente ao cliente") foi refinada para significar "permitir que o paciente possa baixar (exportar) o relatório em PDF", espelhando a funcionalidade do terapeuta.
- **Criação de Nova User Story**: Foi definida a necessidade de uma nova US: *"Como terapeuta, quero aprimorar os meus textos para gerar um relatório a partir de um registro clínico."* Esta US cobrirá a funcionalidade de usar IA para corrigir e melhorar os textos inseridos nos campos do registro.

### 2. **Débito Técnico e Foco da Sprint**
- A equipe reconheceu que as principais tarefas da Sprint 5 são, na verdade, um débito técnico da Sprint 4, focadas em finalizar o ciclo de vida do registro/relatório.
- As três User Stories priorizadas para desenvolvimento são:
    1.  **US 2.1.1 (Alterada)**: Cadastrar um registro clínico com base no diagnóstico. (Funcionalidade base já implementada, necessita de refinamento).
    2.  **US 2.1.4**: Anexar imagens ao registro clínico. (Código já desenvolvido, mas precisa ter os critérios de aceitação escritos e validados).
    3.  **US 2.2.2**: Exportar o relatório de evolução do paciente em PDF (visão do terapeuta).

### 3. **Distribuição de Tarefas**

| Tarefa | Responsável(eis) | Observações |
| :--- | :--- | :--- |
| **Desenvolver Páginas Estáticas** (Sobre, Contato, Privacidade, Suporte) | Wallyson Paulo | Tarefa de desenvolvimento para que ele possa atuar mais na programação nesta sprint. |
| **Exportar Relatório (Visão do Paciente - US 2.2.1)** | Pedro Luciano e Miguel Pires | Permitir que o paciente baixe o PDF do seu registro. |
| **Exportar Relatório (Visão do Terapeuta - US 2.2.2)** | Jose Andre | Implementar a funcionalidade de exportação de PDF para o terapeuta. |
| **Anexar Imagens (US 2.1.4)** | Jose Andre (desenvolvimento) e Ian Costa (documentação) | Ian escreverá os critérios de aceitação para validar o código que José já desenvolveu. |
| **Nova US (Aprimorar texto com IA)** | A ser atribuída | A equipe irá detalhar e incluir esta US no backlog. |
| **Atualização do Cronograma, MVP e Pages** | Ian Costa | Responsável por alinhar toda a documentação do projeto. |
| **Ajuste do PBB (Product Backlog)** | Pedro Luciano | Corrigir o PBB conforme as issues abertas pelo professor. |
| **Criação de Casos de Uso** | Todos | Cada membro da equipe deverá criar um caso de uso para o estudo de caso do "Verifica". |

---

## Próximos Passos
- A equipe tem 4-5 dias para concluir todas as tarefas de desenvolvimento e documentação.
- O foco principal é finalizar as 3 US essenciais para a entrega.
- Todos os membros devem se dedicar às suas tarefas de documentação para garantir que tudo esteja pronto para a apresentação final.
