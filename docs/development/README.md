# 🛠️ Development Documentation

Denne mappen inneholder dokumentasjon for utvikling og vedlikehold av Urso-prosjektet.

## 📚 Dokumenter

- **[STANDARDS-ENFORCEMENT.md](STANDARDS-ENFORCEMENT.md)** - Komplett guide til Urso standarder og valideringssystem

## 🔧 Utviklingsverktøy

### Validering

Prosjektet har et omfattende valideringssystem for å sikre kodekvalitet:

```powershell
# Kjør full Urso standardvalidering
.\validate-urso-standards.ps1

# Kjør bare markdown-validering
markdownlint **/*.md --config .markdownlint.json
```

### VS Code Oppset

Prosjektet inkluderer komplett VS Code-konfigurasjon med:

- Automatisk markdown-formatering
- Real-time linting
- Pre-commit hooks
- Validering via Command Palette

### Build og Test

```powershell
# Build hele prosjektet
dotnet build UrsoSide.sln

# Kjør tester
dotnet test

# Kjør frontend i watch-modus
dotnet watch run --project src/Frontend/Frontend.csproj
```

## 📊 Kodestandarder

Prosjektet følger Urso's merkevare- og kodestandarder:

- **Merkevare**: Dyp blå (#1F3B4D) og bjørnebrun (#6F4E37)
- **Tone**: Vennlig, kompetent og forståelig
- **Språk**: Norsk for sluttbrukere, engelsk for teknisk dokumentasjon
- **Kode**: .NET best practices med Blazor WebAssembly
