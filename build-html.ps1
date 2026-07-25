param([string]$TargetDir = ".")

$ErrorActionPreference = "Stop"

# Use UTF-8 without BOM
$utf8 = New-Object System.Text.UTF8Encoding $false

$htmlStart = @'
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>__TITLE__ | O CARA TESTOU</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anton&family=Inter:wght@400;600;700;900&family=Roboto+Mono:wght@400;600&display=swap" rel="stylesheet">
    <style>
        *{margin:0;padding:0;box-sizing:border-box}
        :root{--preto:#111111;--preto-claro:#1a1a1a;--preto-medio:#222222;--amarelo:#FFC20E;--cinza:#8C8C8C;--vermelho:#E63946;--branco:#FFFFFF}
        body{font-family:'Inter',sans-serif;background:var(--preto);color:var(--branco);line-height:1.6}
        body::before{content:'';position:fixed;top:0;left:0;right:0;bottom:0;background-image:url("data:image/svg+xml,%3Csvg viewBox='0 0 256 256' xmlns='http://www.w3.org/2000/svg'%3E%3Cfilter id='noise'%3E%3CfeTurbulence type='fractalNoise' baseFrequency='0.9' numOctaves='4' stitchTiles='stitch'/%3E%3C/filter%3E%3Crect width='100%25' height='100%25' filter='url(%23noise)' opacity='0.03'/%3E%3C/svg%3E");pointer-events:none;z-index:9999;opacity:0.5}
        .topbar{position:sticky;top:0;z-index:100;background:linear-gradient(180deg,#0a0a0a 0%,var(--preto) 100%);border-bottom:2px solid var(--amarelo);padding:0.75rem 1.5rem;display:flex;align-items:center;gap:1rem}
        .topbar .back{display:inline-flex;align-items:center;gap:0.4rem;background:var(--preto-medio);border:1px solid #333;border-radius:100px;padding:0.4rem 1rem;color:var(--cinza);text-decoration:none;font-size:0.8rem;font-weight:600;transition:all 0.3s}
        .topbar .back:hover{border-color:var(--amarelo);color:var(--amarelo)}
        .topbar .badge{font-family:'Anton',sans-serif;font-size:0.7rem;letter-spacing:1px;text-transform:uppercase;background:var(--amarelo);color:var(--preto);padding:0.25rem 0.5rem;border-radius:4px;margin-left:auto}
        .container{max-width:920px;margin:0 auto;padding:2rem 1.5rem 4rem}
        .md-content{font-size:0.95rem;line-height:1.8;color:#ddd;white-space:pre-wrap;word-wrap:break-word;font-family:'Inter',sans-serif}
        @media(max-width:600px){.container{padding:1rem 1rem 3rem}}
        ::-webkit-scrollbar{width:6px}::-webkit-scrollbar-track{background:var(--preto)}::-webkit-scrollbar-thumb{background:#333;border-radius:100px}
    </style>
</head>
<body>
<div class="topbar">
    <a class="back" href="__BACK__/index.html">&larr; Dashboard</a>
    <span class="badge">__TITLE__</span>
</div>
<div class="container">
<pre class="md-content">
'@

$htmlEnd = @'
</pre>
</div>
</body>
</html>
'@

Write-Host "=== Build HTML ===" -ForegroundColor Yellow

$files = @()
if (Test-Path (Join-Path $TargetDir "brand-bible")) {
    $files += Get-ChildItem -LiteralPath (Join-Path $TargetDir "brand-bible") -Filter "*.md"
}
if (Test-Path (Join-Path $TargetDir "base-de-conhecimento")) {
    $files += Get-ChildItem -LiteralPath (Join-Path $TargetDir "base-de-conhecimento") -Filter "*.md"
}
if (Test-Path (Join-Path $TargetDir "agentes")) {
    $files += Get-ChildItem -LiteralPath (Join-Path $TargetDir "agentes") -Filter "*.md"
}
if (Test-Path (Join-Path $TargetDir "00_dashboard-do-projeto.md")) {
    $files += Get-ChildItem -LiteralPath $TargetDir -Filter "00_dashboard-do-projeto.md"
}

$htmlRoot = Join-Path $TargetDir "html"

$count = 0
foreach ($file in $files) {
    $relDir = if ($file.Directory.Name -eq "brand-bible" -or $file.Directory.Name -eq "base-de-conhecimento" -or $file.Directory.Name -eq "agentes") {
        $file.Directory.Name
    } else { "." }

    $outDir = Join-Path $htmlRoot $relDir
    if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }

    $base = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)
    $outPath = Join-Path $outDir ($base + ".html")

    # Read source MD as raw bytes, decode as UTF-8
    $mdBytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $mdContent = $utf8.GetString($mdBytes)

    # Escape HTML entities for <pre> display
    $escaped = $mdContent.Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;')

    # Back to dashboard: from html/ subfolder, need ../
    $backDir = if ($relDir -eq ".") { "." } else { ".." }

    # Build page with string concatenation (safe with UTF-8)
    $page = $htmlStart.Replace('__BACK__', $backDir).Replace('__TITLE__', $base) + $escaped + $htmlEnd

    # Write as UTF-8 no BOM
    $pageBytes = $utf8.GetBytes($page)
    [System.IO.File]::WriteAllBytes($outPath, $pageBytes)

    $count++
    $displayDir = if ($relDir -eq ".") { "" } else { "$relDir/" }
    Write-Host "  [$count] html/$displayDir$base.html" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== $count arquivos gerados ===" -ForegroundColor Yellow
