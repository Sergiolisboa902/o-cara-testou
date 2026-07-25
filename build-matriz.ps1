param([string]$ProdutoDir = ".")

$ErrorActionPreference = "Stop"
$utf8 = New-Object System.Text.UTF8Encoding $false

# ========== PRODUTO ==========
$produtoNome = "Cysedoya Arrancador de Bateria com Compressor de Ar Portatil Q18B"
$produtoShort = "Cysedoya Q18B"
$todasFuncoes = "4 em 1: arranca bateria 12V, enche pneu ate 150 PSI, carrega celular como power bank 8000mAh e ilumina com lanterna LED + SOS"

# ========== POOLS DE VARIACAO ==========
$ganchos = @{
    "G1" = @{tipo="Pergunta direta"; texto='Sabe o que e pior do que ficar na mao na estrada? Ter tudo pra resolver e nao ter.'}
    "G2" = @{tipo="Problema universal"; texto='Nada pior que olhar pro carro e saber que a bateria arriou na hora de sair.'}
    "G3" = @{tipo="Cena de acao"; texto='[Abre o porta-luvas, pega o aparelho] Isso aqui do tamanho de uma garrafa d agua... sera que resolve?'}
    "G4" = @{tipo="Resultado impressionante"; texto='Isso aqui ligou um motor 2.0 com bateria no osso. E nao e maior que um carregador de notebook.'}
    "G5" = @{tipo="Desafio"; texto='Falam que e 4 em 1. Que arranca, enche, carrega e ilumina. Serah que entrega?'}
    "G6" = @{tipo="Comparacao"; texto='Levar no posto, pagar pra calibrar, esperar guincho... ou ter isso no porta-luvas.'}
    "G7" = @{tipo="Curiosidade"; texto='Todo mundo ta comprando esse arrancador portatil. Mas sera que presta ou e mais uma tranqueira?'}
    "G8" = @{tipo="Afirmacao ousada"; texto='Vou te mostrar o unico equipamento que pode substituir 4 itens no seu carro.'}
}

$problemas = @{
    "P1"  = @{texto='A bateria do carro arriou. O motor faz "to-to-to" mas nao pega. Voce ta atrasado, de pressa, e o carro nao liga.'}
    "P2"  = @{texto='O pneu amassou na estrada. O posto mais proximo diz que o compressor ta quebrado. Agora?'}
    "P3"  = @{texto='O celular descarregou no meio da viagem. Sem GPS, sem musica, sem contato com ninguem.'}
    "P4"  = @{texto='Anoiteceu no meio do nada e voce precisa de luz. O farol do celular nao ilumina nem seus pes.'}
    "P5"  = @{texto='Guincho nao chega antes de 2 horas e custa o olho da cara. So pra dar um tranco no carro.'}
    "P6"  = @{texto='O porta-malas ta cheio de tralha: um carregador de bateria velho, um compressor separado, um power bank, uma lanterna.'}
    "P7"  = @{texto='A moto nao liga longe de casa. Empurrar nao da, guincho pra moto e raro e caro.'}
    "P8"  = @{texto='Compressor de posto: ou ta quebrado, ou tem fila, ou voce paga e ele nao enche direito.'}
    "P9"  = @{texto='Precisou de uma chupeta e nao tem cabo. Pedir ajuda pros outros, ficar dependendo de estranho.'}
    "P10" = @{texto='Esqueceu o power bank em casa. Bateu o desespero de ver a bateria do celular acabando.'}
    "P11" = @{texto='Nao sabe o que dar de presente pra quem tem carro. Kit de ferramentas? Esse ja tem. Acessorio? Nao vai usar.'}
    "P12" = @{texto='Familia no carro, pneu murchou na estrada. Crianca no banco de tras e voce sem saber o que fazer.'}
}

$promessas = @{
    "R1" = @{texto="Esse e o Cysedoya Q18B — $($todasFuncoes). Vou mostrar se ele realmente cumpre tudo isso."}
    "R2" = @{texto="Ele e 4 em 1: arranca, enche pneu, carrega celular e ilumina. Tudo no tamanho de uma garrafa d agua. Vamos ver."}
    "R3" = @{texto="$($todasFuncoes). E o melhor: tem display digital e desliga sozinho na pressao certa. Vou mostrar."}
    "R4" = @{texto="$($todasFuncoes). E os grampos sao inteligentes — conecta reverso e nao acontece nada. Seguranca primeiro."}
    "R5" = @{texto="4 funcoes em 1 aparelho: $($todasFuncoes). Vem com bolsa, mangueira e adaptadores. Completao."}
    "R6" = @{texto="8000mAh de bateria interna. $($todasFuncoes). A pergunta e: sera que entrega o que promete?"}
    "R7" = @{texto="$($todasFuncoes). Mas o destaque e o compressor digital: bota a pressao, ele para sozinho. Precisao de 0,1 BAR."}
}

