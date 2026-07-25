$utf8 = New-Object System.Text.UTF8Encoding $false
$mdDir = "C:\Users\Adm\Documents\Projetos\04 - TikTok\O Cara Testou\produtos\cysedoya-jump-starter-compressor\roteiros\vendas-rapido"
$outDir = "C:\Users\Adm\Documents\Projetos\04 - TikTok\O Cara Testou\produtos\cysedoya-jump-starter-compressor\roteiros"
$outFile = Join-Path $outDir "100-roteiros-vendas-rapido-COMPLETO.html"

function Convert-MdToHtml {
    param([string]$mdPath)

    $content = [System.IO.File]::ReadAllText($mdPath, [System.Text.Encoding]::UTF8)
    $lines = $content -split "`n"

    $titleLine = ""
    $duracao = ""
    $formato = ""
    $agente = ""
    $produto = ""
    $tableStarted = $false
    $tableHeaders = @()
    $tableRows = @()
    $currentRow = @()
    $inTable = $false
    $inObs = $false
    $obsLines = @()
    $headerDone = $false

    foreach ($line in $lines) {
        $trimmed = $line.Trim()

        if ($trimmed -match "^# ROTEIRO") {
            $titleLine = $trimmed -replace "^# ROTEIRO:?\s*", ""
            continue
        }

        if ($trimmed -match "^\*\*Duracao estimada:\*\*\s*(.*)") { $duracao = $matches[1]; continue }
        if ($trimmed -match "^\*\*Formato:\*\*\s*(.*)") { $formato = $matches[1]; continue }
        if ($trimmed -match "^\*\*Agente:\*\*\s*(.*)") { $agente = $matches[1]; continue }
        if ($trimmed -match "^\*\*Produto:\*\*\s*(.*)") { $produto = $matches[1]; continue }

        if ($trimmed -match "^\|.*\|$" -and $trimmed -match "^[-|\s]+$") { continue }

        if ($trimmed -match "^\| Tempo \|") { $inTable = $true; $headerDone = $false; continue }

        if ($inTable -and $trimmed -match "^\|") {
            $parts = $trimmed -split "\|" | ForEach-Object { $_.Trim() }
            $parts = $parts | Where-Object { $_ -ne "" }
            if ($parts.Count -ge 4) { $tableRows += ,@($parts[0], $parts[1], $parts[2], $parts[3]) }
            continue
        }

        if ($inTable -and ($trimmed -eq "" -or $trimmed -match "^---")) { $inTable = $false; continue }

        if ($trimmed -match "^## Observacoes") { $inObs = $true; continue }

        if ($inObs) {
            if ($trimmed -match "^- (.+)") { $obsLines += $matches[1] }
            continue
        }
    }

    $totalSec = 0
    if ($duracao -match "(\d+)") { $totalSec = [int]$matches[1] }

    $html = ""

    $html += "<div class='roteiro-header'>"
    $html += "<div class='agente'>$agente</div>"
    $html += "<h1>$titleLine</h1>"
    $html += "<div class='sub'>$produto</div>"
    $html += "</div>"

    $html += "<div class='info-bar'>"
    $html += "<div class='info-item'><div class='label'>Duracao</div><div class='value'>$duracao</div></div>"
    $html += "<div class='info-item'><div class='label'>Formato</div><div class='value'>$formato</div></div>"
    $html += "<div class='info-item'><div class='label'>Agente</div><div class='value agent'>$agente</div></div>"
    $html += "</div>"

    if ($tableRows.Count -gt 0) {
        $html += "<div class='timeline-visual'>"
        foreach ($row in $tableRows) {
            $tempo = $row[0]; $cena = $row[1]
            $seg = 10
            if ($tempo -match "(\d+)s-(\d+)s") { $seg = [int]$matches[2] - [int]$matches[1] }
            elseif ($tempo -match "(\d+)s$") { $seg = 5 }
            $tipo = "demo"
            if ($cena -match "abertura|apresentador.*camera|olhando.*camera") { $tipo = "intro" }
            elseif ($cena -match "conclusao|volta pra camera") { $tipo = "veredito" }
            $label = ($cena -split "\." | Select-Object -First 1).Trim()
            if ($label.Length -gt 20) { $label = $label.Substring(0, 20) + ".." }
            $html += "<div class='timeline-seg $tipo' style='flex:${seg}'>${seg}s<span>$label</span></div>"
        }
        $html += "</div>"
    }

    if ($tableRows.Count -gt 0) {
        $html += "<div class='tabela-scroll'><table class='roteiro'><thead><tr><th>Tempo</th><th>Cena</th><th>Audio (Fala)</th><th>Texto na Tela</th></tr></thead><tbody>"
        foreach ($row in $tableRows) {
            $tempo = $row[0]; $cena = $row[1]; $audio = $row[2]; $texto = $row[3]
            $start = 0; $end = 0
            if ($tempo -match "(\d+)s-(\d+)s") { $start = [int]$matches[1]; $end = [int]$matches[2] }
            elseif ($tempo -match "(\d+)s$") { $start = [int]$matches[1]; $end = $start + 5 }
            $width = if ($totalSec -gt 0) { [math]::Round(($end - $start) / $totalSec * 100) } else { 10 }
            $audio = $audio -replace "\*\*(.*?)\*\*", "<strong class='destaque'>`$1</strong>"
            $html += "<tr><td class='col-tempo'>$tempo<div class='bar'><div class='bar-fill' style='width:${width}%'></div></div></td>"
            $cenaFormatted = $cena -replace "\*\*(.*?)\*\*", "<strong>`$1</strong>"
            $html += "<td class='col-cena'>$cenaFormatted</td><td class='col-audio'>$audio</td><td class='col-texto'>"
            $texto -split "," | ForEach-Object {
                $t = $_.Trim()
                if ($t) { $html += "<span class='tag'>$t</span>" }
            }
            $html += "</td></tr>"
        }
        $html += "</tbody></table></div>"
    }

    if ($obsLines.Count -gt 0) {
        $html += "<div class='section'><div class='section-title'>Observacoes de Producao</div><div class='obs-box'><ul>"
        foreach ($obs in $obsLines) {
            $obs = $obs -replace "\*\*(.*?)\*\*", "<strong>`$1</strong>"
            $html += "<li>$obs</li>"
        }
        $html += "</ul></div></div>"
    }

    return $html
}

