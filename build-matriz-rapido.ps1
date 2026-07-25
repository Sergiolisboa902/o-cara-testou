$utf8 = New-Object System.Text.UTF8Encoding $false
$ProdutoDir = "C:\Users\Adm\Documents\Projetos\04 - TikTok\O Cara Testou"
$outDir = Join-Path $ProdutoDir "produtos\cysedoya-jump-starter-compressor\roteiros\vendas-rapido"

if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }

$temas = @(
    @{nome="Viagem"; ctx="na estrada"; foco="partida auxiliar"; cenario="uma viagem longa de carro"}
    @{nome="Emergencia Noturna"; ctx="a noite"; foco="lanterna LED"; cenario="um imprevisto noturno na estrada"}
    @{nome="Poder / Capacidade"; ctx="na pratica"; foco="capacidade total"; cenario="uma situacao que exige forca maxima"}
    @{nome="Calibragem"; ctx="nos pneus"; foco="compressor de ar"; cenario="manutencao rapida antes de pegar estrada"}
    @{nome="Power Bank / Celular"; ctx="no dia a dia"; foco="carregar dispositivos"; cenario="bateria do celular acabando"}
    @{nome="Motociclista"; ctx="de moto"; foco="compressor portatil"; cenario="um imprevisto durante o role"}
    @{nome="Fim de Semana / Lazer"; ctx="no lazer"; foco="multifuncionalidade"; cenario="um passeio em familia"}
    @{nome="Presente / Kit Sobrevivencia"; ctx="como presente"; foco="kit completo"; cenario="alguem que nao sabe o que comprar"}
    @{nome="Carro Antigo / Bateria Fraca"; ctx="no carro antigo"; foco="partida auxiliar"; cenario="um carro velho que nao pega"}
    @{nome="Comparacao vs Tradicional"; ctx="na comparacao"; foco="valor vs tradicionais"; cenario="comparando com kit separado"}
)

$ganchos = @(
    "Bora descobrir se essa caixinha aqui realmente presta.",
    "Serah que aguenta o tranco de verdade? Vamos ver.",
    "Dinheiro bem gasto ou dinheiro jogado fora?",
    "Eu comprei com meu proprio dinheiro pra voce nao perder o seu.",
    "Cara, vou falar a verdade que o vendedor nao te conta.",
    "Ta todo mundo vendendo isso como se fosse a oitava maravilha. Serah?",
    "Nao compre esse negocio antes de ver isso aqui.",
    "Esse kit promete 4 coisas. Serah que entrega as 4?",
    "Isso e raiz ou e brinquedo de plastico?",
    "Mais um kit na mesa, mais um teste na vida real.",
    "Vou colocar o bicho pra sofrer pra ver no que da.",
    "Cara, to vendo esse kit em todo lugar. Bora testar se presta.",
    "Sabe quando voce ve algo barato e pensa 'deve ser bomba'? Vamos ver.",
    "Te apresento o kit que promete resolver 4 problemas. Serah que resolve?",
    "Olha so o que chegou aqui hoje. Promete muito. Vou descobrir.",
    "Nao cai nessa de '4 em 1' sem ver o teste primeiro.",
    "Isso aqui ou e um baita achado ou e mais uma tranqueira.",
    "Cara, se voce viaja, presta atencao nesse video.",
    "Voce ja ficou na mao na estrada? Eu ja. Por isso to testando isso.",
    "Eu duvido que isso aqui faca TUDO que promete. Bora ver.",
    "Esse kit substitui 4 aparelhos. Ou pelo menos tenta.",
    "To desconfiado desse negocio. Promete demais. Bora por a prova.",
    "Cara, olha o tamanho disso. E dizem que faz de tudo. Serah?",
    "Bora botar na mesa e ver se e raiz ou se e enganacao.",
    "Se voce quer saber se vale a pena, eu ja comprei e ja testei.",
    "Isso aqui e o kit que todo mundo ta comprando. Mas sera que presta?",
    "Chegou a hora da verdade pra esse tal de kit 4 em 1."
)

$problemas = @(
    "O problema e o seguinte: quando o carro morre na estrada, nao tem posto, nao tem ninguem, e voce fica la.",
    "Mano, pneu murcho na estrada e perigo. E ficar esperando guincho e dose.",
    "O problema e que carregar cabo de partida, bomba de pneu e power bank separado e um saco.",
    "No escuro, sem lanterna, voce nao consegue nem achar o que caiu no chao. Quem nunca?",
    "A real e que esses kits baratos costumam ser fracos. Prometem tudo e entregam nada.",
    "Compressor vagabundo nao enche pneu, cara. So faz barulho e superaquece.",
    "Ter so uma funcao nao adianta quando o problema e em 4 cantos diferentes.",
    "Voce nunca sabe quando vai precisar. E quando precisa, ja era.",
    "Deixar o carro parado por uns dias ja era o suficiente pra bateria morrer.",
    "Meia noite, estrada vazia, e voce com um problema. Nao tem borracharia.",
    "Levar 3 aparelhos separados no porta-malas ocupa espaco que voce nao tem.",
    "A verdade e que a maioria desses kits 4 em 1 promete tudo mas quebra na primeira vez."
)

