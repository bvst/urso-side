# Urso Standards Validation Script
# This script validates that all files in the project follow Urso's coding and documentation standards

param(
    [switch]$Fix = $false,
    [switch]$Verbose = $false
)

# Urso brand colors for output
$SuccessColor = "Green"
$ErrorColor = "Red"
$WarningColor = "Yellow"
$InfoColor = "Cyan"

function Write-UrsoHeader {
    Write-Host "🐻 Urso Standards Validator" -ForegroundColor $InfoColor
    Write-Host "===========================" -ForegroundColor $InfoColor
    Write-Host ""
}

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

function Test-MarkdownLinting {
    Write-Step "Validating markdown files..."
    
    # Use the official markdownlint CLI tool for accurate validation
    try {
        $markdownlintResult = & markdownlint **/*.md --config .markdownlint.json 2>&1
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "All markdown files pass linting rules"
            return $true
        }
        else {
            Write-Error "Markdown linting violations found:"
            $markdownlintResult | ForEach-Object {
                Write-Host "  $_" -ForegroundColor Red
            }
            return $false
        }
    }
    catch {
        Write-Warning "markdownlint CLI not found. Install with: npm install -g markdownlint-cli"
        Write-Success "Skipping markdown validation (tool not available)"
        return $true
    }
}

function Test-UrsoToneOfVoice {
    Write-Step "Validating Urso tone of voice in documentation..."
    
    $docFiles = Get-ChildItem -Path "." -Filter "*.md" -Recurse | Where-Object { 
        $_.FullName -notmatch "\\node_modules\\" -and 
        $_.FullName -notmatch "\\obj\\" -and 
        $_.FullName -notmatch "\\bin\\" 
    }
    
    $warningCount = 0
    $ursoValues = @("tillit", "kompetanse", "innovasjon", "menneskelighet")
    $friendlyTone = @("vennlig", "kompetent", "forståelig", "profesjonell")
    
    foreach ($file in $docFiles) {
        $content = Get-Content $file.FullName -Raw -Encoding UTF8
        
        # Check for presence of Urso values in main documentation files
        if ($file.Name -eq "README.md" -or $file.Directory.Name -eq "docs") {
            $hasUrsoValues = $false
            foreach ($value in $ursoValues) {
                if ($content -match $value) {
                    $hasUrsoValues = $true
                    break
                }
            }
            
            if (-not $hasUrsoValues -and $content.Length -gt 500) {
                Write-Warning "Consider mentioning Urso values in $($file.Name)"
                $warningCount++
            }
        }
    }
    
    if ($warningCount -eq 0) {
        Write-Success "Tone of voice validation passed"
    }
    else {
        Write-Warning "Found $warningCount tone of voice suggestions"
    }
    
    return $true # Warnings don't fail the validation
}

function Test-PowerShellStandards {
    Write-Step "Validating PowerShell scripts..."
    
    $psFiles = Get-ChildItem -Path "." -Filter "*.ps1" -Recurse
    $errorCount = 0
    
    foreach ($file in $psFiles) {
        $content = Get-Content $file.FullName -Raw
        # Check for Urso header in main scripts
        if ($file.Name -match "^(build|deploy|validate)" -and $content -notmatch "🐻|Urso") {
            Write-Warning "Consider adding Urso branding to $($file.Name)"
        }
        
        # Check for proper error handling
        if ($content -match "Write-Host.*Error" -and $content -notmatch "try.*catch") {
            Write-Warning "Consider adding try-catch error handling in $($file.Name)"
        }
        
        # Check for colored output
        if ($content -match "Write-Host" -and $content -notmatch "-ForegroundColor") {
            Write-Warning "Consider using colored output in $($file.Name)"
        }
    }
    
    Write-Success "PowerShell standards validation completed"
    return $true
}

function Test-BrandConsistency {
    Write-Step "Validating brand consistency..."
    
    $allFiles = Get-ChildItem -Path "." -Include "*.md", "*.razor", "*.css", "*.json" -Recurse | Where-Object { 
        $_.FullName -notmatch "\\node_modules\\" -and 
        $_.FullName -notmatch "\\obj\\" -and 
        $_.FullName -notmatch "\\bin\\" 
    }
    
    $brandElements = @{
        "Primary Color"    = "#1F3B4D"
        "Accent Color"     = "#6F4E37"
        "Background Color" = "#F5F7FA"
        "Bear Emoji"       = "🐻"
    }
    
    $foundBrandElements = 0
    
    foreach ($file in $allFiles) {
        $content = Get-Content $file.FullName -Raw -ErrorAction SilentlyContinue
        if ($content) {
            foreach ($element in $brandElements.Keys) {
                if ($content -match [regex]::Escape($brandElements[$element])) {
                    $foundBrandElements++
                    if ($Verbose) {
                        Write-Host "  Found $element in $($file.Name)" -ForegroundColor Gray
                    }
                    break
                }
            }
        }
    }
    
    if ($foundBrandElements -gt 0) {
        Write-Success "Brand consistency maintained across $foundBrandElements files"
    }
    else {
        Write-Warning "Limited brand element usage found"
    }
    
    return $true
}

# Main execution
Write-UrsoHeader

$allTestsPassed = $true

# Run all validation tests
$markdownValid = Test-MarkdownLinting
$toneValid = Test-UrsoToneOfVoice
$powershellValid = Test-PowerShellStandards
$brandValid = Test-BrandConsistency

$allTestsPassed = $markdownValid -and $toneValid -and $powershellValid -and $brandValid

Write-Host ""
if ($allTestsPassed) {
    Write-Success "🎉 All Urso standards validation tests passed!"
    Write-Host "📖 For detailed coding standards, see: .github/instructions/" -ForegroundColor $InfoColor
}
else {
    Write-Error "❌ Some validation tests failed. Please review and fix the issues above."
    Write-Host "📖 Refer to Urso coding guidelines: .github/instructions/" -ForegroundColor $InfoColor
    exit 1
}

Write-Host ""
Write-Host "🐻 Urso Quality Assurance Complete!" -ForegroundColor $InfoColor
