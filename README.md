# Urso Website

🎉 **LIVE SITE: <https://urso.no>** 🐻✨

Urso er et IT-konsulentselskap med navn inspirert av det portugisiske ordet for bjørn.

- **Visjon:** Være en pålitelig og innovativ IT-konsulentpartner
- **Misjon:** Levere kompetente teknologiløsninger med menneskelig varme og forståelse
- **Verdier:** Tillit, kompetanse, innovasjon, menneskelighet
- **Stil:** Moderne, minimalistisk og profesjonelt
- **Primærfarger:** Dyp blå (#1F3B4D), Bjørnebrun (#6F4E37)

Dette prosjektet består av:

1. **Backend**: .NET Core Web API i `src/Backend` mappen
2. **Frontend**: Blazor WebAssembly applikasjon i `src/Frontend` mappen
3. **Tests**: NUnit tester i `test/Backend.Tests` mappen

## 📚 Dokumentasjon

- **[Komplett Dokumentasjon](docs/README.md)** - Hovedindeks for all dokumentasjon
- **[Deploy Guide](docs/deployment/DEPLOY-GUIDE.md)** - Slik deployer du til Netlify
- **[PowerShell Build](docs/development/POWERSHELL-COMPLETE.md)** - Build system guide
- **[Brand Guidelines](docs/brand-guidelines.md)** - Urso merkevareretningslinjer

## 📁 Prosjektstruktur

```text
├── src/
│   ├── Backend/           # .NET Core Web API
│   └── Frontend/          # Blazor WebAssembly (Norsk språk)
├── test/
│   └── Backend.Tests/     # NUnit tester for Backend
├── docs/
│   ├── README.md          # Dokumentasjonsindeks
│   ├── deployment/        # Deployment guider
│   ├── development/       # Development guider
│   └── brand-guidelines.md # Merkevareretningslinjer
├── build.ps1             # PowerShell build script
├── netlify.toml          # Netlify konfigrasjon
├── UrsoSide.sln          # Solution fil
└── README.md             # Denne filen
```

## 🚀 Quick Start

### Forutsetninger

- .NET 10.0 SDK eller nyere
- Git (for versjonskontroll)
- PowerShell 7+ (anbefalt for build scripts)
- Visual Studio Code (anbefalt) med anbefalte utvidelser

### Bygg og Kjør Lokalt

```powershell
# Klon prosjektet
git clone <repository-url>
cd urso-side

# Restore NuGet pakker
dotnet restore

# Bygg prosjektet
dotnet build

# Kjør backend (Terminal 1)
dotnet run --project src/Backend

# Kjør frontend (Terminal 2) 
dotnet run --project src/Frontend
```

**URLs:**

- Frontend: [https://localhost:7061](https://localhost:7061)
- Backend API: [https://localhost:7160](https://localhost:7160)
- Swagger UI: [https://localhost:7160/swagger](https://localhost:7160/swagger)

### Build Script (Anbefalt)

```powershell
# Bygg alt med PowerShell script
.\build.ps1

# Med cleanup
.\build.ps1 -Clean

# Med verbose output
.\build.ps1 -Verbose
```

## 💻 VS Code Development Setup (Anbefalt)

Prosjektet inkluderer komplett VS Code-konfigurasjon for optimal utviklingsopplevelse:

### Quick Start med VS Code

1. **Åpne workspace:**

   ```bash
   code urso.code-workspace
   ```

2. **Installer anbefalte utvidelser** når du får forespørselen

3. **Kjør applikasjonen:**
   - Trykk `F5` og velg "Launch Backend + Frontend"
   - Eller bruk Command Palette (`Ctrl+Shift+P`) → "Tasks: Run Task"

### Tilgjengelige Konfigurasjoner

- **🔧 Build Tasks**: build-all, build-backend, build-frontend, clean, restore, test
- **🚀 Run Tasks**: run-backend, run-frontend, watch-backend, watch-frontend  
- **🐛 Debug Configs**: Backend API, Frontend Blazor, eller begge kombinert

### Validering

Kjør valideringsskriptet for å verifisere oppsettet:

```powershell
.\validate-vscode.ps1
```

📖 **Komplett VS Code guide:** [.vscode/README.md](.vscode/README.md)

## 🌐 Deployment til Netlify

Prosjektet er konfigurert for automatisk deploy til Netlify.

### Automatisk Deploy via Git

1. **Koble GitHub repository til Netlify:**
   - Gå til [netlify.com](https://netlify.com) og logg inn
   - Klikk "New site from Git"
   - Velg GitHub og autorisér tilgang
   - Velg `urso-side` repository

2. **Build innstillinger:** (automatisk fra `netlify.toml`)

   ```toml
   Build command: dotnet publish src/Frontend -c Release -o dist --nologo
   Publish directory: dist/wwwroot
   ```

3. **Deploy:** Netlify bygger automatisk ved hver push til main branch

### Manuell Deploy

```powershell
# Bygg lokalt
.\build.ps1

# Dra og slipp dist\wwwroot mappen til Netlify
```

📖 **Detaljerte instruksjoner:** [docs/deployment/DEPLOY-GUIDE.md](docs/deployment/DEPLOY-GUIDE.md)

## 🛠️ Utviklingsinformasjon

### Teknologi Stack

- **Backend**: .NET 10, ASP.NET Core
- **Frontend**: Blazor WebAssembly, C#, HTML5, CSS3
- **Testing**: NUnit, .NET Test Framework
- **Styling**: Custom CSS med Urso merkevareidentitet

### Funksjoner

#### Frontend

- 🇳🇴 **Norsk språk** - Hele nettsiden på norsk
- 📱 **Responsiv design** - Optimalisert for mobil, nettbrett og desktop
- 🎨 **Urso merkevareidentitet** - Konsistent bruk av farger og typografi
- ✨ **Animasjoner** - Subtile overgangseffekter og scroll-animasjoner
- ♿ **Tilgjengelighet** - WCAG-kompatibel design
- 🚀 **Ytelse** - Optimalisert for rask lasting

#### Backend

- 🔌 **RESTful API** - Standard HTTP API endpoints
- 📝 **OpenAPI/Swagger** - API dokumentasjon
- 🛡️ **CORS** - Konfigurert for frontend integrasjon

### Sider

- **Hjem** (`/`) - Hero-seksjon, tjenesteoversikt og verdier
- **Om oss** (`/about`) - Bedriftsinformasjon og historie
- **Tjenester** (`/tjenester`) - Detaljert oversikt over IT-tjenester
- **Kontakt** (`/contact`) - Kontaktinformasjon og skjema

## 🔨 Build Commands

```powershell
# Restore dependencies
dotnet restore UrsoSide.sln

# Build solution  
dotnet build UrsoSide.sln

# Run tests
dotnet test

# Publish for production
dotnet publish src/Frontend -c Release -o dist --nologo
```

## 🤝 Bidrag

Dette prosjektet følger Urso sine verdier:

- **Tillit**: Pålitelig kode og dokumentasjon
- **Kompetanse**: Beste praksis og moderne teknologi
- **Innovasjon**: Kreative løsninger og nye tilnærminger
- **Menneskelighet**: Fokus på brukeropplevelse og tilgjengelighet

## 📝 Notater

- **Testing Framework**: NUnit med NSubstitute for mocking
- **Språk**: All UI-tekst skal være på norsk
- **Arkitektur**: Ren separasjon mellom API backend og frontend client

Sørg for at både backend og frontend kjører for at applikasjonen skal fungere korrekt.
Backend serverer API endpoints mens frontend tilbyr brukergrensesnittet.
