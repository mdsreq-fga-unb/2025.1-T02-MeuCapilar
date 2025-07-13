# Verify

## Verify – Combate à Desinformação

## Especificação de Caso de Uso: Analisar Conteúdo Manualmente

## Versão 2.0

### Histórico da Revisão

| Data | Versão | Descrição | Autor |
| --- | --- | --- | --- |
| 08/Jul/2025 | 1.0 | Criação inicial da especificação | Ian Costa |
| 12/Jul/2025 | 2.0 | Ajuste Conforme Feedback | Ian Costa |
| | | | |

### Índice

1. Breve Descrição
2. Fluxo Básico de Eventos
3. Fluxos Alternativos
3.1 FA01: Relatório Requer Informações Adicionais
4. Fluxos de Exceção
4.1 FE01: Conteúdo Não Encontrado
5. Pré-Condições
6. Pós-Condições
7. Pontos de Extensão
8. Requisitos Especiais
9. Informações Adicionais
10. Regras de Negócio
10.1 RN01: Exibição de Conteúdos Sinalizados
10.2 RN02: Detalhes do Conteúdo para Revisão
10.3 RN03: Relatório de Análise Manual
10.4 RN04: Notificação ao Usuário

---

## 1. Breve Descrição

Este caso de uso descreve o processo pelo qual um moderador do sistema Verify realiza a análise manual de conteúdos sinalizados como potencialmente enganosos. O objetivo é revisar as evidências geradas pela IA, consultar fontes confiáveis e emitir uma classificação oficial sobre a veracidade do conteúdo.

## 2. Fluxo Básico de Eventos

FB01: O moderador acessa o painel de controle do sistema. (RN01)

FB02: O sistema exibe uma lista de conteúdos sinalizados pela IA como suspeitos. (RN01)

FB03: O moderador seleciona um conteúdo para revisão. (RN02) (FE01)

FB04: O sistema exibe as evidências levantadas pela IA, incluindo:

- Fonte original do conteúdo
- Elementos de linguagem suspeita
- Comparações com o banco de dados de desinformações

FB05: O moderador realiza investigações adicionais, utilizando:

- Fontes externas confiáveis (ex: agências de checagem, base jornalística)
- Ferramentas internas (ex: verificador de imagens e vídeos)

FB06: O moderador preenche um relatório de análise manual contendo: (FA01)(RN03)

- Classificação do conteúdo (Confiável, Enganoso, Parcialmente verdadeiro, Indeterminado)
- Justificativa da decisão
- Referências utilizadas

FB07: O sistema salva o relatório, envia notificação ao usuário que reportou o conteúdo e atualiza o banco de dados do Verify. (RN04)

## 3. Fluxos Alternativos

### FA01: Relatório Requer Informações Adicionais (FB06)

FA01.1: O moderador preenche o relatório de análise manual, mas o sistema identifica a necessidade de informações adicionais (ex: campos obrigatórios não preenchidos, referências inválidas).

FA01.2: O sistema exibe uma mensagem de erro indicando as informações faltantes ou inválidas.

FA01.3: O moderador corrige as informações e tenta salvar o relatório novamente.

## 4. Fluxos de Exceção

### FE01: Conteúdo Não Encontrado

FE01.1: O moderador seleciona um conteúdo para revisão, mas o sistema não consegue localizar o conteúdo no banco de dados.

FE01.2: O sistema exibe uma mensagem de erro informando que o conteúdo não foi encontrado.

FE01.3: O moderador pode optar por retornar à lista de conteúdos sinalizados ou iniciar uma nova busca.

## 5. Pré-Condições

- O moderador deve estar logado no sistema Verify.

## 6. Pós-Condições

- O relatório de análise manual é salvo no sistema.
- O usuário que reportou o conteúdo é notificado.
- O banco de dados do Verify é atualizado com a classificação do conteúdo.

## 7. Pontos de Extensão

