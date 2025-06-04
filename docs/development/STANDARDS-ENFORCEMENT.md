# Urso Standards Enforcement Guide

Dette dokumentet forklarer hvordan man bruker og konfigurerer Urso sine koding- og dokumentasjonsstandarder.

## 🚀 Oversikt

Urso-prosjektet har implementert automatisk validering av kodingsstandarder for å sikre konsistent kvalitet og merkevareidentitet.

## 📋 Tilgjengelige Valideringer

### Markdown Linting

Automatisk validering av markdown-filer mot Urso sine dokumentasjonsstandarder:

- **MD022**: Overskrifter omgitt av blanke linjer
- **MD031**: Kodeblokker omgitt av blanke linjer  
- **MD040**: Kodeblokker med språkspesifikasjon
- **MD032**: Lister omgitt av blanke linjer
- **MD024**: Unike overskrifter (ingen duplikater)

### Urso Tone of Voice

Validering av at dokumentasjon følger Urso sine verdier:

- Vennlig og kompetent tone
- Profesjonell kommunikasjon
- Fokus på tillit, kompetanse, innovasjon, menneskelighet

### Brand Consistency

Sjekker at Urso merkevareidentitet opprettholdes:

- Korrekt bruk av primærfarger (#1F3B4D, #6F4E37)
- Konsistent bruk av bjørn-emoji (🐻)
- Profesjonell typografi (Montserrat, Inter)

## 🛠️ Hvordan Bruke

### I VS Code

#### Automatisk Validering

1. **Format on Save**: Markdown formateres automatisk ved lagring
2. **Code Actions**: Markdownlint forslag vises i Problems panel
3. **IntelliSense**: Sanntids validering under skriving

#### Manuelle Kommandoer

```bash
# Via Command Palette (Ctrl+Shift+P)
Tasks: Run Task → validate-markdown
Tasks: Run Task → validate-urso-standards
```

#### Hurtigtaster

- `Ctrl+Shift+P` → "Tasks: Run Task" → velg validering
- `F1` → "Markdown: Lint" for kun markdown validering

### Via Terminal

#### Markdown Validering

```powershell
# Installer markdownlint globalt (én gang)
npm install -g markdownlint-cli

# Valider alle markdown filer
markdownlint **/*.md --config .markdownlint.json

# Fiks enkle problemer automatisk
markdownlint **/*.md --config .markdownlint.json --fix
```

#### Urso Standards Validering

```powershell
# Kjør full validering
.\validate-urso-standards.ps1

# Med verbose output
.\validate-urso-standards.ps1 -Verbose

# Med automatisk fikser (der mulig)
.\validate-urso-standards.ps1 -Fix
```

### Pre-commit Hooks

Automatisk validering før hver commit:

#### Aktivering

```powershell
# Pre-commit hook er allerede konfigurert
# Den kjører automatisk ved 'git commit'

# Test pre-commit hook manuelt
.git\hooks\pre-commit.ps1
```

#### Bypass (kun i nødstilfeller)

```bash
# Hopp over pre-commit validering (ikke anbefalt)
git commit --no-verify -m "Emergency commit"
```

## ⚙️ Konfigurasjon

### `.markdownlint.json`

Hovedkonfigurasjon for markdown linting:

```json
{
  "default": true,
  "MD013": { "line_length": 120 },
  "MD022": true,
  "MD024": { "siblings_only": true },
  "MD031": true,
  "MD032": true,
  "MD040": true
}
```

### `.vscode/settings.json`

VS Code workspace innstillinger:

```json
{
  "markdownlint.config": {
    "MD022": true,
    "MD031": true, 
    "MD040": true,
    "MD032": true
  },
  "[markdown]": {
    "editor.defaultFormatter": "DavidAnson.vscode-markdownlint",
    "editor.formatOnSave": true
  }
}
```

## 🎯 Best Practices

### Markdown Skriving

#### Overskrifter

```markdown
Tekst før overskrift.

## Min Overskrift

Tekst etter overskrift.
```

#### Kodeblokker

```markdown
Tekst før kodeblokk.

```powershell
Write-Host "Hello Urso!" -ForegroundColor Cyan
```

Tekst etter kodeblokk.

```markdown

#### Lister

```markdown
Tekst før liste.

- Element 1
- Element 2  
- Element 3

Tekst etter liste.
```

### Urso Tone of Voice

- **Vennlig**: Bruk "du" form og inkluderende språk
- **Kompetent**: Vis teknisk kunnskap uten å være overveldende
- **Forståelig**: Unngå unødvendig teknisk sjargong
- **Profesjonell**: Oppretthold høy kvalitet og struktur

### Brand Guidelines

- **Farger**: Bruk #1F3B4D (dyp blå) og #6F4E37 (bjørnebrun)
- **Emoji**: 🐻 sparsomt og passende
- **Typografi**: Montserrat for overskrifter, Inter for brødtekst
- **Verdier**: Reflekter tillit, kompetanse, innovasjon, menneskelighet

## 🐛 Feilsøking

### Vanlige Problemer

#### "markdownlint command not found"

```bash
npm install -g markdownlint-cli
```

#### "PowerShell execution policy"

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### VS Code Extensions

Installer anbefalte extensions:

1. `Ctrl+Shift+P` → "Extensions: Show Recommended Extensions"
2. Installer "DavidAnson.vscode-markdownlint"

### Debug Mode

```powershell
# Kjør med verbose output for detaljert informasjon
.\validate-urso-standards.ps1 -Verbose

# Sjekk VS Code konfigurasjonen
.\validate-vscode.ps1
```

## 📖 Referanser

- **[Markdown Linting Rules](https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md)**
- **[Urso Brand Guidelines](../docs/brand-guidelines.md)**
- **[Documentation Instructions](.github/instructions/documentation.instructions.md)**
- **[PowerShell Instructions](.github/instructions/powershell.instructions.md)**

## 🤝 Bidrag

Foreslå forbedringer til standardene:

1. Lag en issue med forslag
2. Diskuter i team
3. Oppdater instruksjonsfiler
4. Test med validering scripts

---

**🐻 For Urso kvalitet i hver commit!**