$promessas = @(
    "Esse kit tem 4 funcoes: liga o carro morto, enche pneu, carrega celular e acende no escuro. Vou testar uma por uma.",
    "Partida auxiliar, compressor digital, power bank e lanterna LED. Tudo no tamanho do porta-luvas. Bora ver se presta.",
    "4 ferramentas em 1: partida pra bateria, ar pros pneus, energia pro celular e luz de emergencia. To testando agora.",
    "Ele promete ligar, encher, carregar e iluminar - as 4 funcoes. Vou colocar cada uma a prova.",
    "Jump starter, compressor, power bank e lanterna. Tudo isso numa caixinha que cabe na mochila. Hora do teste.",
    "Dizem que esse treco faz tudo: da partida no carro, calibra pneu, carrega ate 3 celulares e ilumina no escuro.",
    "4 em 1: partida de emergencia, calibragem digital, carga USB e lanterna. Bora descobrir se entrega.",
    "Ligar, encher, carregar e iluminar. Esse kit promete as 4. Minha missao e descobrir se cumpre.",
    "Cabo de partida, bomba de pneu, carregador portatil e lanterna - tudo num kit so. Sera que funciona?",
    "Partida, compressor, power bank e lanterna LED. 4 funcoes que cabem na palma da mao. Vou testar agora."
)

$testes = @(
    "Fui direto testar a partida. Conectei os grampos no carro que tava parado ha um mes. Pegou de primeira.",
    "Usei durante varios dias. O compressor encheu o pneu do carro em menos de 2 minutos. Nao forco a barra.",
    "Levei pro pior cenario possivel: bateria zerada, escuro total, e a lanterna desse kit resolveu.",
    "Comparei com o power bank que eu ja tinha. Carregou o celular 3 vezes inteiras. Nao perdeu.",
    "Peguei o carro do meu vizinho, que tava ha 2 meses sem ligar. Conectei e o bicho pegou.",
    "Deixei o celular descarregar de proposito. Conectei no kit e carregou ate 100% rapidao.",
    "Usei as 4 funcoes no mesmo dia: dei partida, enchi pneu, carreguei o celular e usei a lanterna a noite.",
    "Fiz o teste bruto: usei a partida 3 vezes seguidas sem recarregar o kit. Segurou as 3.",
    "Enchi o pneu do carro e depois o da bicicleta com o mesmo compressor. Rapido, sem esforco.",
    "Usei numa emergencia real: carro morreu no posto, resolvi na hora. O cara do lado nao acreditou.",
    "Testei a lanterna no escuro total. Iluminou um quintal inteiro. Nao e luzinha de brinquedo nao.",
    "Usei o power bank pra carregar celular, tablet e fone. Deu conta de tudo sem perder carga.",
    "Calibrei os 4 pneus com o compressor digital. Preciso, nao chutou nada. Confiavel.",
    "Peguei uma bateria descarregada, conectei o kit, e o motor pegou como se fosse um carro novo.",
    "Usei todas as funcoes durante uma semana inteira. Nenhuma falhou. Nenhuma."
)

$resultados = @(
    "Resultado: funcionou melhor do que eu esperava. Ganhou meu respeito.",
    "Pra minha surpresa, resolveu o problema de verdade. Nao e tranqueira.",
    "O veredito e simples: vale cada centavo que voce investir aqui.",
    "Passou no teste. Entrega o que promete e nao da dor de cabeca.",
    "Nao e milagre, mas resolve o que precisa. E honesto.",
    "No final das contas: funciona. Ponto. E um baita kit.",
    "Resumo da opera: vale a pena. E um achado pelo que custa.",
    "O resultado foi claro: sim, funciona. E funciona bem.",
    "Depois do teste, minha opiniao mudou. Esse kit e raiz.",
    "Nao tem misterio: entrega as 4 funcoes. Passou com louvor.",
    "Pode comprar sem medo. O bagulho e bom e bem feito.",
    "Se apareceu aqui, passou no teste. Pode ir sem receio."
)