$testes = @{
    "T1"  = @{texto='Jump start: conectar grampos no carro [vermelho +, preto -]. Indicador verde acende. Ligar a chave. Motor pega de primeira.'}
    "T2"  = @{texto='Calibrar pneu: conectar mangueira, ajustar pressao no display [32 PSI]. Ligar. Compressor enche e desliga sozinho.'}
    "T3"  = @{texto='Calibrar pneu de moto: conectar, ajustar 28 PSI. Compressor preciso ate 0,1 BAR. Rapido.'}
    "T4"  = @{texto='Power bank: conectar celular via USB. Carregamento rapido 5V/3A. Celular morto volta a vida.'}
    "T5"  = @{texto='Lanterna LED: botao liga/desliga. Dois modos — luz continua e SOS intermitente.'}
    "T6"  = @{texto='Calibrar bola: adaptador incluso. Bola murcha enche em segundos. Presicao digital.'}
    "T7"  = @{texto='Grampos inteligentes: conectar direto, reverso, o circuito protege. Indicador vermelho vs verde.'}
    "T8"  = @{texto='Partida em motor de demonstracao: grampos conectados, chave virada, motor gira forte.'}
    "T9"  = @{texto='Calibrar colchao inflavel: adaptador incluso. Enche rapido, desliga na pressao certa.'}
    "T10" = @{texto='Recarga do aparelho: USB-C 5V/3A. 4-5h para carga completa. Mostra na tomada do carro.'}
    "T11" = @{texto='Teste de protecao: conectar grampos invertido. Aparelho nao deixa passar. Seguranca real.'}
    "T12" = @{texto='Teste continuo: 3 partidas seguidas sem intervalo. Verificar aquecimento e desempenho.'}
}

$transformacoes = @{
    "F1" = @{texto='Antes: carro morto, motor nao vira, desespero. Depois: motor ligado, ar condicionado gelando, pronto pra rodar.'}
    "F2" = @{texto='Antes: pneu murcho na beira da estrada, inseguranca. Depois: pneu cheio, viagem continua segura.'}
    "F3" = @{texto='Antes: celular com 2%, preocupacao. Depois: carregando, GPS de volta, contato restabelecido.'}
    "F4" = @{texto='Antes: escuro total, sem visibilidade. Depois: area iluminada pela lanterna, seguranca.'}
    "F5" = @{texto='Antes: aquela sensacao de "e agora?". Depois: tranquilidade de quem tem tudo pra resolver.'}
    "F6" = @{texto='Antes: 4 equipamentos ocupando o porta-malas. Depois: 1 aparelho so, espaco livre.'}
    "F7" = @{texto='Antes: esperar 2h pelo guincho, perder o compromisso. Depois: resolveu em 3 minutos e foi embora.'}
    "F8" = @{texto='Antes: posto fechado a noite, pneu murcho, sem opcao. Depois: calibrou sozinho e seguiu viagem.'}
}

$vereditos = @{
    "V1" = @{texto='Ganhou meu respeito. Vale cada centavo que voce investir aqui.'}
    "V2" = @{texto='Cumpre o que promete. E honesto, bem construido, funcional. Passou no teste.'}
    "V3" = @{texto='Eu compraria sem pensar duas vezes. Principalmente quem viaja muito.'}
    "V4" = @{texto='Pra quem viaja muito, e essencial. Tamanho do porta-luvas, resolve 4 problemas.'}
    "V5" = @{texto='Melhor do que eu esperava pelo preco. Nao e tranqueira, e raiz.'}
    "V6" = @{texto='Nao e o mais potente do mercado, mas entrega. E pro custo, entrega bem.'}
    "V7" = @{texto='Custo-beneficio honesto. 4 funcoes que funcionam. Se apareceu aqui, passou no teste.'}
}

