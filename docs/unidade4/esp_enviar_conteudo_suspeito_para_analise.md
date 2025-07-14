# Verify – Combate à Desinformação  

## Especificação do Caso de Uso: Enviar Conteúdo Suspeito para Análise

**Versão 1.1**

### Histórico da Revisão

| Data       | Versão | Descrição                         | Autor        |
| :--------- | :----- | :-------------------------------- | :----------- |
| 07/07/2025 | 1.0    | Criação inicial do documento      | Miguel Pires |
| 11/07/2025 | 1.1    | Alteração conforme feedback       | Miguel Pires |

---

### Índice

1.  Enviar Conteúdo Suspeito para Análise
    * 1.1. Breve Descrição
    * 1.2. Atores
2.  Pré-Condições
    * 2.1 Usuário Autenticado
3.  Pós-Condições
    * 3.1 Registro de Conteúdo Suspeito Criado
4.  Fluxo Básico de Eventos
5.  Fluxos Alternativos
    * 5.1 Usuário Cancela o Envio
    * 5.2 Dados Inválidos ou Incompletos
    * 5.3 Conteúdo Já Reportado
6.  Fluxos de Exceção
    * 6.1 Falha de Conexão com o Servidor
7.  Regras de Negócio
    * RN.001 - Frequência de Reporte por Usuário
    * RN.002 - Obrigatoriedade da Descrição
    * RN.003 - Atribuição de Pontos por Reporte
8.  Pontos de Extensão
    * 8.1. Atribuir Pontos de Recompensa
9.  Requisitos Especiais
    * 9.1 Performance de Carregamento e Envio
    * 9.2 Usabilidade do Formulário

---

## 1. Enviar Conteúdo Suspeito para Análise

### 1.1. Breve Descrição

Este caso de uso permite que um Usuário Comum reporte um conteúdo que ele considera suspeito ou potencialmente falso/enganoso para que seja submetido à análise de Moderadores ou da comunidade. O objetivo é engajar a base de usuários na detecção de desinformação e facilitar o processo de verificação.

### 1.2. Atores

* Usuário Comum

---

## 2. Pré-Condições

### 2.1 Usuário Autenticado

* O Usuário Comum deve ter feito login no sistema e sua sessão deve estar ativa.

---

## 3. Pós-Condições

### 3.1 Registro de Conteúdo Suspeito Criado

* Um novo registro para o conteúdo reportado é persistido no banco de dados do sistema, aguardando análise.
* O status inicial do registro é "Em Análise Pendente" ou similar.

---

## 4. Fluxo Básico de Eventos

Este caso de uso é iniciado quando o Usuário Comum identifica um conteúdo suspeito e decide reportá-lo.

1.  O Usuário Comum encontra um conteúdo (dentro ou fora do sistema) que ele considera suspeito.
2.  O Usuário Comum seleciona a opção "Reportar Conteúdo Suspeito" (ou um mecanismo similar) associada ao conteúdo ou acessa uma interface de submissão de reporte geral.
3.  O Sistema exibe um formulário de submissão de reporte.
4.  O Usuário Comum preenche o formulário, fornecendo as seguintes informações:
    * 4.1. Link ou identificador do conteúdo.
    * 4.2. Uma descrição detalhada do motivo pelo qual o conteúdo é considerado suspeito. [RN002]
    * 4.3. Evidências adicionais (opcional).
    * 4.4. Categoria ou tipo de desinformação (opcional).
5.  O Usuário Comum clica no botão "Enviar" ou "Reportar". [FA3.1]
6.  O Sistema valida os dados submetidos no formulário. [FA 3.2]
7.  O Sistema cria um registro de "Conteúdo Suspeito" no banco de dados, associando-o ao usuário comum que o reportou e marcando-o para análise pelos Moderadores. [FA 3.3] [RN. 001] [FE 4.1]
8.  O Sistema exibe uma mensagem de confirmação ao Usuário Comum, indicando que o reporte foi recebido com sucesso.

---

## 5. Fluxos Alternativos

### 5.1 Usuário Cancela o Envio

**Condição:** No Passo 5 do Fluxo Básico de Eventos (quando o usuário está na interface de submissão do formulário), o Usuário Comum decide não prosseguir com o envio do reporte.

