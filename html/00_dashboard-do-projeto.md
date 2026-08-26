# DASHBOARD DO PROJETO — O CARA TESTOU

> **Documento maestro.** Visão central de tudo: equipe, entregas, status e histórico.
> Este MD é vivo — atualizado a cada avanço do projeto.

**Ultima atualizacao:** 26/08/2026
**Sprint atual:** Kit de Producao Dinamico + Sistema de Fechamento
**Proximo marco:** Novos produtos + Inicio das gravacoes

---

## 1. STATUS GERAL DO PROJETO

| Pilar | Status | Progresso |
|---|---|---|
| Brand Bible (8 fases) | Concluido | 100% |
| Base de Conhecimento (4 docs) | Concluido | 100% |
| Diretrizes TikTok | Concluido | 100% |
| Briefing Designer | Concluido | 100% |
| Catalogo Produtos | 3 produtos catalogados | 100% |
| Sistema de Agentes (A1-A10) | 3 pilares definidos | 100% |
| Roteiros Produto #1 (A1-A10) | 10 roteiros de linha editorial | 90% (A8 bloqueado) |
| Roteiros Vendas (Classico 7 etapas) | 100 roteiros V001-V100 (60s) | 100% |
| Roteiros Vendas (Rapido 6 etapas) | 100 roteiros R001-R100 (45s) com tom da marca | 100% |
| Estrategia de Video | 20 modelos + 8 familias + grade 24h | 100% |
| App Supabase (Auth + CRUD) | Login, produtos, roteiros, edicao | 100% |
| Google Calendar | Agendamento de roteiros via OAuth | 100% |
| Upload de Fotos | Storage Supabase + coluna foto nos produtos | 100% |
| Site HTML estatico | Deploy Vercel (o-cara-testou.vercel.app) | 100% |
| Kit de Producao Dinamico | 3 produtos + info detalhada + angulos + ganchos | 100% |
| Sistema de Fechamento | 80 frases em 8 categorias + modal global | 100% |
| Gerador de Roteiros | Combinacao angulo + gancho + tema + localStorage | 100% |
| Cleanup | 253 arquivos orfaos removidos | 100% |

---

## 2. ARQUITETURA DOS DOCUMENTOS

```
/
├── 00_dashboard-do-projeto.md    (Voce esta aqui — o maestro)
├── estrategia-de-video.md        (20 modelos + 8 familias + grade 24h)
├── informacoes-do-produto.md     (Modelo de estrutura de info do produto)
├── banco-de-angulos.md           (100 angulos em 10 categorias)
├── banco-de-ganchos.md           (100 ganchos em 10 categorias)
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
      ├── index.html                  (Landing page com hero + nav + docs)
      ├── catalogo.html               (Catalogo dinamico — lista produtos do JS)
      ├── kit-producao.html           (Kit por produto: info + temas + angulos + ganchos)
      ├── criar-roteiro.html          (Gerador de combinacoes angulo + gancho + tema)
      ├── lista-roteiros.html         (Lista de roteiros salvos + filtros + modal)
      ├── doc-viewer.html             (Visualizador de .md com marked.js)
      ├── dados-produtos.js           (Banco de dados: 3 produtos completos)
      ├── fechamentos.js              (Banco de 80 frases de fechamento)
      ├── fechamento-modal.js         (Botao flutuante + modal injetavel)
      ├── supabase.js                 (CRUD — auth, products, scripts, storage)
      ├── config.js                   (Supabase URL + anon key)
      ├── google-calendar.js          (Google OAuth + Calendar API)
      ├── produtos.html               (App Supabase — gerenciar produtos)
      ├── modelo-conteudo.html        (App Supabase — montar roteiro)
      ├── roteiros-criados.html       (App Supabase — roteiros salvos + agendar)
      └── *.md                        (Documentos .md para web)
```

### Fluxo de navegacao no site

```
Landing Page (html/index.html)
    │
    ├── ✨ ROTEIRO (html/criar-roteiro.html)      — Gerar combinacoes
    ├── 📦 PRODUTOS (html/catalogo.html)           — Kit de producao
    ├── 📜 CONTEUDOS (html/lista-roteiros.html)    — Roteiros salvos
    ├── 🔔 Fechamento (botao flutuante)             — Frases de fechamento
    └── Documentos (via doc-viewer.html)            — .md com nav e Voltar

Kit de Producao (html/kit-producao.html?produto=ID)
    │
    ├── Descricao curta + hashtags (box com botao copiar)
    ├── Informacoes do Produto (resumo, problemas, beneficios, etc.)
    ├── Temas (chips)
    ├── Angulos (tabela)
    └── Ganchos (tabela)
```

