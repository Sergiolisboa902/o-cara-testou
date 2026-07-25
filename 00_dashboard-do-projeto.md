# DASHBOARD DO PROJETO — O CARA TESTOU

> **Documento maestro.** Visão central de tudo: equipe, entregas, status e histórico.
> Este MD é vivo — atualizado a cada avanço do projeto.

**Ultima atualizacao:** 23/07/2026
**Sprint atual:** Matriz de 200 roteiros de vendas (V001-V100 + R001-R100)
**Proximo marco:** Integracao Supabase + Segundo produto do catalogo

---

## 1. STATUS GERAL DO PROJETO

| Pilar | Status | Progresso |
|---|---|---|
| Brand Bible (8 fases) | Concluido | 100% |
| Base de Conhecimento (4 docs) | Concluido | 100% |
| Diretrizes TikTok | Concluido | 100% |
| Briefing Designer | Concluido | 100% |
| Catalogo Produtos | 1 produto catalogado | 100% |
| Sistema de Agentes (A1-A10) | 3 pilares definidos | 100% |
| Roteiros Produto #1 (A1-A10) | 10 roteiros de linha editorial | 90% (A8 bloqueado) |
| Roteiros Vendas (Classico 7 etapas) | 100 roteiros V001-V100 (60s) | 100% |
| Roteiros Vendas (Rapido 6 etapas) | 100 roteiros R001-R100 (45s) com tom da marca | 100% |
| PDFs consolidados | 2 HTMLs para exportar como PDF | 100% |
| Site HTML estatico | Em pasta html/ com redirect | 100% |
| Integracao Supabase | Pendente — proximo sprint | 0% |

---

## 2. ARQUITETURA DOS DOCUMENTOS

```
/
├── index.html                    (Redirect → html/index.html)
├── 00_dashboard-do-projeto.md    (Voce esta aqui — o maestro)
├── build-html.ps1                (Gera .html em html/ a partir dos .md na raiz)
├── build-roteiros.ps1            (Gera scripts .html em html/.../roteiros/)
│
├── brand-bible/  (A CONSTITUICAO — o que somos)
│     ├── fase-01-dna-estrategico.md
│     ├── fase-02-identidade-verbal.md
│     ├── fase-03-identidade-visual.md
│     ├── fase-04-guia-de-conteudo.md
│     ├── fase-05-sistema-avaliacao.md
│     ├── fase-06-identidade-apresentador.md
│     ├── fase-07-estrategia-crescimento.md
│     ├── fase-08-manual-da-marca.md
│     └── briefing-designer-completo.md + briefing-sistema-avaliacao-visual.md
│
├── base-de-conhecimento/
│     ├── 01_base_de_conhecimento.md
│     ├── 02_manual_operacional.md
│     ├── 03_prompt_mestre.md
│     └── 04_diretrizes-tiktok.md
│
├── agentes/
│     ├── 00-sistema-de-agentes.md     (Documentacao central — 3 pilares)
│     ├── A1-review-classico.md  a  A8-depois-de-meses.md  (Linha Editorial)
│     ├── A9-vendas.md                                     (Conteudo de Vendas)
│     └── A10-lives.md                                     (Conteudo de Lives)
│
├── produtos/
│     ├── catalogo.json               (Base de dados de produtos)
│     ├── _modelo-produto.md          (Template para novos produtos)
│     └── cysedoya-jump-starter-compressor/  (Produto #1)
│           ├── produto.md            (Info preenchida pelo usuario)
│           ├── fotos/                (Imagens do produto)
│           └── video/                (Videos do produto)
│
├── inspiracao/
│     ├── Perfil.png
│     ├── Perfil Antiga.png
│     ├── Cenario Principal.png
│     ├── Modelos de Cenario.png
│     └── profile-logo-spec.json
│
└── html/  (Site estatico completo — funciona file://)
      ├── index.html                  (Dashboard principal)
      ├── 00_dashboard-do-projeto.html
      ├── viewer.html                 (Visualizador de JSON/Raw)
      ├── agentes/                    (Paginas dos agentes)
      ├── brand-bible/                (Paginas da brand bible)
      ├── base-de-conhecimento/       (Paginas da base de conhecimento)
      ├── inspiracao/                 (Redirect para ../inspiracao/ — nao usado)
      └── produtos/
            ├── catalogo.html         (Lista de produtos — ex-produtos/index.html)
            └── cysedoya-jump-starter-compressor/
                  ├── produto.html     (Pagina do produto — ex-index.html)
                  ├── conteudo/
                  │     └── conteudo.html  (3 pilares — ex-index.html)
                  └── roteiros/
                        ├── roteiros.html  (Lista de scripts — ex-index.html)
                        ├── 01-A1-review-classico.html
                        ├── 02-A2-dica-rapida.html
                        ├── ...
                        └── 10-A10-lives.html
```

