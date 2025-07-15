[Clique Aqui (Disponível apenas para pessoas em UnB.br).](https://unbbr.sharepoint.com/:v:/s/MeuCapilar-Requisitos/EQKZDTlFW_lFpwiHh0YSf2MBY_lm1mxagzssGbSHjaJDyg?e=4vNrmr&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D)

# Sprint Planning - Sprint 4

**Data:** 28/06/2025  
**Horário:** 21:09 (Início da gravação)  
**Duração:** 29m 54s  
**Local:** Teams
**Participantes:**  
- Ian Costa Guimaraes (Scrum Master)
- Jose Andre Rabelo Rocha
- Pedro Luciano De Azevedo
- Caua Araujo Dos Santos
- Miguel Pires Gomes

*(Observação: Wallyson Paulo Costa Souza não estava presente, mas foi mencionado como responsável por tarefas de organização do backlog).*

---

## Objetivo da Reunião
Realizar o planejamento da Sprint 4, definir as prioridades e distribuir as tarefas relacionadas ao Épico 2 (Geração e Gestão de Relatórios/Registros Clínicos), além de alinhar o cronograma com a data de entrega da unidade 4, marcada para 15 de julho.

---

## Pontos Principais Discutidos

### 1. **Revisão do Cronograma e Entregas**
- **Prazo Final**: A entrega da unidade 4 é no dia **15 de julho**.
- **Planejamento das Sprints**:
    - **Sprint 4**: Foco no desenvolvimento do Épico 2 (geração e gestão de registros clínicos).
    - **Sprint 5**: Encerra em 14 de julho, sendo a última entrega parcial antes do prazo final.
- **Status do Projeto**: Foi discutida a necessidade de atualizar o backlog no Azure DevOps (Pages) para refletir o estado atual e garantir que os critérios de aceitação das tarefas da sprint anterior sejam devidamente documentados por Pedro.

### 2. **Foco da Sprint 4: Épico 2 - Registros Clínicos**
- **Prioridade Máxima (Must-have)**: O desenvolvimento do Épico 2, que inclui a geração e edição de relatórios (US 2.1) e a gestão de anexos e exportação (US 2.2), é o foco principal.
- **Mudança de Nomenclatura**: O time alinhou que o termo **"Relatório"** nas User Stories será substituído por **"Registro Clínico"** para melhor refletir a funcionalidade. O relatório passa a ser a saída (exportação) do registro.
- **Visualização dos Registros**: A visualização dos registros clínicos será feita em formato **HTML** dentro da plataforma, permitindo a exibição de textos e imagens. A exportação para PDF será tratada como uma funcionalidade separada.

### 3. **Distribuição de Tarefas**

| Tarefa | Responsável(eis) | Observações |
| :--- | :--- | :--- |
| **US 2.1.1: Gerar Registro Clínico** | Ian Costa e Jose Andre | Tarefa de maior complexidade, será desenvolvida em pair programming. |
| **Anexar Imagens ao Registro** | Ian Costa e Jose Andre | Considerada uma dependência funcional da geração do registro. |
| **Editar Registro Clínico** | Ian Costa e Jose Andre | Também associada à criação do registro. |
| **Visualizar Histórico de Registros (Terapeuta)** | Pedro Luciano e Miguel Pires | A visualização será em HTML. A tarefa foi atribuída à dupla por ter alta sinergia com a visualização do paciente. |
| **Entregar/Visualizar Registro Clínico (Paciente)** | Miguel Pires e Pedro Luciano | O paciente visualizará seus próprios registros em seu dashboard, de forma similar à visão da terapeuta. |
| **Exportar Registro Clínico (HTML para PDF)** | Caua Araujo | A tarefa consiste em pesquisar e implementar uma solução para converter o registro (em HTML, com texto e imagens) para um arquivo PDF. |
| **Organização do Backlog** | Wallyson Paulo | Atualizar o backlog no Azure DevOps, corrigir nomenclaturas e alinhar as User Stories com o planejamento atual. |
| **Documentar Critérios de Aceitação (Sprint 3)** | Pedro Luciano | Finalizar a documentação das tarefas da sprint anterior e movê-las para "Pronto". |

### 4. **Ações e Decisões Técnicas**
- **Desenvolvimento**: Todo o desenvolvimento deve partir da branch `develop`.
- **Testes Unitários**: Foi reforçada a importância de criar testes unitários para todas as novas funcionalidades, um ponto elogiado pelo professor na entrega anterior.
- **Trabalho em Pares**: A equipe foi incentivada a gravar as sessões de pair programming no Teams para documentar o progresso.

---

## Próximos Passos
- **Ian e Jose**: Iniciar o desenvolvimento da funcionalidade core de geração de registros clínicos.
- **Pedro e Miguel**: Trabalhar em conjunto na implementação das telas de visualização de registros.
- **Caua**: Pesquisar e desenvolver a funcionalidade de exportação para PDF.
- **Wallyson**: Organizar e atualizar o backlog conforme discutido.
- **Todos**: Puxar as atualizações da branch `develop` antes de iniciar o trabalho e criar testes unitários.
