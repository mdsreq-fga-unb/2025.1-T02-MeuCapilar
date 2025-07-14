# Verify – Combate à Desinformação  

## Especificação de Caso de Uso: **Auditar Conteúdos**  

## Versão 1.0  

### Histórico da Revisão  

| Data       | Versão | Descrição                       | Autor      |
|------------|--------|---------------------------------|------------|
| 11/Jul/2025 | 1.0    | Criação inicial da especificação. | Cauã |
| 13/Jul/2025 | 1.1    | Melhorias com base no feedback. | Cauã |

### Índice  

1. Breve Descrição  
2. Fluxo Básico de Eventos  
3. Fluxos Alternativos  
4. Fluxos de Exceção  
5. Pré-Condições  
6. Pós-Condições  
7. Pontos de Extensão  
8. Requisitos Especiais  
9. Informações Adicionais  
10. Regras de Negócio  

* * *

## 1. Breve Descrição  
Este caso de uso descreve como uma **Organização Parceira** audita, registra e publica avaliações detalhadas sobre conteúdos suspeitos, garantindo rastreabilidade e identificação de padrões de desinformação.

---

## 2. Fluxo Básico de Eventos  

FB01: A Organização Parceira acessa o módulo “Auditar Conteúdos”. (RN01)  
FB02: O sistema exibe lista de itens auditáveis com filtros padrão. (RN01)  
FB03: O ator aplica filtros ou ordenações se desejar. (FA01)  
FB04: O ator seleciona um item para auditoria. (RN02) (FE01)  
FB05: O sistema mostra o conteúdo, metadados e histórico de verificações.  
FB06: O ator preenche o formulário de auditoria (classificação, severidade, evidências). (FA02)  
FB07: O ator conclui a auditoria. (RN03) (FE02)  
FB08: O sistema registra o hash, atualiza status para “Auditado” e notifica Moderadores. (RN04)  
FB09: O sistema confirma sucesso e retorna à lista destacando o item auditado.  

---

## 3. Fluxos Alternativos  

### FA01: Filtro Avançado (FB02)  
FA01.1 – O ator escolhe “Filtro Avançado” e define critérios (fonte, idioma, data).  
FA01.2 – O sistema exibe lista filtrada. Retorna ao FB03.

### FA02: Retomar Auditoria em Andamento (FB06)  
FA02.1 – O item possui rascunho salvo.  
FA02.2 – O sistema carrega dados parciais; o ator revisa e continua no FB06.

### FA03: Escalar para Moderador (FB07)  
FA03.1 – O ator marca “Necessita revisão do Moderador”.  
FA03.2 – O sistema grava auditoria parcial, notifica Moderador e encerra o caso atual.

---

## 4. Fluxos de Exceção  

### FE01: Conteúdo Removido Antes da Auditoria (FB04)  
FE01.1 – O sistema não localiza o conteúdo.  
FE01.2 – Exibe aviso, registra log e retorna ao FB02.

### FE02: Falha ao Salvar Auditoria (FB07)  
FE02.1 – Erro de rede/banco de dados.  
FE02.2 – O sistema exibe mensagem e permite “Tentar Novamente” ou “Salvar Rascunho”.

### FE03: Sessão Expirada (em qualquer passo)  
FE03.1 – O sistema redireciona para login, mantendo rascunho temporário.

---

## 5. Pré-Condições  

* OP autenticada com papel **Auditor**.  
* Módulo avançado de verificação habilitado.

---

## 6. Pós-Condições  

* Auditoria salva com hash SHA-256 e carimbo de tempo (RFC 3161).  
* Painéis e APIs públicas refletindo status “Auditado”.  

---

## 7. Pontos de Extensão  

| Ponto | Local     | Descrição                                                                    |
|-------|-----------|------------------------------------------------------------------------------|
| PE01  | FB05      | **Consultar Histórico de Verificações** (*include*)                          |
| PE02  | Pós FB08  | **Receber Tendências** (*extend*, processamento em lote)                      |

---

## 8. Requisitos Especiais  

* **RE01** – Integridade: hash e timestamp para cada registro.  
* **RE02** – Uploads de evidência até 25 MB (PDF, PNG, MP4).  
* **RE03** – Resposta de FB06 → FB08 ≤ 5 s para 95 % dos casos.  
* **RE04** – Exposição mínima de dados pessoais em conformidade com LGPD.  

---

## 9. Informações Adicionais  

### 9.1 Objetivos de Negócio  
* **BN-01 – Aumento da Credibilidade Pública**  
  * Disponibilizar relatórios de auditoria que fortaleçam a confiança dos usuários finais.  
* **BN-02 – Redução do Tempo de Resposta**  
  * Diminuir o intervalo entre a sinalização do conteúdo e a publicação do parecer final.  
* **BN-03 – Conformidade Regulatória**  
  * Atender aos requisitos da Lei nº 14 192/2021 (combate à desinformação) e da LGPD.  

### 9.2 Artefatos de UX  
| Artefato                     | Localização                                     | Status |
|------------------------------|-------------------------------------------------|--------|
| Wireframe da tela de auditoria | `/docs/wireframes/auditoria/audit_screen.png` | Final |
| Protótipo interativo (Figma) | link privado compartilhado com equipe UX        | Beta  |
| Checklist de usabilidade     | `/docs/ux/checklists/auditoria_v1.md`           | Draft |

### 9.3 Riscos Identificados  
* **R01 – Sobrecarga no Serviço de Hashing**  
  * Plano de contingência: cache local + reprocessamento assíncrono.  
* **R02 – Mudanças na Legislação**  
  * Revisão jurídica semestral; cláusula de atualização contratual.  

### 9.4 Observações Finais  
* Este caso de uso complementa **“Analisar Conteúdo Manualmente”** (para Moderadores) e **“Monitorar Padrões de Desinformação”** (para Administradores).  

---

## 10. Regras de Negócio  

| Código | Regra                                                                                          |
|--------|------------------------------------------------------------------------------------------------|
| **RN01** | Exibição de itens auditáveis restrita a OP com contrato ativo.                                |
| **RN02** | Filtros avançados aceitam fonte, idioma e faixa de data.                                      |
| **RN03** | Auditoria só é **Final** após preenchimento completo e confirmação.                           |
| **RN04** | Cada nova auditoria substitui a anterior no cálculo de reputação.                             |

---
