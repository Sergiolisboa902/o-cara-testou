# DASHBOARD DO PROJETO — O CARA TESTOU

> **Documento maestro.** Visão central de tudo: equipe, entregas, status e histórico.
> Este MD é vivo — atualizado a cada avanço do projeto.

**Ultima atualizacao:** 28/07/2026
**Sprint atual:** App Dinamico (Supabase + Google Calendar + Upload)
**Proximo marco:** Segundo produto do catalogo + Inicio das gravacoes

---

## 1. STATUS GERAL DO PROJETO

| Pilar | Status | Progresso |
|---|---|---|---|
| Brand Bible (8 fases) | Concluido | 100% |
| Base de Conhecimento (4 docs) | Concluido | 100% |
| Diretrizes TikTok | Concluido | 100% |
| Briefing Designer | Concluido | 100% |
| Catalogo Produtos | 1 produto catalogado | 100% |
| Sistema de Agentes (A1-A10) | 3 pilares definidos | 100% |
| Roteiros Produto #1 (A1-A10) | 10 roteiros de linha editorial | 90% (A8 bloqueado) |
| Roteiros Vendas (Classico 7 etapas) | 100 roteiros V001-V100 (60s) | 100% |
| Roteiros Vendas (Rapido 6 etapas) | 100 roteiros R001-R100 (45s) com tom da marca | 100% |
| Estrategia de Video | 20 modelos + 8 familias + grade 24h | 100% |
| App Supabase (Auth + CRUD) | Login, produtos, roteiros, edicao | 100% |
| Google Calendar | Agendamento de roteiros via OAuth | 100% |
| Upload de Fotos | Storage Supabase + coluna foto nos produtos | 100% |
| Site HTML estatico | Deploy Vercel (o-cara-testou.vercel.app) | 100% |
| Cleanup | 253 arquivos orfaos removidos | 100% |

---

## 2. ARQUITETURA DOS DOCUMENTOS

```
/
├── 00_dashboard-do-projeto.md    (Voce esta aqui — o maestro)
├── estrategia-de-video.md        (20 modelos + 8 familias + grade 24h)
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
│     ├── _modelo-produto.md          (Template para novos produtos)
│     └── cysedoya-jump-starter-compressor/  (Produto #1)
│           ├── produto.md
│           ├── testes/               (100 roteiros V001-V100 + R001-R100)
│           └── fotos/
│
└── html/  (Site estatico — public root do Vercel)
      ├── index.html                  (Landing page com nav + docs)
      ├── supabase.js                 (CRUD — auth, products, scripts, storage)
      ├── config.js                   (Supabase URL + anon key)
      ├── google-calendar.js          (Google OAuth + Calendar API)
      ├── doc-viewer.html             (Visualizador de .md com nav + Voltar)
      ├── produtos.html               (App Supabase — gerenciar produtos)
      ├── modelo-conteudo.html        (App Supabase — montar roteiro)
      ├── roteiros-criados.html       (App Supabase — roteiros salvos + agendar)
      ├── 00_dashboard-do-projeto.md  (copia para web)
      ├── estrategia-de-video.md      (copia para web)
      ├── brand-bible/                (documentos .md para web)
      ├── base-de-conhecimento/       (documentos .md para web)
      ├── agentes/                    (documentos .md para web)
      └── produtos/                   (documentos .md para web)
```

### Fluxo de navegacao no site

