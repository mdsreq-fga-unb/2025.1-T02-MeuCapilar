# Especificação de Caso de Uso: Avaliar impacto da plataforma

## Histórico de Revisão

| Data       | Versão | Descrição                          | Autor           |
| :--------- | :----- | :--------------------------------- | :-------------- |
| 10/07/2025 | 1.0    | Criação do Documento e Especificação | Wallyson Souza  |

## 1. Breve Descrição

Este caso de uso permite que o **Administrador** do sistema avalie o impacto da plataforma Verify com base em dados analíticos sobre o uso da ferramenta, engajamento dos usuários, conteúdos verificados e relatórios gerados. A funcionalidade é essencial para a tomada de decisões estratégicas e melhoria contínua da plataforma, visando aumentar sua eficácia no combate à desinformação.

## 2. Fluxo Básico de Eventos

1.  O caso de uso inicia quando o Administrador acessa o módulo de relatórios da plataforma Verify.
2.  O sistema apresenta opções de visualização de dados analíticos (ex: usuários ativos, conteúdos verificados, taxa de engajamento).
3.  O Administrador seleciona os filtros desejados (ex: período, tipo de usuário, tema de desinformação).
4.  O sistema processa e apresenta os gráficos e tabelas com os dados solicitados.
5.  O Administrador analisa os dados e gera um relatório final.
6.  O sistema permite exportar o relatório em formato PDF ou Excel.
7.  O caso de uso é encerrado.

## 3. Fluxos Alternativos

### 3.1. [FA01] Geração de relatório customizado

1.  No passo 3 do fluxo básico, o Administrador pode optar por gerar um relatório específico por período.
2.  O sistema exibe campos para inserção de datas personalizadas.
3.  O fluxo segue normalmente a partir do passo 4.

## 4. Fluxos de Exceção

### 4.1. [FE01] Falha ao carregar dados analíticos

1.  No passo 4 do fluxo básico, caso o sistema não consiga carregar os dados solicitados:
    A. O sistema apresenta uma mensagem de erro indicando falha na recuperação dos dados.
    B. O Administrador pode tentar novamente ou redefinir os filtros aplicados.
    C. Se o problema persistir, o caso de uso é encerrado.

## 5. Pré-Condições

5.1. O Administrador deve estar autenticado no sistema.
5.2. O sistema deve ter acesso aos bancos de dados analíticos da plataforma.

## 6. Pós-Condições

6.1. O relatório de impacto pode ser exportado e arquivado.
6.2. As métricas podem ser utilizadas para ajustes na estratégia da plataforma.

## 7. Pontos de Extensão

7.1. Comparação entre períodos.

## 8. Requisitos Especiais

8.1. O sistema deve apresentar os dados em tempo real ou com atualização máxima de 24 horas.
8.2. As visualizações devem ser responsivas e compatíveis com dispositivos móveis.
8.3. Os relatórios devem estar disponíveis nos idiomas português e inglês.

## 9. Regras de Negócio

9.1. O relatório deve conter, no mínimo: número de usuários ativos, número de conteúdos verificados, taxa de engajamento, regiões de acesso e indicadores de impacto.
9.2. Os filtros disponíveis devem permitir seleção por: período (data de início e fim), tipo de usuário (comum, moderador), e área temática (saúde, política, economia).
9.3. Os relatórios devem exibir colunas com: métrica, valor, variação percentual e status.

## 10. Informações Adicionais

- Este caso de uso contribui diretamente para os objetivos estratégicos de **monitoramento do desempenho da plataforma e tomada de decisão baseada em dados**.
- Os dados apresentados podem incluir: número de denúncias validadas, taxa de redução de conteúdos enganosos, regiões com maior uso da plataforma, entre outros indicadores.
- Os relatórios gerados podem ser compartilhados com parceiros estratégicos e utilizados para prestação de contas com órgãos reguladores e entidades colaboradoras.