### Fluxo de navegacao no site

```
Dashboard (html/index.html)
    │
    ├── Catalogo (html/produtos/catalogo.html)
    │       └── Produto (html/.../produto.html)
    │               ├── Conteudo (html/.../conteudo/conteudo.html)
    │               │       ├── Roteiro A1 (html/.../roteiros/01-A1-...html)
    │               │       ├── Roteiro A2 (html/.../roteiros/02-A2-...html)
    │               │       └── ...
    │               └── Roteiros (html/.../roteiros/roteiros.html)
    │
    ├── Brand Bible (html/brand-bible/fase-01-...html)
    ├── Base de Conhecimento (html/base-de-conhecimento/...)
    └── Agentes (html/agentes/00-sistema-de-agentes.html)
```

---

## 3. EQUIPE DE ESPECIALISTAS

### 3.1 Especialistas Alocados

| # | Especialista | Expertise | Entregues | Status |
|---|---|---|---|---|
| E1 | **Brand Strategist** | DNA da marca, posicionamento, arquétipos, território | `fase-01-dna-estrategico.md` | Concluído |
| E2 | **Chief Copywriter** | Tom de voz, manifesto, bordões, vocabulário, CTAs | `fase-02-identidade-verbal.md` | Concluído |
| E3 | **Creative Director** | Identidade visual, paleta, tipografia, thumbnails, elementos gráficos | `fase-03-identidade-visual.md` + `briefing-designer-completo.md` + `briefing-sistema-avaliacao-visual.md` | Concluído |
| E4 | **Video & Content Strategist** | Formatos de vídeo, estruturas, quadros fixos, cinematografia | `fase-04-guia-de-conteudo.md` | Concluído |
| E5 | **Product Review Architect** | Sistema de avaliação, PVR, Medidor de Respeito, selos | `fase-05-sistema-avaliacao.md` | Concluído |
| E6 | **Talent & Presenter Coach** | Perfil do apresentador, vestuário, fala, linguagem corporal | `fase-06-identidade-apresentador.md` | Concluído |
| E7 | **Growth & Community Strategist** | Crescimento, comunidade, monetização, viralização | `fase-07-estrategia-crescimento.md` | Concluído |
| E8 | **Brand Manual Editor** | Consolidação, checklists, crise, parcerias, evolução | `fase-08-manual-da-marca.md` | Concluído |
| E9 | **Estrategista de Conhecimento** | Psicologia do consumidor, algoritmo TikTok, persuasão | `base-de-conhecimento/01_base_de_conhecimento.md` | Concluído |
| E10 | **Especialista em Produção** | Execução de conteúdo, gravação, edição, roteiros | `base-de-conhecimento/02_manual_operacional.md` | Concluído |
| E11 | **Arquiteto de IA** | System prompts, instruções para IA, governança | `base-de-conhecimento/03_prompt_mestre.md` | Concluído |
| E12 | **Roteirista** | Escrever scripts prontos para gravação | 10 roteiros gerados para Produto #1 | Concluído |

### 3.2 Especialistas Disponiveis para Proximas Fases

| # | Especialista | Expertise | Quando acionar |
|---|---|---|---|
| E13 | **Motion Designer** | Animações, lower thirds, selos animados | Após aprovação do briefing visual |
| E14 | **Social Media Strategist** | Calendário editorial, agendamento, métricas | Fase de operação |
| E15 | **Video Editor** | Edição dos primeiros vídeos no padrão da marca | Fase de produção |
| E16 | **Analista de Performance** | Métricas, otimização de algoritmo, testes A/B | Fase de operação |
| E17 | **Especialista em TikTok Shop** | Configuração de loja, catálogo, checkout | Fase de monetização |

---

## 4. FASES DO PROJETO

### Fase 1 — Fundacao (Concluído)
**O que é:** Criação da Brand Bible completa (8 fases)
**Entregues:** Todos os documentos em `brand-bible/`
**Especialistas:** E1 a E8

