# VS Code Configuration Validation Script
# This script helps validate that the VS Code setup is working correctly

Write-Host "🐻 Urso VS Code Configuration Validator" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# Test .NET SDK
Write-Host "Checking .NET SDK..." -ForegroundColor Yellow
try {
    $dotnetVersion = dotnet --version
    Write-Host "✅ .NET SDK found: $dotnetVersion" -ForegroundColor Green
}
catch {
    Write-Host "❌ .NET SDK not found. Please install .NET 10.0 SDK" -ForegroundColor Red
    exit 1
}

# Test project build
Write-Host "Testing project build..." -ForegroundColor Yellow
try {
    $buildResult = dotnet build UrsoSide.sln --verbosity quiet
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Project builds successfully" -ForegroundColor Green
    }
    else {
        Write-Host "❌ Build failed" -ForegroundColor Red
    }
}
catch {
    Write-Host "❌ Build test failed" -ForegroundColor Red
}

# Check VS Code files
Write-Host "Checking VS Code configuration files..." -ForegroundColor Yellow
$vscodeFiles = @(
    ".vscode\launch.json",
    ".vscode\tasks.json", 
    ".vscode\settings.json",
    ".vscode\extensions.json",
    "urso.code-workspace"
)

foreach ($file in $vscodeFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file exists" -ForegroundColor Green
    }
    else {
        Write-Host "❌ $file missing" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "🚀 Next Steps:" -ForegroundColor Cyan
Write-Host "1. Open VS Code: code urso.code-workspace" -ForegroundColor White
Write-Host "2. Install recommended extensions when prompted" -ForegroundColor White
Write-Host "3. Press F5 and select 'Launch Backend + Frontend'" -ForegroundColor White
Write-Host "4. Your app will be available at:" -ForegroundColor White
Write-Host "   - Backend: https://localhost:7160 (with Swagger UI)" -ForegroundColor Gray
Write-Host "   - Frontend: https://localhost:7061" -ForegroundColor Gray
Write-Host ""
Write-Host "📖 For detailed instructions, see: .vscode\README.md" -ForegroundColor Cyan