$ctas = @{
    "C1" = @{texto='O link ta aqui se quiser dar uma olhada. E ta com desconto bacana no TikTok Shop.'}
    "C2" = @{texto='Achei com um precinho especial no TikTok Shop. Deixei o caminho das pedras na bio.'}
    "C3" = @{texto='Salva esse video pra nao esquecer. Corre no TikTok Shop que o estoque ta voando.'}
    "C4" = @{texto='Manda pro seu amigo que ta precisando. Quem avisa amigo e. Link na bio.'}
    "C5" = @{texto='Se curtiu o achado, da uma olhada no link. TikTok Shop ta com promocao essa semana.'}
    "C6" = @{texto='Deixei o link la embaixo. Ta mais barato que o normal no TikTok Shop, aproveita.'}
    "C7" = @{texto='Cara, o link ta na bio. TikTok Shop ta com desconto por tempo limitado.'}
    "C8" = @{texto='Dica de amigo: corre no TikTok Shop que vai acabar. Preco de lancamento.'}
}

# ========== TEMAS ==========
$temaNomes = @(
    "Viagem",
    "Emergencia Noturna",
    "Poder / Capacidade",
    "Calibragem",
    "Power Bank / Celular",
    "Motociclista",
    "Fim de Semana / Lazer",
    "Presente / Kit Sobrevivencia",
    "Carro Antigo / Bateria Fraca",
    "Comparacao vs Tradicional"
)