### Fase 2 — Inteligencia (Concluído)
**O que é:** Base de conhecimento, manual operacional, prompt mestre e diretrizes TikTok
**Entregues:** `base-de-conhecimento/` (4 documentos)
**Especialistas:** E9, E10, E11

### Fase 3 — Identidade Visual (Concluído)
**O que é:** Briefing consolidado para designer + spec visual do perfil
**Entregues:** `briefing-designer-completo.md`, `briefing-sistema-avaliacao-visual.md`, `profile-logo-spec.json`
**Especialistas:** E3

### Fase 4 — Producao de Conteudo (Em andamento)
**O que é:** Criação de agentes, roteiros e sistema de 3 pilares
**Entregues:** 10 agentes (A1-A10), 10 roteiros para Produto #1, site HTML estático
**Especialistas:** E12
**Bloqueado:** A8 (Depois de Meses) — requer uso real do produto por meses

### Fase 5 — Operacao e Crescimento (Futuro)
**O que é:** Publicação, comunidade, métricas, otimização
**Especialistas:** E14, E16

### Fase 6 — Monetizacao (Futuro)
**O que é:** TikTok Shop, afiliados, patrocínios, produtos próprios
**Especialistas:** E17

---

## 5. SPRINT ATUAL

### Sprint 002 — Produto #1 + Infraestrutura

| Item | Responsavel | Status |
|---|---|---|
| Agente A9 (Conteudo de Vendas) — template + script | Roteirista (E12) | Concluído |
| Agente A10 (Conteudo de Lives) — template + script | Roteirista (E12) | Concluído |
| Sistema de 3 pilares (Editorial, Vendas, Lives) | Coordenador | Concluído |
| Pagina de Conteudo (3 pilares) | Coordenador | Concluído |
| 10 scripts gerados para Produto #1 | Roteirista (E12) | Concluído |
| A8 — Depois de Meses | Roteirista (E12) | Bloqueado (aguardando meses reais) |
| Move todos HTML para pasta html/ | Coordenador | Concluído |
| Renomeia index.html → catalogo, produto, conteudo, roteiros | Coordenador | Concluído |
| Corrige links relativos entre paginas | Coordenador | Concluído |
| Reordena dashboard (INSPIRACAO + CATALOGO no topo) | Coordenador | Concluído |
| Root index.html vira redirect | Coordenador | Concluído |
| Build scripts atualizados | Coordenador | Concluído |

### Proximo Sprint — Segundo Produto

| Item | Responsavel | Status |
|---|---|---|
| Novo link de produto da vitrine | Usuario | Pendente |
| Catalogar no catalogo.json | Coordenador | Pendente |
| Criar produto.md | Usuario | Pendente |
| Gerar 10 scripts via build | Coordenador | Pendente |

---

## 6. DECISOES E HISTORICO DE AVANCOS

### 23/07/2026 — Infraestrutura Final: html/, Renomeacoes, Links

- Todos os arquivos .html movidos para pasta `html/` (root index.html vira redirect via meta refresh)
- Arquivos de recurso (imagens, JSON, MD) permanecem na raiz
- `produtos/index.html` renomeado para `produtos/catalogo.html`
- `cysedoya-jump-starter-compressor/index.html` renomeado para `.../produto.html`
- `.../conteudo/index.html` renomeado para `.../conteudo/conteudo.html`
- `.../roteiros/index.html` renomeado para `.../roteiros/roteiros.html`
- Dashboard reordenado: REFERENCIAS VISUAIS e CATALOGO DE PRODUTOS como 1a e 2a secoes
- Corrigidos links relativos quebrados em profundidades diferentes (../ index.html)
- Build scripts atualizados para ler .md da raiz e gerar .html em html/
- Dashboard link de catalogo corrigido (apontava para ../produtos/catalogo.html com ../ extra)
- Pagina de produto, conteudo e roteiros tiveram links de navegacao corrigidos

### 23/07/2026 — Sistema de Agentes Expandido (3 Pilares)

- Agentes expandidos de A1-A8 para A1-A10 com 3 pilares de conteudo:
  - **Linha Editorial** (A1 a A8): Review Classico, Dica Rapida, Comparativo, Unboxing, Custo-Beneficio, Hack, Responde Comentarios, Depois de Meses
  - **Conteudo de Vendas** (A9): Estrutura oficial de 7 etapas (GANCHO → PROBLEMA → PROMESSA → TESTE → TRANSFORMACAO → VEREDITO → CTA)
  - **Conteudo de Lives** (A10): Formato de loop ao vivo ~10min com carrinho TikTok Shop
