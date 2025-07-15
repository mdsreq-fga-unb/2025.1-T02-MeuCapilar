# Especificação de Caso de Uso: Acessar conteúdos educacionais

## Histórico de Revisão

| Data       | Versão | Descrição                          | Autor              |
| :--------- | :----- | :--------------------------------- | :----------------- |
| 07/07/2025 | 1.0    | Criação do Documento e Especificação | José André Rabelo  |

## 1. Breve Descrição

Este caso de uso permite que o **Usuário Comum** acesse conteúdos educacionais disponibilizados pela plataforma Verify, com o objetivo de promover a alfabetização digital e a conscientização crítica sobre desinformação. Esses conteúdos podem incluir guias interativos, materiais em texto ou vídeo, e recomendações personalizadas com base nos interesses do usuário.

## 2. Fluxo Básico de Eventos

1.  O caso de uso inicia quando o Usuário Comum acessa a área de conteúdos educacionais no aplicativo Verify.
2.  O sistema apresenta as categorias de conteúdo disponíveis (ex: saúde, política, economia).
3.  O usuário escolhe uma categoria ou tema de interesse.
4.  O sistema exibe uma lista de conteúdos disponíveis dentro da categoria selecionada.
5.  O usuário seleciona um conteúdo específico.
6.  O sistema exibe o conteúdo educacional completo.
7.  O usuário pode marcar o conteúdo como "lido", "útil" ou "salvar para depois".
8.  O sistema registra o progresso e atualiza o histórico do usuário.
9.  O caso de uso é encerrado.

## 3. Fluxos Alternativos

### 3.1. [FA01] Acesso direto via recomendação personalizada

1.  No passo 1 do fluxo básico, o usuário pode optar por acessar diretamente um conteúdo recomendado pelo sistema.
2.  O sistema apresenta o conteúdo com base nos temas com os quais o usuário interage mais frequentemente ou conforme seu perfil.
3.  O fluxo segue a partir do passo 5 do fluxo básico.

## 4. Fluxos de Exceção

### 4.1. [FE01] Falha de conexão com o servidor

1.  No passo 4 do fluxo básico, se o sistema não conseguir carregar a lista de conteúdos por indisponibilidade do servidor:
    a. O sistema apresenta uma mensagem de erro ao usuário, indicando a falha na conexão e sugerindo tentar novamente mais tarde.
    b. O caso de uso é encerrado.

### 4.2. [FE02] Conteúdo indisponível

1.  No passo 6 do fluxo básico, se o conteúdo selecionado estiver indisponível (por exemplo, removido ou com erro de carregamento):
    a. O sistema exibe uma mensagem informando que o conteúdo não pode ser exibido.
    b. O fluxo retorna ao passo 4 para que o usuário selecione outro conteúdo.

## 5. Pré-Condições

5.1. O usuário deve estar autenticado no sistema (logado).
5.2. A plataforma deve estar com acesso à base de dados de conteúdos educacionais.

## 6. Pós-Condições

6.1. O sistema registra que o conteúdo foi acessado.
6.2. O histórico do usuário é atualizado com a interação.

## 7. Pontos de Extensão

### 7.1. Recomendação de Conteúdo

-   Ponto de extensão no passo 2 do fluxo básico: o sistema pode estender a funcionalidade oferecendo sugestões personalizadas com base em preferências do usuário.

## 8. Requisitos Especiais

8.1. O sistema deve garantir que os conteúdos estejam disponíveis também em modo offline, quando previamente baixados.
8.2. A interface deve ser acessível em dispositivos móveis.
8.3. Os conteúdos devem ser classificados com metadados que permitam sua busca por tema e complexidade.

## 9. Informações Adicionais

-   Esse caso de uso contribui para o objetivo estratégico de “Facilitar a Educação Digital" e promover a "Capacitação dos Usuários”, conforme definido no estudo de caso Verify.
-   O conteúdo educacional pode incluir formatos diversos como vídeo, texto, quizzes, infográficos e podcasts.
