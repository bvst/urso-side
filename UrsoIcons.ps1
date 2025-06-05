<#
.SYNOPSIS
Genererer ikonfiler for Urso-nettstedet

.DESCRIPTION
Dette scriptet genererer ikonfiler for Urso-nettstedet basert på merkevare fargene.
Scriptet oppretter favicon-filer i forskjellige størrelser, samt andre nødvendige ikonfiler
for moderne nettlesere og mobile enheter.

Scriptet reflekterer Urso sine kjerneverdier:
- Tillit: Robust feilhåndtering og pålitelig utførelse
- Kompetanse: Profesjonell implementasjon med beste praksis
- Innovasjon: Bruk av programmatisk generering for konsistent merkevarebygging
- Menneskelighet: Brukervennlig grensesnitt med fargekodet feedback

.PARAMETER Clean
Sletter eksisterende ikoner før nye genereres

.PARAMETER Force
Overskriver eksisterende ikoner uten å spørre

.EXAMPLE
.\UrsoIcons.ps1
Genererer ikoner hvis de ikke allerede eksisterer

.EXAMPLE
.\UrsoIcons.ps1 -Clean
Sletter eksisterende ikoner og genererer nye

.EXAMPLE
.\UrsoIcons.ps1 -Force
Overskriver eksisterende ikoner uten å spørre
#>

param(
    [switch]$Clean = $false,
    [switch]$Force = $false
)

