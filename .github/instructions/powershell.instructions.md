---
applyTo: '**/*.ps1'
---
# PowerShell Instruksjoner for Urso

## Generelle Prinsipper

- Følg PowerShell beste praksis og konvensjoner
- Skriv robuste scripts med omfattende feilhåndtering
- Bruk farger og emojis for bedre brukeropplevelse
- Inkluder detaljert logging og status-oppdateringer

## Navngivningskonvensjoner

- **Funksjoner**: Bruk Verb-Noun format (f.eks. `Write-Step`, `Test-Path`)
- **Variabler**: Bruk camelCase (f.eks. `$currentPath`, `$buildSuccess`)
- **Parametere**: Bruk PascalCase (f.eks. `-Clean`, `-Verbose`)
- **Konstanter**: Bruk PascalCase (f.eks. `$SuccessColor`)

## Script Struktur

```powershell
# Script header med beskrivelse
param(
    [switch]$Clean = $false,
    [switch]$Verbose = $false
)

# Konstanter og konfiguration
$SuccessColor = "Green"
$ErrorColor = "Red"

# Hjelpefunksjoner
function Write-Step {
    param([string]$Message)
    Write-Host "🔧 $Message" -ForegroundColor $InfoColor
}

# Hovedlogikk
# Validering
# Prosessering  
# Oppsummering
```

## Parametere og Input

- Bruk `param()` blokk øverst i scriptet
- Definer standard verdier for alle parametere
- Bruk `[switch]` for boolean flagg
- Valider input tidlig i scriptet

```powershell
param(
    [Parameter(Mandatory=$false)]
    [string]$ProjectPath = ".",
    
    [switch]$Clean = $false,
    [switch]$Verbose = $false
)
```

## Feilhåndtering

- Bruk `try-catch` blokker for kritiske operasjoner
- Sjekk `$LASTEXITCODE` etter eksterne kommandoer
- Avslutt med `exit 1` ved feil
- Gi tydelige feilmeldinger

```powershell
try {
    dotnet restore $projectPath --verbosity quiet
    if ($LASTEXITCODE -ne 0) {
        throw "Restore feilet"
    }
} catch {
    Write-Error "Kunne ikke gjenopprette pakker: $_"
    exit 1
}
```

## Output og Logging

- Bruk farger for å skille forskjellige typer meldinger
- Inkluder emojis for bedre visuell identifikasjon
- Opprett dedikerte funksjoner for forskjellige meldings-typer

```powershell
function Write-Success {
    param([string]$Message)
    Write-Host "✅ $Message" -ForegroundColor Green
}

function Write-Error {
    param([string]$Message)
    Write-Host "❌ $Message" -ForegroundColor Red
}

function Write-Warning {
    param([string]$Message)
    Write-Host "⚠️ $Message" -ForegroundColor Yellow
}
```

## Validering og Sikkerhet

- Valider at nødvendige filer og mapper eksisterer
- Sjekk at påkrevde verktøy er installert
- Bruk `Test-Path` for å verifisere fil-/mappestier
- Valider output etter kritiske operasjoner

```powershell
$requiredFiles = @("solution.sln", "project.csproj")
foreach ($file in $requiredFiles) {
    if (-not (Test-Path $file)) {
        Write-Error "Påkrevd fil ikke funnet: $file"
        exit 1
    }
}
```

## Performance og Optimalisering

- Bruk `--verbosity quiet` for mindre output når ikke nødvendig
- Implementer `-Verbose` parameter for detaljert debugging
- Vis fremdriftsindikatorer for langvarige operasjoner
- Rapporter timing og størrelsesinformasjon

```powershell
if ($Verbose) {
    $verbosity = "normal"
} else {
    $verbosity = "quiet"
}

dotnet build --verbosity $verbosity
```

## Brukeropplevelse

- Start med klar header som identifiserer scriptet
- Vis fremdrift med step-by-step meldinger
- Inkluder statistikk og oppsummering på slutten
- Gi tydelige neste-steg instruksjoner

```powershell
Write-Host "🐻 Urso Build Script" -ForegroundColor Cyan
Write-Host "===================" -ForegroundColor Cyan
Write-Host ""

# ... script logikk ...

Write-Host "📊 Build Statistikk:" -ForegroundColor Cyan
Write-Host "   📁 Output: $outputPath" -ForegroundColor Cyan
Write-Host "   📦 Størrelse: $sizeInMB MB" -ForegroundColor Cyan
```

## Kompatibilitet

- Test på både PowerShell 5.1 og PowerShell 7+
- Bruk kompatible kommandoer og syntax
- Håndter Windows-spesifikke sti-separatorer
- Dokumenter minimum PowerShell versjon

## Dokumentasjon

- Inkluder tydelige kommentarer for kompleks logikk
- Bruk comment-based help for omfattende scripts
- Dokumenter alle parametere og deres formål
- Inkluder eksempler på bruk

```powershell
<#
.SYNOPSIS
Bygger Urso frontend for produksjon deploy

.DESCRIPTION
Dette scriptet bygger Blazor WebAssembly applikasjonen og forbereder
den for deploy til Netlify eller andre hosting-tjenester.

.PARAMETER Clean
Sletter tidligere build-artifakter før bygging

.PARAMETER Verbose
Aktiverer detaljert output under bygging

.EXAMPLE
.\build.ps1
Bygger med standard innstillinger

.EXAMPLE
.\build.ps1 -Clean -Verbose
Bygger med cleanup og detaljert output
#>
```

## Urso-Spesifikke Konvensjoner

- Bruk bjørn-emoji (🐻) i Urso-relaterte scripts
- Inkluder Urso merkevarefarger i output hvor relevant
- Følg norsk språk i bruker-vendte meldinger
- Reflekter Urso verdier: tillit, kompetanse, innovasjon, menneskelighet

## Testing og Kvalitetssikring

- Test scripts på ren system før deployment
- Valider at alle feil-scenarier håndteres gracefully
- Sjekk at scripts kjører uten administrative rettigheter når mulig
- Implementer dry-run modus for testing

```powershell
param(
    [switch]$WhatIf = $false
)

if ($WhatIf) {
    Write-Host "DRY RUN: Ville kjørt dotnet build" -ForegroundColor Yellow
} else {
    dotnet build
}
```