1.  O Usuário Comum clica no botão "Cancelar" ou "Voltar" presente no formulário de submissão.
2.  O Sistema descarta todas as informações preenchidas no formulário.
3.  O Sistema retorna à tela anterior ou à visualização do conteúdo de onde o processo de reporte foi iniciado.
4.  O fluxo de eventos do caso de uso é encerrado sem a criação de um registro de conteúdo suspeito.

### 5.2 Dados Inválidos ou Incompletos

**Condição:** No Passo 6 do Fluxo Básico de Eventos (após o usuário tentar enviar o formulário), o Sistema detecta que um ou mais campos obrigatórios não foram preenchidos ou que os dados fornecidos em algum campo são inválidos (e.g., um link com formato incorreto).

1.  O Sistema impede o envio do formulário.
2.  O Sistema exibe mensagens de erro claras e contextuais, indicando exatamente quais campos estão incompletos ou contém dados inválidos.
3.  O Usuário Comum revisa o formulário, corrige os dados incorretos ou preenche os campos ausentes.
4.  O Usuário Comum pode tentar enviar o formulário novamente, retornando ao Passo 5 do Fluxo Básico de Eventos.

### 5.3 Conteúdo Já Reportado

**Condição:** No Passo 7 do Fluxo Básico de Eventos (durante a criação do registro de conteúdo suspeito), o Sistema identifica que o conteúdo específico que está sendo reportado (baseado no link ou identificador único) já possui um reporte ativo e recente aguardando análise.

1.  O Sistema não cria um registro de "Conteúdo Suspeito" para o mesmo item.
2.  O Sistema informa ao Usuário Comum que o conteúdo já está sob análise.
3.  O Sistema pode oferecer ao Usuário Comum a opção de adicionar informações complementares ao reporte existente, redirecionando-o para uma interface de edição/atualização do reporte.
4.  O fluxo de eventos do caso de uso é encerrado, evitando a duplicação de reportes.

---

## 6. Fluxos de Exceção

### 6.1 Falha de Conexão com o Servidor

**Condição:** Durante a tentativa de envio do formulário (Passo 7 do Fluxo Básico), ocorre uma falha na comunicação com o servidor.

1.  O Sistema exibe uma mensagem de erro indicando que não foi possível conectar-se ao servidor ou que o envio falhou devido a um problema de rede.
2.  O Sistema pode oferecer ao Usuário Comum a opção de tentar novamente ou cancelar a operação.
3.  Se o Usuário Comum tentar novamente, o fluxo retorna ao Passo 5 do Fluxo Básico.

---

## 7. Regras de Negócio

* **RN.001 - Frequência de Reporte por Usuário:** Um Usuário Comum pode reportar o mesmo conteúdo (identificado pelo link/ID) no máximo uma vez a cada 24 horas.
* **RN.002 - Obrigatoriedade da Descrição:** A descrição do motivo do reporte é um campo obrigatório para fornecer contexto aos moderadores.
* **RN.003 - Atribuição de Pontos por Reporte:** A atribuição de pontos pela contribuição (referente ao Ponto de Extensão "Atribuir Pontos de Recompensa") só deve ocorrer após a validação inicial do reporte por um Moderador ou pelo sistema, confirmando que o reporte é válido e não malicioso ou aleatório.

---

## 8. Pontos de Extensão

### 8.1. Atribuir Pontos de Recompensa

**Localização:** Após o Passo 8 do Fluxo Básico (após a confirmação de recebimento do reporte).
**Descrição:** Este ponto permite a integração com o caso de uso "Resgatar recompensas por meio de pontos", onde o sistema pode acionar a lógica para atribuir pontos ao Usuário Comum pela sua contribuição. A atribuição final de pontos é condicionada à validação do reporte por um Moderador ou pelo sistema (RN.003).

---

## 9. Requisitos Especiais

### 9.1 Performance de Carregamento e Envio

* O formulário de submissão deve carregar em no máximo 2 segundos.
* O processo de envio do reporte deve ser concluído e confirmado ao usuário em no máximo 5 segundos (excluindo tempo de rede do usuário).

### 9.2 Usabilidade do Formulário

* O formulário de reporte deve ser intuitivo e fácil de preencher, com campos claros, rótulos compreensíveis e, quando aplicável, sugestões de preenchimento.
* As mensagens de erro devem ser claras e orientar o usuário sobre como corrigir problemas.