# ========== MATRIZ (100 videos) ==========
# [id, tema(1-10), gancho, problema, promessa, teste, transformacao, veredito, cta]
$matriz = @(
    @(1,1,"G2","P1","R1","T1","F1","V1","C1"),@(2,1,"G3","P12","R5","T2","F2","V4","C3"),@(3,1,"G1","P5","R2","T8","F7","V2","C5"),@(4,1,"G4","P4","R6","T4","F3","V5","C7"),@(5,1,"G6","P10","R3","T10","F6","V3","C2"),
    @(6,1,"G7","P2","R7","T2","F8","V6","C4"),@(7,1,"G5","P9","R4","T1","F1","V7","C6"),@(8,1,"G8","P6","R1","T5","F4","V1","C8"),@(9,1,"G2","P12","R2","T3","F2","V4","C3"),@(10,1,"G3","P4","R5","T11","F5","V2","C1"),
    @(11,2,"G1","P4","R4","T5","F4","V1","C7"),@(12,2,"G2","P1","R1","T1","F1","V2","C5"),@(13,2,"G4","P5","R2","T8","F7","V3","C1"),@(14,2,"G5","P12","R3","T2","F8","V4","C3"),@(15,2,"G7","P9","R6","T4","F3","V5","C6"),
    @(16,2,"G8","P8","R7","T2","F2","V6","C4"),@(17,2,"G3","P4","R5","T11","F5","V4","C8"),@(18,2,"G6","P2","R1","T5","F4","V7","C2"),@(19,2,"G1","P7","R4","T1","F1","V1","C5"),@(20,2,"G4","P10","R2","T10","F6","V2","C7"),
    @(21,3,"G4","P1","R1","T1","F1","V1","C1"),@(22,3,"G5","P9","R3","T8","F7","V3","C6"),@(23,3,"G1","P11","R2","T12","F6","V5","C3"),@(24,3,"G8","P6","R4","T1","F1","V2","C5"),@(25,3,"G7","P5","R6","T4","F3","V4","C7"),
    @(26,3,"G2","P2","R7","T2","F2","V7","C2"),@(27,3,"G3","P7","R5","T7","F5","V6","C4"),@(28,3,"G6","P4","R1","T5","F4","V1","C8"),@(29,3,"G4","P12","R4","T10","F5","V5","C1"),@(30,3,"G5","P1","R3","T11","F1","V2","C6"),
    @(31,4,"G2","P2","R7","T2","F2","V1","C1"),@(32,4,"G1","P8","R3","T3","F8","V4","C3"),@(33,4,"G6","P12","R2","T2","F2","V2","C5"),@(34,4,"G7","P6","R1","T6","F6","V7","C7"),@(35,4,"G3","P5","R5","T9","F5","V3","C4"),
    @(36,4,"G4","P4","R7","T5","F4","V5","C2"),@(37,4,"G5","P2","R3","T12","F2","V6","C6"),@(38,4,"G8","P8","R2","T2","F8","V1","C8"),@(39,4,"G2","P12","R1","T3","F2","V4","C1"),@(40,4,"G1","P10","R5","T10","F6","V7","C3"),
    @(41,5,"G2","P3","R6","T4","F3","V1","C1"),@(42,5,"G1","P10","R1","T10","F6","V3","C5"),@(43,5,"G7","P6","R2","T4","F3","V2","C3"),@(44,5,"G3","P4","R5","T5","F4","V4","C7"),@(45,5,"G4","P5","R3","T12","F5","V5","C4"),
    @(46,5,"G5","P9","R4","T1","F1","V6","C2"),@(47,5,"G8","P2","R6","T2","F8","V7","C6"),@(48,5,"G6","P1","R7","T7","F7","V1","C8"),@(49,5,"G2","P10","R1","T4","F3","V3","C1"),@(50,5,"G7","P3","R5","T11","F6","V2","C5"),
    @(51,6,"G2","P7","R2","T3","F2","V4","C3"),@(52,6,"G1","P1","R1","T1","F1","V2","C1"),@(53,6,"G5","P9","R4","T7","F7","V1","C5"),@(54,6,"G3","P4","R6","T5","F4","V5","C7"),@(55,6,"G7","P8","R3","T2","F8","V3","C4"),
    @(56,6,"G4","P10","R5","T4","F3","V6","C2"),@(57,6,"G8","P6","R7","T3","F6","V7","C6"),@(58,6,"G6","P2","R1","T2","F2","V4","C8"),@(59,6,"G2","P7","R4","T1","F1","V2","C3"),@(60,6,"G5","P9","R2","T7","F7","V1","C1"),
    @(61,7,"G3","P2","R7","T6","F2","V1","C4"),@(62,7,"G2","P12","R1","T2","F2","V4","C3"),@(63,7,"G7","P6","R2","T9","F6","V3","C1"),@(64,7,"G1","P4","R5","T5","F4","V2","C7"),@(65,7,"G5","P3","R6","T4","F3","V5","C5"),
    @(66,7,"G8","P5","R3","T12","F5","V6","C2"),@(67,7,"G4","P10","R4","T10","F6","V7","C6"),@(68,7,"G6","P8","R7","T6","F8","V1","C8"),@(69,7,"G3","P2","R1","T3","F2","V4","C4"),@(70,7,"G2","P12","R2","T9","F6","V3","C1"),
    @(71,8,"G6","P11","R5","T1","F1","V1","C1"),@(72,8,"G1","P6","R2","T4","F6","V3","C5"),@(73,8,"G7","P9","R1","T7","F7","V2","C7"),@(74,8,"G2","P5","R4","T2","F8","V4","C3"),@(75,8,"G4","P3","R6","T10","F3","V5","C4"),
    @(76,8,"G5","P1","R3","T8","F5","V6","C2"),@(77,8,"G8","P12","R7","T11","F1","V7","C6"),@(78,8,"G3","P4","R5","T5","F4","V1","C8"),@(79,8,"G6","P11","R1","T6","F6","V3","C1"),@(80,8,"G1","P9","R2","T1","F7","V2","C5"),
    @(81,9,"G2","P1","R1","T1","F1","V1","C1"),@(82,9,"G4","P9","R3","T8","F7","V3","C5"),@(83,9,"G5","P11","R4","T12","F5","V2","C3"),@(84,9,"G1","P6","R2","T11","F6","V5","C7"),@(85,9,"G7","P5","R6","T4","F3","V4","C2"),
    @(86,9,"G8","P2","R7","T2","F2","V6","C6"),@(87,9,"G3","P4","R5","T5","F4","V7","C4"),@(88,9,"G6","P10","R1","T10","F3","V1","C8"),@(89,9,"G4","P1","R3","T1","F1","V3","C1"),@(90,9,"G2","P9","R4","T8","F7","V2","C5"),
    @(91,10,"G6","P1","R1","T1","F1","V2","C1"),@(92,10,"G5","P8","R7","T2","F8","V4","C5"),@(93,10,"G1","P6","R2","T4","F6","V1","C3"),@(94,10,"G7","P9","R4","T7","F7","V3","C7"),@(95,10,"G4","P5","R3","T12","F5","V5","C4"),
    @(96,10,"G3","P2","R5","T3","F2","V7","C2"),@(97,10,"G2","P4","R6","T5","F4","V6","C6"),@(98,10,"G8","P10","R7","T10","F6","V1","C8"),@(99,10,"G6","P12","R1","T2","F2","V4","C1"),@(100,10,"G5","P1","R2","T1","F1","V2","C5")
)