- **Ponto de Extensão 1: Integração com Novas Fontes de Verificação**
- **Localização:** Passo 5 do Fluxo Básico (O moderador realiza investigações adicionais).
- **Descrição:** Permite a integração de novas ferramentas ou bases de dados externas para auxiliar na investigação do moderador, sem alterar o fluxo principal.
- **Ponto de Extensão 2: Geração Automática de Relatório Parcial**
- **Localização:** Passo 6 do Fluxo Básico (O moderador preenche um relatório de análise manual).
- **Descrição:** Possibilita que o sistema pré-preencha partes do relatório com base nas evidências da IA, agilizando o processo para o moderador.

## 8. Requisitos Especiais

- **RE01: Desempenho:** O sistema deve ser capaz de processar e exibir listas de conteúdos sinalizados e relatórios de análise em tempo real, garantindo uma resposta rápida para o moderador.
- **RE02: Segurança:** O acesso ao painel de controle do moderador e às ferramentas de análise avançadas deve ser restrito e protegido por autenticação robusta.
- **RE03: Usabilidade:** A interface do usuário para o preenchimento do relatório de análise manual deve ser intuitiva e de fácil utilização, minimizando erros e agilizando o processo.
- **RE04: Integração:** O sistema deve ser capaz de integrar-se com fontes externas confiáveis (ex: APIs de agências de checagem) para consulta de informações durante a investigação.
- **RE05: Escalabilidade:** O sistema deve ser capaz de lidar com um volume crescente de conteúdos sinalizados e usuários, mantendo a performance e a disponibilidade.

## 9. Informações Adicionais

- **Contexto do Sistema:** O "Verify" é uma plataforma digital criada para combater a desinformação, utilizando inteligência artificial, redes colaborativas e ferramentas de verificação. Ele visa identificar e mitigar a propagação de informações falsas, capacitando usuários, organizações e moderadores.
- **Objetivos de Negócio:**
- Promover um ecossistema digital mais confiável e seguro, reduzindo a disseminação de desinformação.
- Detectar e sinalizar desinformação com eficiência.
- Facilitar a educação digital.
- Incentivar a colaboração no combate à desinformação.
- Fornecer relatórios estratégicos sobre padrões de desinformação.
- Expandir integrações com plataformas digitais.
- **Objetivos do Aplicativo:**
- Verificação automática e manual de conteúdos.
- Monitoramento em tempo real.
- Apoio à educação e conscientização.
- Funcionalidade offline.
- Gamificação e engajamento.
- Integração com assistentes virtuais.
- Relatórios de impacto.
- **Processo de Negócio para Moderadores:** O fluxo de trabalho dos moderadores começa com a notificação de conteúdos sinalizados pela IA. Eles utilizam ferramentas avançadas para análise detalhada, incluindo acesso a bases de dados confiáveis e ferramentas para análise de imagens e vídeos. Após a revisão, geram um relatório detalhado classificando o conteúdo e contribuem para o banco de dados do "Verify" com novos padrões de desinformação.

## 10. Regras de Negócio

### RN01: Exibição de Conteúdos Sinalizados

- A lista de conteúdos sinalizados pela IA deve exibir as seguintes informações para cada item:
- Título do conteúdo
- Data de sinalização
- Nível de suspeita (alto, médio, baixo)
- Status da análise (pendente, em análise, concluída)

### RN02: Detalhes do Conteúdo para Revisão

- Ao selecionar um conteúdo para revisão, o sistema deve exibir as seguintes evidências levantadas pela IA:
- Fonte original do conteúdo (URL ou identificador)
- Trechos de linguagem suspeita destacados
- Comparações com o banco de dados de desinformações (links para itens relacionados)

### RN03: Relatório de Análise Manual

- O relatório de análise manual deve conter os seguintes campos obrigatórios:
- Classificação do conteúdo (Confiável, Enganoso, Parcialmente verdadeiro, Indeterminado)
- Justificativa da decisão (campo de texto livre)
- Referências utilizadas (lista de URLs ou descrições)

### RN04: Notificação ao Usuário

- Após a conclusão da análise, o sistema deve enviar uma notificação ao usuário que reportou o conteúdo, informando a classificação final e um link para o relatório de análise.

