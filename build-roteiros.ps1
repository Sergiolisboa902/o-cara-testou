$utf8 = New-Object System.Text.UTF8Encoding $false
$mdDir = "C:\Users\Adm\Documents\Projetos\04 - TikTok\O Cara Testou\produtos\cysedoya-jump-starter-compressor\roteiros"
$outDir = "C:\Users\Adm\Documents\Projetos\04 - TikTok\O Cara Testou\html\produtos\cysedoya-jump-starter-compressor\roteiros"

$htmlTemplate = @'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>__TITLE__ | O CARA TESTOU</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;600;700;900&family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet">
<style>
*{margin:0;padding:0;box-sizing:border-box}
:root{--preto:#111;--preto-claro:#1a1a1a;--preto-medio:#222;--amarelo:#FFC20E;--cinza:#8C8C8C;--branco:#FFF}
body{font-family:'Inter',sans-serif;background:var(--preto);color:var(--branco);line-height:1.6}
body::before{content:'';position:fixed;top:0;left:0;right:0;bottom:0;background:url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.03'/%3E%3C/svg%3E");pointer-events:none;z-index:9999;opacity:0.5}
.topbar{position:sticky;top:0;z-index:100;background:linear-gradient(180deg,#0a0a0a,var(--preto));border-bottom:2px solid var(--amarelo);padding:0.75rem 1.5rem;display:flex;align-items:center;gap:0.5rem;flex-wrap:wrap}
.topbar .back{display:inline-flex;align-items:center;gap:0.3rem;background:var(--preto-medio);border:1px solid #333;border-radius:100px;padding:0.35rem 0.9rem;color:var(--cinza);text-decoration:none;font-size:0.75rem;font-weight:600;transition:all 0.3s}
.topbar .back:hover{border-color:var(--amarelo);color:var(--amarelo)}
.topbar .badge{margin-left:auto;font-family:'Anton',sans-serif;font-size:0.65rem;letter-spacing:1px;text-transform:uppercase;background:var(--amarelo);color:var(--preto);padding:0.25rem 0.5rem;border-radius:4px}
.container{max-width:960px;margin:0 auto;padding:2rem 1.5rem 4rem}
/* HEADER DO ROTEIRO */
.roteiro-header{margin-bottom:2rem}
.roteiro-header .agente{font-size:0.7rem;color:var(--cinza);text-transform:uppercase;letter-spacing:1px;font-weight:600}
.roteiro-header h1{font-family:'Anton',sans-serif;font-size:2rem;text-transform:uppercase;color:var(--branco);letter-spacing:-1px;line-height:1.1;margin:0.3rem 0}
.roteiro-header h1 span{color:var(--amarelo)}
.roteiro-header .sub{color:var(--cinza);font-size:0.85rem;margin-top:0.5rem}
/* INFO BAR */
.info-bar{display:flex;gap:0.75rem;flex-wrap:wrap;margin-bottom:2rem}
.info-item{background:var(--preto-claro);border:1px solid #222;border-radius:8px;padding:0.6rem 1rem;flex:1;min-width:120px}
.info-item .label{font-size:0.6rem;color:var(--cinza);text-transform:uppercase;letter-spacing:1px;font-weight:600}
.info-item .value{font-size:0.85rem;font-weight:600;margin-top:0.15rem;color:var(--branco)}
.info-item .value.agent{color:var(--amarelo)}
/* TABELA */
.tabela-scroll{overflow-x:auto;margin-bottom:2rem}
table.roteiro{width:100%;border-collapse:collapse;font-size:0.85rem;min-width:640px}
table.roteiro thead th{background:var(--preto-medio);color:var(--amarelo);font-size:0.65rem;text-transform:uppercase;letter-spacing:1px;padding:0.6rem 0.75rem;text-align:left;font-weight:600;border-bottom:2px solid var(--amarelo)}
table.roteiro tbody td{padding:0.7rem 0.75rem;border-bottom:1px solid #1a1a1a;vertical-align:top}
table.roteiro tbody tr:hover{background:rgba(255,194,14,0.03)}
table.roteiro tbody tr:last-child td{border-bottom:1px solid #333}
table.roteiro .col-tempo{white-space:nowrap;font-family:'Roboto Mono',monospace;font-size:0.8rem;color:var(--amarelo);font-weight:600;width:60px}
table.roteiro .col-tempo .bar{display:block;width:100%;height:3px;background:#222;border-radius:2px;margin-top:4px;overflow:hidden}
table.roteiro .col-tempo .bar-fill{height:100%;background:var(--amarelo);border-radius:2px}
table.roteiro .col-cena{color:#999;width:25%}
table.roteiro .col-cena strong{color:var(--branco);font-weight:600}
table.roteiro .col-audio{color:#ccc;width:35%;line-height:1.5}
table.roteiro .col-audio .destaque{color:var(--amarelo);font-weight:600}
table.roteiro .col-texto{color:var(--cinza);width:20%}
table.roteiro .tag{display:inline-block;font-size:0.65rem;background:rgba(255,194,14,0.1);color:var(--amarelo);padding:0.15rem 0.5rem;border-radius:100px;border:1px solid rgba(255,194,14,0.2);margin:0.15rem}
/* SECTION */
.section{margin-top:2rem;padding-top:1.5rem;border-top:1px solid #1a1a1a}
.section-title{font-family:'Anton',sans-serif;font-size:1rem;text-transform:uppercase;color:var(--amarelo);letter-spacing:-0.3px;margin-bottom:0.75rem}
.obs-box{background:var(--preto-claro);border:1px solid #222;border-radius:8px;padding:1rem 1.25rem;font-size:0.85rem;color:#aaa;line-height:1.7}
.obs-box li{margin-left:1.25rem;padding:0.15rem 0}
/* TIMELINE VISUAL */
.timeline-visual{display:flex;gap:0.25rem;margin-bottom:1.5rem;flex-wrap:wrap}
.timeline-seg{flex:1;min-width:60px;text-align:center;padding:0.4rem 0.3rem;border-radius:6px;font-size:0.6rem;font-weight:600;color:var(--preto);position:relative}
.timeline-seg.cta{background:var(--amarelo)}
.timeline-seg.demo{background:#3b82f6}
.timeline-seg.unbox{background:#8b5cf6}
.timeline-seg.veredito{background:var(--amarelo)}
.timeline-seg.analise{background:#22c55e}
.timeline-seg.intro{background:#6366f1}
.timeline-seg.dica{background:#f59e0b}
.timeline-seg.comparacao{background:#ec4899}
.timeline-seg.pergunta{background:#14b8a6}
.timeline-seg span{display:block;font-size:0.5rem;text-transform:uppercase;margin-top:0.15rem;opacity:0.8}
.footer{text-align:center;font-size:0.7rem;color:#444;margin-top:3rem;padding-top:1.5rem;border-top:1px solid #1a1a1a}
</style>
</head>
<body>
<div class="topbar">
<a class="back" href="../../../index.html">&larr; Dashboard</a>
<a class="back" href="../produto.html" style="margin-left:0.5rem;">Produto</a>
<a class="back" href="../conteudo/conteudo.html" style="margin-left:0.5rem;">Conteudo</a>
<span class="badge">__BADGE__</span>
</div>
<div class="container">
__CONTENT__
<div class="footer">O CARA TESTOU &mdash; Roteiro gerado pelo sistema de agentes</div>
</div>
</body>
</html>
'@

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
        
        # Title
        if ($trimmed -match "^# ROTEIRO") {
            $titleLine = $trimmed -replace "^# ROTEIRO:?\s*", ""
            continue
        }
        
        # Metadata
        if ($trimmed -match "^\*\*Duracao estimada:\*\*\s*(.*)") { $duracao = $matches[1]; continue }
        if ($trimmed -match "^\*\*Formato:\*\*\s*(.*)") { $formato = $matches[1]; continue }
        if ($trimmed -match "^\*\*Agente:\*\*\s*(.*)") { $agente = $matches[1]; continue }
        if ($trimmed -match "^\*\*Produto:\*\*\s*(.*)") { $produto = $matches[1]; continue }
        
        # Skip separator lines
        if ($trimmed -match "^\|.*\|$" -and $trimmed -match "^[-|\s]+$") { continue }
        
        # Table start
        if ($trimmed -match "^\| Tempo \|") {
            $inTable = $true
            $headerDone = $false
            continue
        }
        
        # Table rows
        if ($inTable -and $trimmed -match "^\|") {
            $parts = $trimmed -split "\|" | ForEach-Object { $_.Trim() }
            $parts = $parts | Where-Object { $_ -ne "" }
            if ($parts.Count -ge 4) {
                $tableRows += ,@($parts[0], $parts[1], $parts[2], $parts[3])
            }
            continue
        }
        
        # End of table
        if ($inTable -and ($trimmed -eq "" -or $trimmed -match "^---")) {
            $inTable = $false
            continue
        }
        
        # Observations section
        if ($trimmed -match "^## Observacoes") {
            $inObs = $true
            continue
        }
        
        if ($inObs) {
            if ($trimmed -match "^- (.+)") {
                $obsLines += $matches[1]
            }
            continue
        }
    }
    
    # Calculate timeline bar widths
    $totalSec = 0
    if ($duracao -match "(\d+)") { $totalSec = [int]$matches[1] }
    
    # Build HTML
    $html = ""
    
    # Header
    $html += "<div class='roteiro-header'>"
    $html += "<div class='agente'>$agente</div>"
    $html += "<h1>$titleLine</h1>"
    $html += "<div class='sub'>$produto</div>"
    $html += "</div>"
    
    # Info bar
    $html += "<div class='info-bar'>"
    $html += "<div class='info-item'><div class='label'>Duracao</div><div class='value'>$duracao</div></div>"
    $html += "<div class='info-item'><div class='label'>Formato</div><div class='value'>$formato</div></div>"
    $html += "<div class='info-item'><div class='label'>Agente</div><div class='value agent'>$agente</div></div>"
    $html += "</div>"
    
    # Timeline visual
    if ($tableRows.Count -gt 0) {
        $html += "<div class='timeline-visual'>"
        foreach ($row in $tableRows) {
            $tempo = $row[0]
            $cena = $row[1]
            $seg = 10
            if ($tempo -match "(\d+)s-(\d+)s") { $seg = [int]$matches[2] - [int]$matches[1] }
            elseif ($tempo -match "(\d+)s$") { $seg = 5 }
            
            $tipo = "demo"
            if ($cena -match "abertura|apresentador.*camera|olhando.*camera") { $tipo = "intro" }
            elseif ($cena -match "veredito|final") { $tipo = "veredito" }
            elseif ($cena -match "close.*teste|grampos|compressor") { $tipo = "demo" }
            elseif ($cena -match "unboxing|caixa|embalagem|abrindo") { $tipo = "unbox" }
            elseif ($cena -match "comentario|print|pergunta") { $tipo = "pergunta" }
            elseif ($cena -match "comparacao|vs|critério") { $tipo = "comparacao" }
            elseif ($cena -match "dica|hack") { $tipo = "dica" }
            
            $label = ($cena -split "\." | Select-Object -First 1).Trim()
            if ($label.Length -gt 20) { $label = $label.Substring(0, 20) + "..." }
            
            $html += "<div class='timeline-seg $tipo' style='flex:${seg}'>${seg}s<span>${label}</span></div>"
        }
        $html += "</div>"
    }
    
    # Main table
    if ($tableRows.Count -gt 0) {
        $html += "<div class='tabela-scroll'>"
        $html += "<table class='roteiro'>"
        $html += "<thead><tr><th>Tempo</th><th>Cena</th><th>Audio (Fala)</th><th>Texto na Tela</th></tr></thead>"
        $html += "<tbody>"
        $prevEnd = 0
        foreach ($row in $tableRows) {
            $tempo = $row[0]
            $cena = $row[1]
            $audio = $row[2]
            $texto = $row[3]
            
            # Calculate bar width
            $start = 0; $end = 0
            if ($tempo -match "(\d+)s-(\d+)s") { $start = [int]$matches[1]; $end = [int]$matches[2] }
            elseif ($tempo -match "(\d+)s$") { $start = [int]$matches[1]; $end = $start + 5 }
            $width = if ($totalSec -gt 0) { [math]::Round(($end - $start) / $totalSec * 100) } else { 10 }
            
            # Process audio - bold dashes
            $audio = $audio -replace "\*\*(.*?)\*\*", "<strong class='destaque'>`$1</strong>"
            
            $html += "<tr>"
            $html += "<td class='col-tempo'>$tempo<div class='bar'><div class='bar-fill' style='width:${width}%'></div></div></td>"
            $cenaFormatted = $cena -replace "\*\*(.*?)\*\*", "<strong>`$1</strong>"
            $html += "<td class='col-cena'>$cenaFormatted</td>"
            $html += "<td class='col-audio'>$audio</td>"
            $html += "<td class='col-texto'>"
            $texto -split "," | ForEach-Object { 
                $t = $_.Trim()
                if ($t) { $html += "<span class='tag'>$t</span>" }
            }
            $html += "</td>"
            $html += "</tr>"
        }
        $html += "</tbody></table></div>"
    }
    
    # Production notes
    if ($obsLines.Count -gt 0) {
        $html += "<div class='section'>"
        $html += "<div class='section-title'>Observacoes de Producao</div>"
        $html += "<div class='obs-box'><ul>"
        foreach ($obs in $obsLines) {
            $obs = $obs -replace "\*\*(.*?)\*\*", "<strong>`$1</strong>"
            $html += "<li>$obs</li>"
        }
        $html += "</ul></div></div>"
    }
    
    return $html
}

# Process all MD files
$count = 0
foreach ($mdFile in Get-ChildItem -LiteralPath $mdDir -Filter "*.md") {
    $base = [System.IO.Path]::GetFileNameWithoutExtension($mdFile.Name)
    $htmlContent = Convert-MdToHtml -mdPath $mdFile.FullName
    
    $title = $base
    $badge = $base
    $page = $htmlTemplate.Replace('__TITLE__', $title).Replace('__BADGE__', $badge).Replace('__CONTENT__', $htmlContent)
    
    $outPath = "$outDir\$base.html"
    [System.IO.File]::WriteAllBytes($outPath, $utf8.GetBytes($page))
    $count++
    Write-Host "  [$count] $base.html" -ForegroundColor Green
}

# Process vendas subfolder
$vendasMdDir = Join-Path $mdDir "vendas"
$vendasOutDir = Join-Path $outDir "vendas"
if (Test-Path $vendasMdDir) {
    if (-not (Test-Path $vendasOutDir)) { New-Item -ItemType Directory -Path $vendasOutDir -Force | Out-Null }
    foreach ($mdFile in Get-ChildItem -LiteralPath $vendasMdDir -Filter "*.md") {
        $base = [System.IO.Path]::GetFileNameWithoutExtension($mdFile.Name)
        $htmlContent = Convert-MdToHtml -mdPath $mdFile.FullName
        $title = $base; $badge = $base
        $page = $htmlTemplate.Replace('__TITLE__', $title).Replace('__BADGE__', $badge).Replace('__CONTENT__', $htmlContent)
        
        # Fix back links for vendas subfolder (one more ../)
        $page = $page.Replace('href="../../../index.html"', 'href="../../../../index.html"')
        $page = $page.Replace('href="../produto.html"', 'href="../../produto.html"')
        $page = $page.Replace('href="../conteudo/conteudo.html"', 'href="../../conteudo/conteudo.html"')
        
        $outPath = Join-Path $vendasOutDir "$base.html"
        [System.IO.File]::WriteAllBytes($outPath, $utf8.GetBytes($page))
        $count++
        Write-Host "  [$count] vendas/$base.html" -ForegroundColor Green
    }
}

# Process vendas-rapido subfolder
$rapidoMdDir = Join-Path $mdDir "vendas-rapido"
$rapidoOutDir = Join-Path $outDir "vendas-rapido"
if (Test-Path $rapidoMdDir) {
    if (-not (Test-Path $rapidoOutDir)) { New-Item -ItemType Directory -Path $rapidoOutDir -Force | Out-Null }
    foreach ($mdFile in Get-ChildItem -LiteralPath $rapidoMdDir -Filter "*.md") {
        $base = [System.IO.Path]::GetFileNameWithoutExtension($mdFile.Name)
        $htmlContent = Convert-MdToHtml -mdPath $mdFile.FullName
        $title = $base; $badge = $base
        $page = $htmlTemplate.Replace('__TITLE__', $title).Replace('__BADGE__', $badge).Replace('__CONTENT__', $htmlContent)
        
        $page = $page.Replace('href="../../../index.html"', 'href="../../../../index.html"')
        $page = $page.Replace('href="../produto.html"', 'href="../../produto.html"')
        $page = $page.Replace('href="../conteudo/conteudo.html"', 'href="../../conteudo/conteudo.html"')
        
        $outPath = Join-Path $rapidoOutDir "$base.html"
        [System.IO.File]::WriteAllBytes($outPath, $utf8.GetBytes($page))
        $count++
        Write-Host "  [$count] vendas-rapido/$base.html" -ForegroundColor Green
    }
}

Write-Host "=== $count paginas geradas ===" -ForegroundColor Yellow