$ctas = @(
    "O link ta aqui se quiser dar uma olhada. E ta com desconto bacana no TikTok Shop.",
    "Achei com um precinho especial no TikTok Shop. Deixei o caminho das pedras na bio.",
    "Salva esse video pra nao esquecer. E corre no TikTok Shop que o estoque ta voando.",
    "Manda pro seu amigo que ta precisando de um kit desses. Quem avisa amigo e.",
    "Se curtiu o achado, da uma olhada no link. TikTok Shop ta com promocao essa semana.",
    "Deixei o link la embaixo. E ta mais barato que o normal no TikTok Shop, aproveita.",
    "Cara, o link ta na bio. TikTok Shop ta com desconto por tempo limitado.",
    "Dica de amigo: corre no TikTok Shop que vai acabar. Preco de lancamento."
)

Write-Host "=== Gerando 100 roteiros rapidos (TOM DA MARCA) ===" -ForegroundColor Yellow

$count = 0
for ($i = 1; $i -le 100; $i++) {
    $idStr = "R{0:D3}" -f $i
    $temaIdx = [math]::Floor(($i - 1) / 10)
    $tema = $temas[$temaIdx]
    $scriptIdx = ($i - 1) % 10

    $gIdx = ($i - 1) % $ganchos.Length
    $p1Idx = ($i - 1) % $problemas.Length
    $p2Idx = ($i - 1) % $promessas.Length
    $tIdx = ($i - 1) % $testes.Length
    $rIdx = ($i - 1) % $resultados.Length
    $cIdx = ($i - 1) % $ctas.Length

    $gancho = $ganchos[$gIdx]
    $problema = $problemas[$p1Idx]
    $promessa = $promessas[$p2Idx]
    $teste = $testes[$tIdx]
    $resultado = $resultados[$rIdx]
    $cta = $ctas[$cIdx]

    $temaNome = $tema.nome

    $roteiro = @"
# ROTEIRO: $idStr - $temaNome - Cysedoya Q18B (Rapido)

**Duracao estimada:** 45 segundos
**Formato:** TikTok / Reels
**Agente:** Rapido - 6 etapas (GANCHO, PROBLEMA, PROMESSA 4EM1, TESTE, RESULTADO, CTA)
**Produto:** Cysedoya Jump Starter Q18B - Compressor + Power Bank + Lanterna LED

---

| Tempo | Cena | Audio (Fala) | Texto na Tela |
|-------|------|-------------|---------------|
| 0s-5s | **Abertura.** Produto ja na mao. Apresentador na garagem, fundo com ferramentas. Corte seco, sem intro. Energia de amigo que acabou de chegar. | $gancho | $gancho |
| 5s-10s | Apresentador fala direto pra camera, tom de quem vai contar a real. Expressão franzida, sincera. | $problema | $problema |
| 10s-16s | Apresentador mostra o kit e aponta cada funcao: grampos (partida), mangueirinha (compressor), cabo USB (power bank), lanterna. Mostra cada uma. | $promessa | 4 EM 1: Partida + Compressor + Power Bank + Lanterna |
| 16s-35s | **Teste.** Acao real do produto em uso. Cortes secos. Close nas funcoes funcionando. Nao e encenacao, e teste de verdade. | $teste | $teste |
| 35s-40s | Apresentador volta pra camera, segurando o kit. Expressao de "ja sei o veredito". Tom sincero, sem firula. | $resultado | $resultado |
| 40s-45s | Apresentador aponta pra camera ou faz sinal de "link na bio". Ultimo frame congela com CTA. | $cta | $cta |

---

## Observacoes de Producao
- Tom de amigo especialista: "Cara", "Mano", "Bora", "Raiz", "Tranqueira"
- Primeiros 2 segundos precisam parar o scroll
- Na etapa PROMESSA, mostrar VISUALMENTE cada funcao enquanto fala
- O PROBLEMA precisa gerar identificacao: "eu ja passei por isso"
- Ritmo acelerado: frases curtas, cortes secos, 150 palavras por minuto
- Cena do teste precisa mostrar acao real, nao encenacao
- Enquadramento: peito pra cima, produto sempre visivel
- Nao usar "Fala galera", "Oi pessoal", "Sejam bem-vindos"
- Nao falar "Adquira", "Promocao imperdivel", "Clique aqui"
- CTA final com motivo claro + urgencia real
- Encerrar com tom de quem ta indo embora: "Um abraco e ate o proximo teste"

"@

    $outPath = Join-Path $outDir "$idStr.md"
    [System.IO.File]::WriteAllBytes($outPath, $utf8.GetBytes($roteiro))
    $count++
    Write-Host "  [$count] vendas-rapido/$idStr.md - $temaNome" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== $count roteiros com tom da marca ===" -ForegroundColor Yellow