- Templates criados em `agentes/00-sistema-de-agentes.md`, `A9-vendas.md`, `A10-lives.md`
- A5 revisado: precos fixos removidos (preco muda rapido), usa "confira na vitrine"
- Pagina de Conteudo criada em `.../conteudo/` com os 3 pilares e links para roteiros

### 23/07/2026 — Roteiros do Produto #1

- 10 scripts gerados para Cysedoya Arrancador de Bateria c/ Compressor Q18B
- Roteiros salvos em `produtos/cysedoya-jump-starter-compressor/roteiros/`
- Roteiros incluem: tabela cena-a-cena (tempo, audio, texto na tela), observacoes de producao e timeline visual
- A8 (Depois de Meses) criado mas bloqueado — requer meses reais de uso antes de gravar

### 23/07/2026 — Catalogo de Produtos

- Criada estrutura `produtos/` com `catalogo.json`, `_modelo-produto.md`
- Primeiro produto catalogado: Cysedoya Jump Starter c/ Compressor Q18B (ID: 1735865952300860739)
- Pagina individual com especificacoes, diferenciais e status
- Catalogo indexado com grid de cards e contadores via JSON embutido
- Link adicionado ao dashboard

### 23/07/2026 — Diretrizes TikTok

- Criacao do documento `04_diretrizes-tiktok.md` com regras completas do TikTok
- Abrange Community Guidelines, LIVE Monetization e TikTok Shop Brasil
- Checklist de conformidade para cada tipo de conteudo

### 23/07/2026 — Consolidacao da Base de Conhecimento

- Briefing para designer consolidado a partir das Fases 03, 05 e 08
- Criacao da base de conhecimento com fundamentos de psicologia e algoritmo
- Criacao do manual operacional com processos de execucao
- Criacao do prompt mestre para governanca de IA

### 23/07/2026 — Inspiracoes e Spec Visual

- Analise do JSON de profile picture do cliente vs. brand bible
- Ajustes: camisa vermelha → preta, hex #F4C21D → #FFC20E oficial
- JSON corrigido salvo em `inspiracao/profile-logo-spec.json`
- 3 imagens de referencia adicionadas ao site (perfil, estudio, selo)
- Secao "Referencias Visuais" criada no dashboard com zoom modal

### 23/07/2026 — Revisao Estrutural de Todos os Documentos

- Cabecalhos, TOCs, cross-references e rodapes de navegacao adicionados
- Encoding e acentos corrigidos nos documentos gerados por agentes
- Link quebrado corrigido (Fase 06 → Fase 02)

### 23/07/2026 — Criacao do Projeto

- Brand Bible completa (8 fases) criada
- DNA definido: arquétipos Cara Comum + Sábio = "Amigo Especialista"
- Identidade visual: Preto Asfalto + Amarelo Máquina
- Sistema PVR (Protocolo da Vida Real) e Medidor de Respeito (4 níveis)
- Estratégia de crescimento em 3 fases

---

## 7. PROXIMOS PASSOS

Aguardando definicao do cliente:

- [ ] Enviar link do **segundo produto** da vitrine TikTok
- [ ] Catalogar no `catalogo.json`
- [ ] Preencher `produto.md` com dados do produto
- [ ] Rodar `build-roteiros.ps1` para gerar 10 scripts
- [ ] Execucao do briefing visual com designer
- [ ] Definicao de cronograma de gravacao
- [ ] Estruturacao de perfis nas redes sociais
- [ ] Plano de lancamento 0-6 meses

---

## 8. GLOSSARIO DO PROJETO

| Sigla | Significado |
|---|---|
| **PVR** | Protocolo da Vida Real — método de teste em 4 fases |
| **CTA** | Call to Action — chamada para ação |
| **EDC** | Everyday Carry — itens de uso diário |
| **LIXO CARO** | Nível 1 do Medidor de Respeito — produto reprovado |
| **MONSTRO** | Nível 4 do Medidor de Respeito — produto excepcional |
| **A1-A8** | Agentes da Linha Editorial (conteúdo orgânico) |
| **A9** | Agente de Conteúdo de Vendas (estrutura oficial 7 etapas) |
| **A10** | Agente de Conteúdo de Lives (formato loop ao vivo) |

---

*Este documento é atualizado a cada novo avanço do projeto. Próxima revisão: após próximo produto do catálogo.*