---

## 3. BANCO DE PRODUTOS (dados-produtos.js)

### Produtos Cadastrados

| ID | Nome | Temas | Angulos | Ganchos | Descricao |
|---|---|---|---|---|---|
| arrancador-q18b | Arrancador de Bateria c/ Compressor Q18B | 35 | 100 (10 cat.) | 100 (10 cat.) | Sim |
| furadeira-parafusadeira | Furadeira/Parafusadeira 48V | 35 | 100 (10 cat.) | 100 (10 cat.) | Sim |
| pistola-pintura-hvlp800w | Pistola de Pintura Eletrica HVLP 800W | 35 | 100 (10 cat.) | 100 (10 cat.) | Sim |

### Estrutura de dados por produto

```javascript
{
  nome: "Nome do Produto",
  descricao: "Descricao curta com hashtags para TikTok",
  temas: ["Tema 1", "Tema 2", ...],           // 35 temas
  info: {
    resumo: "...",
    problemas: ["...", ...],
    beneficios: ["...", ...],
    caracteristicas: ["...", ...],
    diferenciais: ["...", ...],
    testes: ["...", ...],
    momentosWow: ["...", ...],
    publicoIdeal: ["...", ...],
    objecoes: [{ pergunta: "...", resposta: "..." }, ...],
    curiosidades: ["...", ...]
  },
  angulos: [["Categoria", "Frase"], ...],      // 100 angulos
  ganchos: [["Categoria", "Frase"], ...]       // 100 ganchos
}
```

---

## 4. SISTEMA DE FECHAMENTO

### Banco de Frases (fechamentos.js)

| Categoria | Qtd | Exemplo |
|---|---|---|
| Destaque (Frase-Principio) | 1 | "Voce nao esta comprando um produto. Voce esta comprando a tranquilidade..." |
| Urgencia Inteligente | 10 | "A decisao mais cara normalmente e nao decidir." |
| Procrastinacao | 10 | "Ate quando voce vai continuar adiando esse problema?" |
| Dor | 10 | "Quanto tempo voce ainda vai perder fazendo isso do jeito dificil?" |
| Tempo | 10 | "Tempo e a unica coisa que nao volta." |
| Economia | 10 | "Quanto dinheiro isso pode economizar para voce?" |
| Decisao | 10 | "Quem decide rapido normalmente aproveita mais." |
| Oportunidade | 10 | "Voce esta vendo essa oportunidade ao vivo." |
| Autoridade | 10 | "Eu so mostro o que eu realmente testei." |
| **Total** | **81 frases** | |

### Funcionalidades do Modal

- Botao flutuante 🔔 em todas as paginas
- Busca por frase
- Copia individual (clicar na frase)
- Copia todas (filtro ativo)
- Baixar .txt
- Frase-destaque com visual diferenciado (fundo escuro)

---

## 5. SPRINT ATUAL

### Sprint 004 — Kit de Producao Dinamico + Fechamento

| Item | Responsavel | Status |
|---|---|---|
| Catalogo dinamico (catalogo.html) | Coordenador | Concluido |
| Kit por produto (kit-producao.html) | Coordenador | Concluido |
| Banco de dados JS (dados-produtos.js) | Coordenador | Concluido |
| Gerador de roteiros (criar-roteiro.html) | Coordenador | Concluido |
| Lista de roteiros com modal (lista-roteiros.html) | Coordenador | Concluido |
| Sistema de fechamento (fechamentos.js + modal) | Coordenador | Concluido |
| Descricao curta + hashtags + botao copiar | Coordenador | Concluido |
| Info detalhada do produto (10 secoes) | Coordenador | Concluido |
| Fix vercel.json (rewrites para .md) | Coordenador | Concluido |
| 3 produtos cadastrados | Coordenador | Concluido |

### Proximo Sprint — Novos Produtos + Operacao

| Item | Responsavel | Status |
|---|---|---|
| Adicionar novos produtos ao banco | Usuario | Pendente |
| Iniciar gravacao dos primeiros videos | Usuario | Pendente |
| Definir cronograma de postagem (24/dia) | Usuario | Pendente |

---

## 6. PAGINAS DO SITE (html/)

