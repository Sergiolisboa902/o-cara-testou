# SISTEMA DE AGENTES DE ROTEIRO — O CARA TESTOU

> Cada roteiro e gerado por um agente especialista em uma linha editorial.
> O sistema permite escalar: N produtos x M linhas editoriais = NxM roteiros.

## Arquitetura

```
Produto (catalogo.json)
        |
        v
Agentes de Roteiro (cada um especializado numa linha)
        |
        +-- [1] Linha Editorial (A1-A8) — Conteudo diverso para engajar
        +-- [2] Conteudo de Vendas (A9)  — Video completo com estrutura oficial de 7 etapas
        +-- [3] Conteudo de Lives (A10) — Loop de vendas ao vivo com carrinho TikTok Shop
        |
        v
Roteiros individuais salvos em produtos/[produto]/roteiros/
        |
        v
Pasta pronta para gravacao
```

## Os 3 Pilares de Conteudo

### [1] Linha Editorial — Conteudo Diverso (A1-A8)

Conteudos variados para construir autoridade, engajar e manter presenca constante no feed. Cada agente tem um angulo diferente.

| # | Agente | Linha | Duracao | Formato |
|---|--------|-------|---------|---------|
| A1 | **Roteirista Classico** | Review Completo (PVR) | 60-90s | Teste em 4 fases, veredito final |
| A2 | **Roteirista Dica Rapida** | Dica Rapida | 15-30s | 1 funcao, direto ao ponto |
| A3 | **Roteirista Comparativo** | Vs / Comparativo | 60-90s | Lado a lado, 2-3 criterios |
| A4 | **Roteirista Unboxing** | Unboxing / Primeiras Impressoes | 30-45s | Abrindo, primeira reacao |
| A5 | **Roteirista Custo-Beneficio** | Vale a Pena? | 45-60s | Preco x beneficio, calculo mental |
| A6 | **Roteirista Hack** | Hack / Truque | 20-40s | Uso inesperado do produto |
| A7 | **Roteirista Responde** | Respondendo Comentarios | 45-75s | Perguntas reais da audiencia |
| A8 | **Roteirista Longo Prazo** | Depois de Meses | 45-60s | Review apos uso prolongado |

### [2] Conteudo de Vendas (A9)

Video completo seguindo a estrutura oficial da marca — focado em conversao. Mesma estrutura para todos os videos: GANCHO → PROBLEMA → PROMESSA → TESTE → TRANSFORMACAO → VEREDITO → CTA.

| # | Agente | Linha | Duracao | Formato |
|---|--------|-------|---------|---------|
| A9 | **Roteirista de Vendas** | Estrutura Oficial de 7 Etapas | 55-65s | Gancho ao CTA, foco em conversao |

### [3] Conteudo de Lives (A10)

Live de vendas com carrinho do TikTok Shop ao vivo. Estruturada em loops de ~10-15 minutos para captar espectadores que entram no meio da transmissao.

| # | Agente | Linha | Duracao | Formato |
|---|--------|-------|---------|---------|
| A10 | **Roteirista de Lives** | Loop de Vendas ao Vivo | Live continua | Loop de 10-15min com carrinho |

## Processo de Criacao

1. Produto e cadastrado no catalogo com todas as infos
2. Para cada linha editorial desejada, aciona-se o agente correspondente
3. O agente le os dados do produto + template da linha e gera o roteiro
4. Roteiro e salvo em `produtos/[produto]/roteiros/[id]-[linha].md`
5. Quando for gravar, e so abrir a pasta e ler

## Formato Padrao do Roteiro

```markdown
# ROTEIRO: [Linha] — [Nome do Produto]

**Duracao estimada:** XX segundos
**Formato:** [TikTok / Short / Reels]
**Agente:** A[X] - [Nome do Agente]

## Estrutura

| Tempo | Cena | Audio (Fala) | Texto na Tela |
|-------|------|-------------|---------------|
| 0s-3s | Abertura | [fala] | [texto] |
| ... | ... | ... | ... |

## Observacoes de Producao

- [dicas de gravacao, enquadramento, iluminacao]
```

## Como Usar

1. Escolher o produto do catalogo
2. Escolher qual(is) linha(s) editorial(is) fazer
3. Falar para mim: "Gera roteiro [linha] para [produto]"
4. Eu busco os dados do produto no catalogo e executo o agente