$pageStyles = @'
*{margin:0;padding:0;box-sizing:border-box}
:root{--preto:#111;--preto-claro:#1a1a1a;--preto-medio:#222;--amarelo:#FFC20E;--cinza:#8C8C8C;--branco:#FFF}
body{font-family:'Inter',sans-serif;background:var(--preto);color:var(--branco);line-height:1.6}
.cover{display:flex;flex-direction:column;align-items:center;justify-content:center;min-height:100vh;text-align:center;padding:2rem}
.cover h1{font-family:'Anton',sans-serif;font-size:4rem;text-transform:uppercase;color:var(--amarelo);letter-spacing:-2px}
.cover h2{font-family:'Anton',sans-serif;font-size:1.5rem;text-transform:uppercase;color:var(--branco);margin-top:1rem;letter-spacing:-1px}
.cover p{color:var(--cinza);margin-top:0.75rem;max-width:500px;font-size:0.85rem}
.cover .by{font-family:'Anton',sans-serif;color:var(--amarelo);font-size:1.25rem;margin-top:2rem;letter-spacing:1px}
.roteiro-page{padding:2rem 1.5rem 4rem;max-width:960px;margin:0 auto;page-break-before:always}
.roteiro-header{margin-bottom:2rem}
.roteiro-header .agente{font-size:0.7rem;color:var(--cinza);text-transform:uppercase;letter-spacing:1px;font-weight:600}
.roteiro-header h1{font-family:'Anton',sans-serif;font-size:1.75rem;text-transform:uppercase;color:var(--branco);letter-spacing:-1px;line-height:1.1;margin:0.3rem 0}
.roteiro-header .sub{color:var(--cinza);font-size:0.85rem;margin-top:0.5rem}
.info-bar{display:flex;gap:0.75rem;flex-wrap:wrap;margin-bottom:2rem}
.info-item{background:var(--preto-claro);border:1px solid #222;border-radius:8px;padding:0.6rem 1rem;flex:1;min-width:120px}
.info-item .label{font-size:0.6rem;color:var(--cinza);text-transform:uppercase;letter-spacing:1px;font-weight:600}
.info-item .value{font-size:0.85rem;font-weight:600;margin-top:0.15rem;color:var(--branco)}
.info-item .value.agent{color:var(--amarelo)}
.tabela-scroll{overflow-x:auto;margin-bottom:2rem}
table.roteiro{width:100%;border-collapse:collapse;font-size:0.85rem;min-width:640px}
table.roteiro thead th{background:var(--preto-medio);color:var(--amarelo);font-size:0.65rem;text-transform:uppercase;letter-spacing:1px;padding:0.5rem 0.6rem;text-align:left;font-weight:600;border-bottom:2px solid var(--amarelo)}
table.roteiro tbody td{padding:0.5rem 0.6rem;border-bottom:1px solid #1a1a1a;vertical-align:top}
table.roteiro tbody tr:hover{background:rgba(255,194,14,0.03)}
table.roteiro .col-tempo{white-space:nowrap;font-family:'Roboto Mono',monospace;font-size:0.75rem;color:var(--amarelo);font-weight:600;width:60px}
table.roteiro .col-tempo .bar{display:block;width:100%;height:3px;background:#222;border-radius:2px;margin-top:4px;overflow:hidden}
table.roteiro .col-tempo .bar-fill{height:100%;background:var(--amarelo);border-radius:2px}
table.roteiro .col-cena{color:#999;width:25%}
table.roteiro .col-cena strong{color:var(--branco);font-weight:600}
table.roteiro .col-audio{color:#ccc;width:35%;line-height:1.5}
table.roteiro .col-audio .destaque{color:var(--amarelo);font-weight:600}
table.roteiro .col-texto{color:var(--cinza);width:20%}
table.roteiro .tag{display:inline-block;font-size:0.6rem;background:rgba(255,194,14,0.1);color:var(--amarelo);padding:0.1rem 0.4rem;border-radius:100px;border:1px solid rgba(255,194,14,0.2);margin:0.1rem}
.section{margin-top:2rem;padding-top:1.5rem;border-top:1px solid #1a1a1a}
.section-title{font-family:'Anton',sans-serif;font-size:1rem;text-transform:uppercase;color:var(--amarelo);letter-spacing:-0.3px;margin-bottom:0.75rem}
.obs-box{background:var(--preto-claro);border:1px solid #222;border-radius:8px;padding:1rem 1.25rem;font-size:0.85rem;color:#aaa;line-height:1.7}
.obs-box li{margin-left:1.25rem;padding:0.15rem 0}
.timeline-visual{display:flex;gap:0.25rem;margin-bottom:1.5rem;flex-wrap:wrap}
.timeline-seg{flex:1;min-width:50px;text-align:center;padding:0.3rem 0.25rem;border-radius:4px;font-size:0.55rem;font-weight:600;color:var(--preto);position:relative}
.timeline-seg.veredito{background:var(--amarelo)}
.timeline-seg.demo{background:#3b82f6}
.timeline-seg.intro{background:#6366f1}
.timeline-seg span{display:block;font-size:0.45rem;text-transform:uppercase;margin-top:0.15rem;opacity:0.8}
@import url('https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;600;700;900&family=Roboto+Mono:wght@400;600&display=swap');
'@

Write-Host "=== Gerando PDF consolidado dos 100 roteiros rapidos ===" -ForegroundColor Yellow

$html = @"
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>100 Roteiros Rapidos de Vendas | O CARA TESTOU</title>
<style>$pageStyles</style>
</head>
<body>
<div class="cover">
    <h1>O CARA TESTOU</h1>
    <h2>100 Roteiros Rapidos de Vendas</h2>
    <p>Formato direto de 5 etapas - GANCHO, PROMESSA, TESTE/HISTORIA, RESULTADO, CTA<br>Cysedoya Jump Starter Q18B</p>
    <div class="by">100 videos &middot; 45s cada</div>
</div>
"@

$count = 0
foreach ($mdFile in Get-ChildItem -LiteralPath $mdDir -Filter "*.md" | Sort-Object Name) {
    $count++
    $base = [System.IO.Path]::GetFileNameWithoutExtension($mdFile.Name)
    Write-Host "  [$count] $base" -ForegroundColor Green
    $contentHtml = Convert-MdToHtml -mdPath $mdFile.FullName
    $html += "<div class='roteiro-page'>$contentHtml</div>"
}

$html += @'
</body>
</html>
'@

[System.IO.File]::WriteAllBytes($outFile, $utf8.GetBytes($html))
Write-Host ""
Write-Host "=== Arquivo gerado ===" -ForegroundColor Yellow
Write-Host "  $outFile" -ForegroundColor Green
Write-Host ""
Write-Host "Proximo passo:" -ForegroundColor Cyan
Write-Host "  1. Abra o HTML no Chrome/Edge" -ForegroundColor White
Write-Host "  2. Ctrl+P -> Salvar como PDF" -ForegroundColor White
Write-Host "  3. Ative 'Imprimir imagens de fundo'" -ForegroundColor White
