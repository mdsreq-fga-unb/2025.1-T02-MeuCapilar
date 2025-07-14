# Verify – Combate à Desinformação  
**Especificação de Caso de Uso:** Supervisionar interações entre atores  
**Versão:** 1.0  
**Autor:** Pedro Luciano de Azevedo - 212005453  
**Data:** 07/07/2025  
**Identificador:** UC-09-Supervisao  

---

## Histórico da Revisão

| Data       | Versão | Descrição             | Autor             |
|------------|--------|------------------------|-------------------|
| 10/07/2025 | 1.1    | Criação do Documento   | Pedro Luciano     |

---

## Índice

1. [Breve Descrição](#1-breve-descricao)
2. [Fluxo Básico de Eventos](#2-fluxo-basico-de-eventos)
3. [Fluxos Alternativos](#3-fluxos-alternativos)
4. [Fluxos de Exceção](#4-fluxos-de-excecao)
5. [Pré-Condições](#5-pre-condicoes)
6. [Pós-Condições](#6-pos-condicoes)
7. [Pontos de Extensão](#7-pontos-de-extensao)
8. [Requisitos Especiais](#8-requisitos-especiais)
9. [Informações Adicionais](#9-informacoes-adicionais)

---

## 1. Breve Descrição

Este caso de uso descreve as ações realizadas pelos administradores, a partir do painel de administração, para supervisionar as interações entre usuários, moderadores e organizações parceiras, garantindo fluidez, transparência e qualidade nas informações.  
Quando necessário, os administradores ajustam parâmetros nos algoritmos de inteligência artificial, incorporando novos dados e critérios de análise, como identificação de padrões emergentes de desinformação.

---

## 2. Fluxo Básico de Eventos

1. O administrador acessa o painel de administração.  
2. O sistema exibe a interface com as seções de interações entre usuários, moderadores e organizações parceiras.  
3. O administrador seleciona uma das seções para visualização detalhada.  
4. O sistema exibe uma listagem com colunas: tipo de interação, usuários envolvidos, data/hora, status (normal, sinalizada), e canal (plataforma, parceiro, etc.).  
5. O administrador aplica filtros por período, tipo de interação, status e canal.  
6. O sistema exibe os resultados filtrados.  
7. O administrador identifica um padrão suspeito de desinformação (ex: reutilização de imagens).  
8. O administrador acessa a seção de ajustes do algoritmo.  
9. O sistema apresenta um formulário com os campos: Tipo de conteúdo, Critério de verificação, Exemplo de dado, Peso na priorização.  
10. O administrador preenche os campos com os novos critérios e envia.  
11. O sistema salva os ajustes e atualiza os parâmetros do algoritmo.  
12. O administrador retorna à seção de supervisão.

---

## 3. Fluxos Alternativos

### 3.1 Visualização sem aplicação de filtros

**A1 – Visualizar interações sem aplicar filtros**  
No passo 5 do fluxo básico, se o administrador optar por não aplicar filtros:

- O sistema exibe todos os registros de interação disponíveis, por ordem decrescente de data/hora.

---

## 4. Fluxos de Exceção

### 4.1 FE1 – Falha na atualização dos parâmetros do algoritmo  
No passo 11 do fluxo básico:

- Se ocorrer erro de validação dos dados ou falha no backend, o sistema exibe mensagem:  
  **"Erro ao atualizar parâmetros. Tente novamente."**
- O sistema mantém os dados preenchidos no formulário para correção.
- O fluxo retorna ao passo 9.

### 4.2 FE2 – Sessão expirada  
Em qualquer passo do fluxo:

- Se a sessão do administrador tiver expirado, o sistema redireciona para a tela de login com a mensagem:  
  **"Sessão expirada. Faça login novamente."**
- Após novo login, o administrador pode retomar a supervisão.

---

## 5. Pré-Condições

- O administrador deve estar autenticado no sistema e com permissão de acesso ao painel de administração.

---

## 6. Pós-Condições

- Os novos critérios de análise do algoritmo estão salvos e ativos.  
- As interações supervisionadas ficam registradas com seus respectivos status.

---

## 7. Pontos de Extensão

### 7.1 Ext-01: Emitir relatório de interações  
**Local:** Após o passo 6 do fluxo básico.  
**Descrição:** O administrador pode optar por gerar um relatório em PDF com os dados filtrados.  
**Extensão:** Caso de uso UC-11 – Emitir relatório de supervisão.

### 7.2 Ext-02: Detalhar interação  
**Local:** Após o passo 4 ou 6 do fluxo básico.  
**Descrição:** Ao clicar em uma interação específica, o sistema redireciona para o caso de uso UC-10 – Visualizar detalhe da interação.

---

## 8. Requisitos Especiais

- Tempo máximo de resposta para carregamento das listagens: **3 segundos**  
- Compatível com acessibilidade (WCAG 2.1)  
- Os ajustes no algoritmo devem ser logados com identificação do usuário e timestamp

---

## 9. Informações Adicionais

- As interações supervisionadas podem ter origem em diferentes canais, como redes sociais, parceiros institucionais e verificadores de fatos.  
- Os parâmetros do algoritmo são armazenados em estrutura JSON versionada.

---

© Pedro Luciano - 212005453, 2025
