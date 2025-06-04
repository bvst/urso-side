# Urso Frontend Build Script for Netlify
# Dette skriptet bygger Blazor WebAssembly applikasjonen for produksjon

param(
    [switch]$Clean = $false,
    [switch]$Verbose = $false
)

# Farger for output
$SuccessColor = "Green"
$ErrorColor = "Red"
$InfoColor = "Cyan"
$WarningColor = "Yellow"

function Write-Step {
    param([string]$Message)
    Write-Host "🔧 $Message" -ForegroundColor $InfoColor
}

function Write-Success {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor $SuccessColor
}

function Write-Error {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor $ErrorColor
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠️ $Message" -ForegroundColor $WarningColor
}

# Start av build prosess
Write-Host "🐻 " -NoNewline -ForegroundColor $WarningColor
Write-Host "Urso Frontend Build for Netlify" -ForegroundColor $InfoColor
Write-Host "=================================" -ForegroundColor $InfoColor
Write-Host ""

# Sjekk at vi er i riktig mappe
$currentPath = Get-Location
$expectedFiles = @("UrsoSide.sln", "netlify.toml", "src\Frontend\Frontend.csproj")

foreach ($file in $expectedFiles) {
    if (-not (Test-Path $file)) {
        Write-Error "Ikke funnet: $file"
        Write-Error "Sørg for at du kjører skriptet fra rot-mappen til Urso prosjektet"
        exit 1
    }
}

Write-Success "Prosjektstruktur validert"

# Sjekk .NET versjon
Write-Step "Sjekker .NET versjon..."
try {
    $dotnetVersion = dotnet --version
    Write-Host "📦 .NET versjon: $dotnetVersion" -ForegroundColor $InfoColor
    
    if ($dotnetVersion -notmatch "^10\.") {
        Write-Warning ".NET 10 er anbefalt for dette prosjektet"
    }
} catch {
    Write-Error ".NET SDK ikke funnet. Installer .NET 10 SDK fra https://dotnet.microsoft.com"
    exit 1
}

# Rydd opp hvis ønsket
if ($Clean) {
    Write-Step "Rydder opp tidligere build..."
    if (Test-Path "dist") {
        Remove-Item -Recurse -Force "dist"
        Write-Success "Dist mappe slettet"
    }
    if (Test-Path "src\Frontend\bin") {
        Remove-Item -Recurse -Force "src\Frontend\bin"
        Write-Success "Frontend bin mappe slettet"
    }
    if (Test-Path "src\Frontend\obj") {
        Remove-Item -Recurse -Force "src\Frontend\obj"
        Write-Success "Frontend obj mappe slettet"
    }
}

# Restore packages
Write-Step "Gjenoppretter NuGet pakker..."
try {
    if ($Verbose) {
        dotnet restore src\Frontend --verbosity normal
    } else {
        dotnet restore src\Frontend --verbosity quiet
    }
    
    if ($LASTEXITCODE -ne 0) {
        throw "Restore feilet"
    }
    Write-Success "NuGet pakker gjenopprettet"
} catch {
    Write-Error "Kunne ikke gjenopprette pakker: $_"
    exit 1
}

# Build og publish
Write-Step "Bygger og publiserer Blazor WebAssembly..."
try {
    $publishArgs = @(
        "publish"
        "src\Frontend"
        "-c", "Release"
        "-o", "dist"
        "--nologo"
    )
    
    if ($Verbose) {
        $publishArgs += "--verbosity", "normal"
    } else {
        $publishArgs += "--verbosity", "quiet"
    }
    
    & dotnet @publishArgs
    
    if ($LASTEXITCODE -ne 0) {
        throw "Publish feilet"
    }
    Write-Success "Frontend bygget og publisert"
} catch {
    Write-Error "Build feilet: $_"
    exit 1
}

# Valider output
Write-Step "Validerer build output..."
$wwwrootPath = "dist\wwwroot"
$requiredFiles = @("index.html", "_framework", "css\app.css")

if (-not (Test-Path $wwwrootPath)) {
    Write-Error "wwwroot mappe ikke funnet i $wwwrootPath"
    exit 1
}

foreach ($file in $requiredFiles) {
    $fullPath = Join-Path $wwwrootPath $file
    if (-not (Test-Path $fullPath)) {
        Write-Error "Påkrevd fil/mappe ikke funnet: $file"
        exit 1
    }
}

# Vis statistikk
$wwwrootSize = (Get-ChildItem -Recurse $wwwrootPath | Measure-Object -Property Length -Sum).Sum
$sizeInMB = [math]::Round($wwwrootSize / 1MB, 2)

Write-Success "Build fullført!"
Write-Host ""
Write-Host "📊 Build Statistikk:" -ForegroundColor $InfoColor
Write-Host "   📁 Deploy mappe: $wwwrootPath" -ForegroundColor $InfoColor
Write-Host "   📦 Total størrelse: $sizeInMB MB" -ForegroundColor $InfoColor
Write-Host "   🕒 Tid: $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor $InfoColor
Write-Host ""

# Vis neste steg
Write-Host "🚀 Neste steg for Netlify deploy:" -ForegroundColor $SuccessColor
Write-Host "   1. Automatisk: git add . && git commit -m 'Deploy' && git push" -ForegroundColor $InfoColor
Write-Host "   2. Manuell: Dra dist\wwwroot mappen til netlify.com" -ForegroundColor $InfoColor
Write-Host ""
Write-Host "🐻 Urso er klar for å imponere!" -ForegroundColor $WarningColor