try {
    # 🎨 Urso fargepalett
    $UrsoPrimary = "#1F3B4D"     # Dyp blå - brukes for bakgrunn
    $UrsoAccent = "#6F4E37"      # Bjørnebrun - brukes for bjørnefigur
    $UrsoWhite = "#FFFFFF"       # Hvit - brukes for øyne
    $UrsoBlack = "#000000"       # Svart - brukes for pupiller og nese

# 📁 Stier
$iconsFolder = Join-Path $PSScriptRoot "src\Frontend\wwwroot\icons"

# 📝 Ikondefinisjoner
$icons = @(
    @{ Name = "favicon-16x16.png"; Size = 16 },
    @{ Name = "favicon-32x32.png"; Size = 32 },
    @{ Name = "apple-touch-icon.png"; Size = 180 },
    @{ Name = "android-chrome-192x192.png"; Size = 192 },
    @{ Name = "android-chrome-512x512.png"; Size = 512 }
)

# 🚦 Hjelpefunksjoner
function Write-Step {
    param([string]$Message)
    Write-Host "🔧 $Message" -ForegroundColor Cyan
}

function Write-Success {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠️ $Message" -ForegroundColor Yellow
}

function Write-Error {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

function Create-WebManifest {
    param([string]$path)
    
    try {
        $manifestContent = @'
{
  "name": "Urso",
  "short_name": "Urso",
  "icons": [
    {
      "src": "/icons/android-chrome-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/icons/android-chrome-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "theme_color": "#1F3B4D",
  "background_color": "#1F3B4D",
  "display": "standalone"
}
'@
        $manifestContent | Out-File -FilePath $path -Encoding UTF8 -NoNewline
        return $true
    }
    catch {
        Write-Error "Kunne ikke opprette webmanifest: $_"
        return $false
    }
}

function Create-SafariSvg {
    param([string]$path)
    
    try {
        $svgContent = @'
<svg width="700px" height="700px" viewBox="0 0 700 700" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
    <path d="M350,150 C250,150 170,230 170,330 C170,430 250,510 350,510 C450,510 530,430 530,330 C530,230 450,150 350,150 Z 
          M250,240 C280,240 300,260 300,290 C300,320 280,340 250,340 C220,340 200,320 200,290 C200,260 220,240 250,240 Z 
          M450,240 C480,240 500,260 500,290 C500,320 480,340 450,340 C420,340 400,320 400,290 C400,260 420,240 450,240 Z 
          M350,370 C375,370 395,390 395,415 C395,440 375,460 350,460 C325,460 305,440 305,415 C305,390 325,370 350,370 Z" 
          fill="#000000" fill-rule="nonzero"></path>
  </g>
</svg>
'@
        $svgContent | Out-File -FilePath $path -Encoding UTF8 -NoNewline
        return $true
    }
    catch {
        Write-Error "Kunne ikke opprette Safari SVG: $_"
        return $false
    }
}

function Create-PngIcon {
    param(
        [string]$path,
        [int]$size,
        [string]$backgroundColor,
        [string]$foregroundColor
    )
    
    try {
        # Legg til System.Drawing assembly
        Add-Type -AssemblyName System.Drawing
        
        # Konverter hex farger til RGB
        $bgColor = $backgroundColor -replace '#', ''
        $bgR = [Convert]::ToInt32($bgColor.Substring(0, 2), 16)
        $bgG = [Convert]::ToInt32($bgColor.Substring(2, 2), 16)
        $bgB = [Convert]::ToInt32($bgColor.Substring(4, 2), 16)
        
        $fgColor = $foregroundColor -replace '#', ''
        $fgR = [Convert]::ToInt32($fgColor.Substring(0, 2), 16)
        $fgG = [Convert]::ToInt32($fgColor.Substring(2, 2), 16)
        $fgB = [Convert]::ToInt32($fgColor.Substring(4, 2), 16)
        
        # Lag bitmap
        $bitmap = New-Object System.Drawing.Bitmap($size, $size)
        $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
        
        # Sett høy kvalitet
        $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
        $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
        
        # Fyll bakgrunnsfarge
        $bgColorObj = [System.Drawing.Color]::FromArgb($bgR, $bgG, $bgB)
        $graphics.Clear($bgColorObj)
        
        # Beregn proporsjoner
        $centerX = $size / 2
        $centerY = $size / 2
        $radius = $size * 0.35
        $earRadius = $radius * 0.4
        
        # Opprett pensler for tegning
        $fgColorObj = [System.Drawing.Color]::FromArgb($fgR, $fgG, $fgB)
        $brush = New-Object System.Drawing.SolidBrush($fgColorObj)
        $whiteBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::White)
        $blackBrush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black)
        
        # Hode
        [int]$headX = $centerX - $radius
        [int]$headY = $centerY - $radius
        [int]$headSize = $radius * 2
        $graphics.FillEllipse($brush, $headX, $headY, $headSize, $headSize)
        
        # Ører
        [int]$earSize = $earRadius * 2
        
        [int]$leftEarX = $centerX - $radius * 0.6 - $earRadius
        [int]$leftEarY = $centerY - $radius * 0.6 - $earRadius
        $graphics.FillEllipse($brush, $leftEarX, $leftEarY, $earSize, $earSize)
        
        [int]$rightEarX = $centerX + $radius * 0.6 - $earRadius
        [int]$rightEarY = $centerY - $radius * 0.6 - $earRadius
        $graphics.FillEllipse($brush, $rightEarX, $rightEarY, $earSize, $earSize)
        
        # For større ikoner, legg til detaljer
        if ($size -ge 32) {
            # Øyne (hvite)
            [int]$eyeRadius = [Math]::Max(($radius * 0.12), 1)
            [int]$eyeSize = $eyeRadius * 2
            
            [int]$leftEyeX = $centerX - $radius * 0.25 - $eyeRadius
            [int]$leftEyeY = $centerY - $radius * 0.1 - $eyeRadius
            $graphics.FillEllipse($whiteBrush, $leftEyeX, $leftEyeY, $eyeSize, $eyeSize)
            
            [int]$rightEyeX = $centerX + $radius * 0.25 - $eyeRadius
            [int]$rightEyeY = $centerY - $radius * 0.1 - $eyeRadius
            $graphics.FillEllipse($whiteBrush, $rightEyeX, $rightEyeY, $eyeSize, $eyeSize)
            
            # Pupiller (svarte)
            [int]$pupilRadius = [Math]::Max(($radius * 0.06), 1)
            [int]$pupilSize = $pupilRadius * 2
            
            [int]$leftPupilX = $centerX - $radius * 0.25 - $pupilRadius
            [int]$leftPupilY = $centerY - $radius * 0.1 - $pupilRadius
            $graphics.FillEllipse($blackBrush, $leftPupilX, $leftPupilY, $pupilSize, $pupilSize)
            
            [int]$rightPupilX = $centerX + $radius * 0.25 - $pupilRadius
            [int]$rightPupilY = $centerY - $radius * 0.1 - $pupilRadius
            $graphics.FillEllipse($blackBrush, $rightPupilX, $rightPupilY, $pupilSize, $pupilSize)
            
            # Nese (svart)
            [int]$noseRadius = [Math]::Max(($radius * 0.15), 1)
            [int]$noseSize = $noseRadius * 2
            
            [int]$noseX = $centerX - $noseRadius
            [int]$noseY = $centerY + $radius * 0.2 - $noseRadius
            $graphics.FillEllipse($blackBrush, $noseX, $noseY, $noseSize, $noseSize)
        }
        
        # Lagre bilde
        $bitmap.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
        
        # Cleanup
        $graphics.Dispose()
        $bitmap.Dispose()
        
        return $true
    }
    catch {
        Write-Error "Kunne ikke lage PNG ikon: $_"
        return $false
    }
}

# 🚀 Start programmet
Write-Host "🐻 Urso Ikon Generator" -ForegroundColor Cyan
Write-Host "====================" -ForegroundColor Cyan
Write-Host ""

# Opprett mapper hvis de ikke eksisterer
if (-not (Test-Path -Path $iconsFolder)) {
    try {
        Write-Step "Oppretter mappe for ikoner: $iconsFolder"
        New-Item -Path $iconsFolder -ItemType Directory -Force | Out-Null
    }
    catch {
        Write-Error "Kunne ikke opprette ikon-mappe: $_"
        exit 1
    }
}

# Rens tidligere ikoner hvis Clean er angitt
if ($Clean) {
    Write-Step "Sletter eksisterende ikoner..."
    Get-ChildItem -Path $iconsFolder -Filter "*.png" | ForEach-Object {
        Remove-Item -Path $_.FullName -Force
        Write-Host "   Slettet: $($_.Name)" -ForegroundColor Yellow
    }
    
    if (Test-Path -Path (Join-Path $iconsFolder "site.webmanifest")) {
        Remove-Item -Path (Join-Path $iconsFolder "site.webmanifest") -Force
        Write-Host "   Slettet: site.webmanifest" -ForegroundColor Yellow
    }
    
    if (Test-Path -Path (Join-Path $iconsFolder "safari-pinned-tab.svg")) {
        Remove-Item -Path (Join-Path $iconsFolder "safari-pinned-tab.svg") -Force
        Write-Host "   Slettet: safari-pinned-tab.svg" -ForegroundColor Yellow
    }
}

# 📦 Generer ikoner
$successCount = 0
$skippedCount = 0
$failedCount = 0

Write-Step "Genererer ikoner..."

# Safari pinned tab SVG
$safariSvgPath = Join-Path $iconsFolder "safari-pinned-tab.svg"
if ((-not (Test-Path $safariSvgPath)) -or $Force) {
    try {
        if (Create-SafariSvg -path $safariSvgPath) {
            Write-Success "   Generert: safari-pinned-tab.svg"
            $successCount++
        }
    }
    catch {
        Write-Error "   Kunne ikke generere safari-pinned-tab.svg: $_"
        $failedCount++
    }
}
else {
    Write-Host "   Hopper over: safari-pinned-tab.svg (eksisterer allerede)" -ForegroundColor Yellow
    $skippedCount++
}

# Web manifest
$manifestPath = Join-Path $iconsFolder "site.webmanifest"
if ((-not (Test-Path $manifestPath)) -or $Force) {
    try {
        if (Create-WebManifest -path $manifestPath) {
            Write-Success "   Generert: site.webmanifest"
            $successCount++
        }
    }
    catch {
        Write-Error "   Kunne ikke generere site.webmanifest: $_"
        $failedCount++
    }
}
else {
    Write-Host "   Hopper over: site.webmanifest (eksisterer allerede)" -ForegroundColor Yellow
    $skippedCount++
}

# Generer alle PNG ikoner
foreach ($icon in $icons) {
    $iconPath = Join-Path $iconsFolder $icon.Name
    
    if ((-not (Test-Path $iconPath)) -or $Force) {
        Write-Host "   Genererer: $($icon.Name) ($($icon.Size)x$($icon.Size))" -ForegroundColor Cyan
        
        try {
            # Lag PNG direkte med System.Drawing
            if (Create-PngIcon -path $iconPath -size $icon.Size -backgroundColor $UrsoPrimary -foregroundColor $UrsoAccent) {
                Write-Success "      Lagret: $($icon.Name)"
                $successCount++
            } else {
                Write-Error "      Generering feilet for $($icon.Name)"
                $failedCount++
            }
        }
        catch {
            Write-Error "      Kunne ikke generere $($icon.Name): $_"
            $failedCount++
        }
    }
    else {
        Write-Host "   Hopper over: $($icon.Name) (eksisterer allerede)" -ForegroundColor Yellow
        $skippedCount++
    }
}

# 📊 Vis oppsummering
Write-Host ""
Write-Host "📊 Generering fullført!" -ForegroundColor Cyan
Write-Host "   📁 Ikoner lagret i: $iconsFolder" -ForegroundColor Cyan
Write-Host "   ✅ Genererte filer: $successCount" -ForegroundColor Green
if ($skippedCount -gt 0) {
    Write-Host "   ⏭️ Hoppet over: $skippedCount" -ForegroundColor Yellow
}
if ($failedCount -gt 0) {
    Write-Host "   ❌ Feilede filer: $failedCount" -ForegroundColor Red
}
Write-Host ""

if ($failedCount -gt 0) {
    Write-Error "Noen ikoner kunne ikke genereres. Vennligst sjekk feilmeldingene ovenfor."
    Write-Host ""
    Write-Host "🔧 Tips:"
    Write-Host "   1. Sørg for at du har System.Drawing tilgjengelig i PowerShell"
    Write-Host "   2. Kjør med PowerShell Core (pwsh) for best kompatibilitet"
    Write-Host "   3. Bruk -Force for å overskrive eksisterende filer"
    Write-Host ""
    exit 1
}

    Write-Success "Alle ikoner er generert!"
    Write-Host "Husk at disse er midlertidige ikoner. For en produksjonsnettside, vurder profesjonelt designede ikoner." -ForegroundColor Yellow
} catch {
    # Global feilhåndtering som sikrer at scriptet alltid gir ordentlig feedback
    # Dette reflekterer Urso sine verdier om tillit og profesjonalitet
    Write-Error "🛑 En uventet feil oppsto under ikon-generering: $_"
    Write-Host ""
    Write-Host "🔍 Feilsøkingstips:" -ForegroundColor Cyan
    Write-Host "   1. Sjekk at PowerShell-versjonen din støtter System.Drawing" -ForegroundColor Cyan
    Write-Host "   2. Kontroller at du har skrivetilgang til målmappen" -ForegroundColor Cyan
    Write-Host "   3. Hvis feilen vedvarer, rapporter problemet med feilmeldingen over" -ForegroundColor Cyan
    Write-Host ""
    
    # Avslutt med feilkode
    exit 1
}