# ========== GERACAO ==========
$outDir = Join-Path $ProdutoDir "produtos\cysedoya-jump-starter-compressor\roteiros\vendas"
Write-Host "=== Gerando 100 roteiros A9 ===" -ForegroundColor Yellow
$count = 0

foreach ($v in $matriz) {
    $id = $v[0]
    $temaIdx = $v[1] - 1
    $gCode = $v[2]; $pCode = $v[3]; $rCode = $v[4]; $tCode = $v[5]; $fCode = $v[6]; $vCode = $v[7]; $cCode = $v[8]
    
    $g = $ganchos[$gCode]; $p = $problemas[$pCode]; $r = $promessas[$rCode]
    $t = $testes[$tCode]; $f = $transformacoes[$fCode]; $vr = $vereditos[$vCode]; $c = $ctas[$cCode]
    
    $idStr = "V{0:D3}" -f $id
    $temaNome = $temaNomes[$temaIdx]
    # Build audio for each step
    $audioGancho = $g.texto
    $audioProblema = $p.texto
    $audioPromessa = $r.texto
    $audioTeste = $t.texto
    $audioTransform = $f.texto
    $audioVeredito = $vr.texto
    $audioCTA = $c.texto
    
    $outFolder = $outDir
    if (-not (Test-Path $outFolder)) { New-Item -ItemType Directory -Path $outFolder -Force | Out-Null }
    $outPath = Join-Path $outFolder "$idStr.md"

    $roteiro = @"
# ROTEIRO: A9 — $produtoShort | $idStr — $temaNome

**Duracao estimada:** 60 segundos
**Formato:** TikTok / Reels
**Agente:** A9 - Roteirista de Vendas
**Produto:** $produtoNome
**Tema:** $temaNome
**ID:** $idStr

## Estrutura — GANCHO → PROBLEMA → PROMESSA → TESTE → TRANSFORMACAO → VEREDITO → CTA

| Tempo | Cena | Audio (Fala) | Texto na Tela |
|-------|------|-------------|---------------|
| 0s-3s | Apresentador direto pra camera, produto na mao | $audioGancho | **$($g.tipo)** |
| 3s-8s | Cena ou gesto representando o problema | $audioProblema | **O PROBLEMA** |
| 8s-12s | Close no produto, segurando com confianca. Mostrar as 4 funcoes | $audioPromessa | **$produtoShort — 4 EM 1** |
| 12s-35s | Teste pratico do produto em uso real. Plano detalhe | $audioTeste | **FUNCAO + DADO** |
| 35s-45s | Antes/Depois ou contexto de uso. Apresentador olhando | $audioTransform | **A TRANSFORMACAO** |
| 45s-55s | Apresentador olhando pra camera, produto na mao seguro | $audioVeredito | **SELO: VALE** |
| 55s-60s | Apontar ou indicar link. Tom natural, sem pressao | $audioCTA | **LINK NA VITRINE** |

## Observacoes de Producao

- **Foco do video:** $temaNome
- **Teste principal:** $($tCode)
- GANCHO deve ser entregue com energia — e o primeiro frame, sem introducao
- Na PROMESSA, mostrar claramente as 4 funcoes do produto antes de focar na demonstracao
- TESTE e a parte principal do video — caprichar nos takes de detalhe
- Nao falar especificacoes tecnicas na TRANSFORMACAO. Falar o que muda na vida
- VEREDITO: tom sincero, de amigo. Nao parecer vendedor
- CTA: consequencia natural do teste, nao ordem de compra
- **Texto na tela:** usar **Anton** para titulos, **Inter** para corpo, **Roboto Mono** para numeros
- Revisar se as 4 funcoes foram mencionadas na PROMESSA

## Checklist Pre-Publicacao

- [ ] O gancho faz alguem parar de rolar?
- [ ] O problema gera identificacao com o publico?
- [ ] As 4 funcoes foram citadas na promessa?
- [ ] O teste e visual e claro?
- [ ] O video mostra transformacao antes/depois?
- [ ] Falei mais de beneficios do que de especificacoes?
- [ ] O veredito parece honesto e sincero?
- [ ] O CTA e consequencia natural do teste?
"@

    [System.IO.File]::WriteAllBytes($outPath, $utf8.GetBytes($roteiro))
    $count++
    Write-Host "  [$count] vendas/$idStr.md" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== $count roteiros gerados ===" -ForegroundColor Yellow