```
Landing Page (html/index.html)
    │
    ├── MODELO (html/modelo-conteudo.html)     — Montar roteiro
    ├── PRODUTOS (html/produtos.html)           — Gerenciar produtos
    ├── CONTEUDOS (html/roteiros-criados.html)  — Roteiros salvos + Agendar
    └── Documentos (via doc-viewer.html)        — .md com nav e Voltar
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
**O que é:** Criacao de agentes, roteiros e sistema de 3 pilares
**Entregues:** 10 agentes (A1-A10), 10 roteiros para Produto #1, app Supabase
**Especialistas:** E12
**Bloqueado:** A8 (Depois de Meses) — requer uso real do produto por meses

### Fase 5 — App e Automacao (Concluido)
**O que é:** Migracao para Supabase, deploy Vercel, funcionalidades do app
**Entregues:** Auth, CRUD, upload de fotos, Google Calendar, estrategia de video, cleanup

### Fase 6 — Operacao e Crescimento (Futuro)
**O que é:** Publicacao, comunidade, metricas, otimizacao
**Especialistas:** E14, E16

### Fase 7 — Monetizacao (Futuro)
**O que é:** TikTok Shop, afiliados, patrocinios, produtos proprios
**Especialistas:** E17

---

## 5. SPRINT ATUAL

### Sprint 003 — App Funcional + Estrategia de Video

| Item | Responsavel | Status |
|---|---|---|
| Google Calendar Integration (OAuth + agendar) | Coordenador | Concluido |
| Upload de fotos (Supabase Storage + coluna foto) | Coordenador | Concluido |
| Cleanup de 253 arquivos orfaos | Coordenador | Concluido |
| Estrategia de Video (20 modelos + 8 familias + grade 24h) | Especialista IA | Concluido |
| Doc-viewer com navegacao e Voltar | Coordenador | Concluido |
| Landing page (index.html com hero + nav + docs) | Coordenador | Concluido |
| Docs copiados para html/ (acessiveis via web) | Coordenador | Concluido |
| Documentacao atualizada (dashboard + index links) | Coordenador | Concluido |

### Proximo Sprint — Segundo Produto + Operacao

| Item | Responsavel | Status |
|---|---|---|
| Executar INSERT do Arrancador Q18B no Supabase | Usuario | Pendente |
| Testar upload de foto em produto existente | Usuario | Pendente |
| Iniciar gravacao dos primeiros videos | Usuario | Pendente |
| Definir cronograma de postagem (24/dia) | Usuario | Pendente |

---

## 6. DECISOES E HISTORICO DE AVANCOS

### 28/07/2026 — Estrategia de Video + Google Calendar + Upload + Cleanup

- Documento `estrategia-de-video.md` criado com 20 modelos de video, 8 familias (Confronto, Investigacao, Transformacao, Descoberta, Resistencia, Comparacao, Experiencia, Ranking), grade de postagem 24h e metricas
- Google Calendar integrado via `google-calendar.js`: OAuth + modal de agendamento (data, hora, duracao) + criacao de evento no Google Agenda com link do roteiro
- Upload de fotos implementado: storage bucket `product-photos` no Supabase, coluna `foto` adicionada a tabela `products`, upload direto ou colar URL externa
- Cleanup de 253 arquivos orfaos: pastas `html/agentes/`, `html/brand-bible/`, `html/base-de-conhecimento/`, `html/produtos/` (HTMLs estaticos antigos), scripts `.ps1`, PDF, mega-HTMLs, `index.html` antigo, `roteiros/` vazio
- Landing page `index.html` recriada: hero + nav grid (MODELO, PRODUTOS, CONTEUDOS) + secao de documentos
- Doc-viewer `html/doc-viewer.html` criado: renderiza .md com marked.js + barra de navegacao fixa + botao Voltar
- Top nav com logo "O Cara Testou" linkando para index.html em todas as 3 paginas do app

### 25/07/2026 — Migracao Supabase + Deploy Vercel

- Supabase integrado: auth (login/signup), banco de dados (products + scripts), RLS policies
- 3 paginas migradas de localStorage para Supabase: `produtos.html`, `modelo-conteudo.html`, `roteiros-criados.html`
- Tabela `products` com cards por categoria; tabela `scripts` com roteiros, vinculo de produto e cards selecionados
- Overlay de login/signup injetado em todas as paginas com autenticacao persistente
- Modal de salvamento com seletor de produto e cards via toggle
- Edicao de roteiros via URL `?edit=ID` com restauracao de selecoes
- Visualizador em duas colunas (roteiro + produto) no CONTEUDOS
- Copia formatada para WhatsApp com emojis e *bold*
- Repositorio GitHub criado: `github.com/Sergiolisboa902/o-cara-testou`
- Deploy Vercel: `https://o-cara-testou.vercel.app` (auto-deploy via push)

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

- [ ] Executar `html/sql/insert-arrancador.sql` no Supabase SQL Editor (adicionar Arrancador Q18B)
- [ ] Testar upload de foto em produto existente
- [ ] Iniciar gravacao dos primeiros videos seguindo a Estrategia de Video
- [ ] Definir cronograma de postagem (24 videos/dia, 1 por hora)
- [ ] Execucao do briefing visual com designer
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

*Este documento é atualizado a cada novo avanço do projeto. Próxima revisão: após proximo produto do catalogo ou inicio das gravacoes.*
