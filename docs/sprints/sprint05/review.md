[Clique Aqui (Disponível apenas para pessoas em UnB.br).](https://unbbr.sharepoint.com/:v:/s/MeuCapilar-Requisitos/EW2mOzSsJiZFuvAtRrYTXF4BR-lHyTSZUBNpEhOJRPWDDQ?e=IP3JhC&nav=eyJyZWZlcnJhbEluZm8iOnsicmVmZXJyYWxBcHAiOiJTdHJlYW1XZWJBcHAiLCJyZWZlcnJhbFZpZXciOiJTaGFyZURpYWxvZy1MaW5rIiwicmVmZXJyYWxBcHBQbGF0Zm9ybSI6IldlYiIsInJlZmVycmFsTW9kZSI6InZpZXcifX0%3D)

# Sprint Review - Sprint 5

**Data:** 14/07/2025  
**Horário:** 21:18 (Início da gravação)  
**Duração:** 22m 45s  
**Local:** Teams
**Participantes:**  
- Jose Andre Rabelo Rocha
- Flávia Rabello (Cliente/Product Owner)
- Pedro Luciano De Azevedo
- Caua Araujo Dos Santos
- Miguel Pires Gomes
- Wallyson Paulo Costa Souza

---

## Objetivo da Reunião
Apresentar à cliente (Flávia Rabello) os incrementos finais de software desenvolvidos durante a Sprint 5, a última do cronograma da disciplina. O foco é validar as funcionalidades implementadas com base nos feedbacks das reuniões anteriores e confirmar que o produto atende às necessidades essenciais definidas.

---

## Funcionalidades Apresentadas e Validadas

### 1. **Privacidade do Tratamento Realizado**
- **Funcionalidade**: Conforme solicitado na reunião anterior, o campo "Tratamento Realizado" agora é visível apenas para o terapeuta.
- **Demonstração**: Foi mostrado que, ao exportar o PDF do registro clínico, o terapeuta tem acesso a esse campo, mas na visão do paciente (tanto na plataforma quanto no PDF exportado por ele), o campo é omitido.
- **Feedback da Cliente**: **Muito positivo**. A cliente aprovou a implementação, afirmando: "Muito bom, ficou muito bom."

### 2. **Acesso do Paciente ao Histórico de Registros**
- **Funcionalidade**: O paciente agora tem uma seção de "Registros" em seu perfil, onde pode visualizar seu histórico completo de atendimentos.
- **Demonstração**: Foi exibido que os registros aparecem em ordem cronológica decrescente (do mais recente para o mais antigo), permitindo ao paciente acompanhar sua evolução. O paciente também pode exportar seus próprios relatórios em PDF diretamente da plataforma.
- **Feedback da Cliente**: **Positivo**. A funcionalidade foi validada como um avanço importante para a autonomia do paciente.

### 3. **Melhorias na Usabilidade e Navegação**
- **Clareza no Cadastro**: O botão no dashboard do terapeuta foi alterado de "Ver Pacientes" para "Cadastrar Paciente", tornando a ação mais intuitiva.
- **Performance do Calendário**: A lentidão ao navegar entre datas futuras no calendário de agendamentos foi corrigida, tornando a experiência mais fluida.
- **Ícone do Site (Favicon)**: Foi adicionado um ícone personalizado do MeuCapilar, melhorando a identidade visual da plataforma no navegador.

### 4. **Regra de Negócio para Integridade dos Dados**
- **Funcionalidade**: Foi implementada uma trava de segurança que impede o terapeuta de excluir um atendimento que já possua um registro clínico vinculado.
- **Demonstração**: Ao tentar excluir um atendimento com registro, o sistema exibe uma mensagem de erro, protegendo os dados contra exclusão acidental e garantindo a rastreabilidade.
- **Feedback da Cliente**: **Positivo**. A cliente reconheceu a importância da funcionalidade para evitar a perda de dados.

### 5. **Páginas Estáticas**
- **Funcionalidade**: Foram criadas as páginas "Quem Somos" (Sobre) e "Contato", fornecendo informações sobre o projeto, a equipe e um canal de comunicação.
- **Feedback da Cliente**: **Positivo**. A cliente elogiou a iniciativa e o potencial de crescimento do projeto.

---

## Pontos de Discussão e Status do Projeto

- **Status dos Feedbacks**: Dos 12 pontos de melhoria levantados pela cliente nas reuniões anteriores, a equipe conseguiu implementar 6 (50%), focando nos mais críticos para a usabilidade e segurança.
- **Edição de Imagens**: Foi explicado que a funcionalidade de editar imagens (desenhar círculos/setas) ainda não está funcional no ambiente de produção devido à complexidade da infraestrutura externa de imagens. Embora não seja essencial para o MVP, foi destacado como um próximo passo importante para o futuro do projeto.
- **MVP (Mínimo Produto Viável)**: Foi reforçado que a versão atual representa o MVP definido para a disciplina, resolvendo os problemas centrais da cliente com o mínimo de funcionalidades necessárias. Futuros incrementos continuarão a ser desenvolvidos.

---

## Conclusão
A cliente expressou grande satisfação com o resultado final, afirmando que o projeto está "muito bom mesmo" e que a equipe conseguiu entender e aplicar os feedbacks de forma eficaz. A sprint review foi concluída com sucesso, validando as entregas finais do projeto dentro do escopo da disciplina.