| Pagina | URL | Descricao |
|---|---|---|
| Landing Page | /html/index.html | Hero + nav + links para docs |
| Catalogo | /html/catalogo.html | Lista de produtos com cards |
| Kit de Producao | /html/kit-producao.html?produto=ID | Info + temas + angulos + ganchos |
| Criar Roteiro | /html/criar-roteiro.html | Gerador de combinacoes |
| Lista Roteiros | /html/lista-roteiros.html | Roteiros salvos + filtros + modal |
| Doc Viewer | /html/doc-viewer.html?path=arquivo.md | Visualizador de markdown |
| Gerenciar Produtos | /html/produtos.html | App Supabase CRUD |
| Montar Roteiro | /html/modelo-conteudo.html | App Supabase roteiros |
| Roteiros Criados | /html/roteiros-criados.html | App Supabase salvos + agendar |

---

## 7. DECISOES E HISTORICO DE AVANCOS

### 26/08/2026 — Kit de Producao + Fechamento + Novos Produtos

- **Catalogo dinamico** (`catalogo.html`): le automaticamente de `dados-produtos.js`, exibe cards com nome + contadores
- **Kit de producao** (`kit-producao.html?produto=ID`): pagina por produto com info detalhada (10 secoes), temas, angulos e ganchos em grid horizontal
- **Gerador de roteiros** (`criar-roteiro.html`): combina angulo + gancho + tema, salva em localStorage
- **Lista de roteiros** (`lista-roteiros.html`): exibe roteiros salvos como cards compactos com filtros e modal de visualizacao
- **Sistema de fechamento** (`fechamentos.js` + `fechamento-modal.js`): 81 frases em 8 categorias + frase-destaque, modal injetavel com busca, copia individual, copia todas e baixar .txt
- **Descricao curta com hashtags**: box no topo do kit de producao com botao copiar para postagem no TikTok
- **Estrutura de info detalhada**: resumo, problemas, beneficios, caracteristicas, diferenciais, testes, momentos WOW, publico ideal, objecoes com respostas, curiosidades
- **3 produtos cadastrados**: arrancador-q18b, furadeira-parafusadeira, pistola-pintura-hvlp800w
- **Fix vercel.json**: rewrites para servir arquivos .md, .js, .css antes do catch-all

### 28/07/2026 — Estrategia de Video + Google Calendar + Upload + Cleanup

- Documento `estrategia-de-video.md` criado com 20 modelos de video, 8 familias, grade de postagem 24h e metricas
- Google Calendar integrado via `google-calendar.js`
- Upload de fotos implementado: storage bucket `product-photos` no Supabase
- Cleanup de 253 arquivos orfaos
- Landing page `index.html` recriada com hero + nav grid
- Doc-viewer `doc-viewer.html` criado com marked.js + navegacao

### 25/07/2026 — Migracao Supabase + Deploy Vercel

- Supabase integrado: auth, banco de dados, RLS policies
- 3 paginas migradas de localStorage para Supabase
- Deploy Vercel: `https://o-cara-testou.vercel.app` (auto-deploy via push)

---

## 8. PROXIMOS PASSOS

- [ ] Adicionar novos produtos ao banco (dados-produtos.js)
- [ ] Iniciar gravacao dos primeiros videos seguindo a Estrategia de Video
- [ ] Definir cronograma de postagem (24 videos/dia, 1 por hora)
- [ ] Execucao do briefing visual com designer
- [ ] Estruturacao de perfis nas redes sociais
- [ ] Plano de lancamento 0-6 meses

---

## 9. GLOSSARIO DO PROJETO

| Sigla | Significado |
|---|---|
| **PVR** | Protocolo da Vida Real — metodo de teste em 4 fases |
| **CTA** | Call to Action — chamada para acao |
| **EDC** | Everyday Carry — itens de uso diario |
| **HVLP** | High Volume Low Pressure — sistema de pulverizacao |
| **LIXO CARO** | Nivel 1 do Medidor de Respeito — produto reprovado |
| **MONSTRO** | Nivel 4 do Medidor de Respeito — produto excepcional |
| **A1-A8** | Agentes da Linha Editorial (conteudo organico) |
| **A9** | Agente de Conteudo de Vendas (estrutura oficial 7 etapas) |
| **A10** | Agente de Conteudo de Lives (formato loop ao vivo) |

---

*Este documento e atualizado a cada novo avanco do projeto. Proxima revisao: apos proximo produto ou inicio das gravacoes.*
