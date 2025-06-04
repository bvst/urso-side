# Urso Website

🎉 **LIVE SITE: https://urso.no** 🐻✨

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

## Prosjektstruktur

```text
├── src/
│   ├── Backend/           # .NET Core Web API
│   └── Frontend/          # Blazor WebAssembly (Norsk språk)
├── test/
│   └── Backend.Tests/     # NUnit tester for Backend
├── docs/
│   └── brand-guidelines.md # Merkevareretningslinjer og designspesifikasjoner
├── .gitignore             # Git ignore fil
├── UrsoSide.sln          # Solution fil
└── README.md             # Denne filen
```

## Kom i gang

### Forutsetninger

- .NET 10.0 SDK eller nyere
- Git

### Klone prosjektet

```bash
git clone <repository-url>
cd urso-side
```

### Kjør Backend

```bash
dotnet run --project src/Backend
```

Backend kjører på `http://localhost:5000` (HTTP) og `https://localhost:5001` (HTTPS).

### Kjør Frontend

```bash
dotnet run --project src/Frontend
```

Frontend kjører på `http://localhost:5167`.

### Kjør tester

```bash
dotnet test
```

## Deploy til Netlify

Prosjektet er konfigurert for automatisk deploy til Netlify:

### Automatisk Deploy via Git

1. **Koble GitHub repository til Netlify:**
   - Gå til [netlify.com](https://netlify.com) og logg inn
   - Klikk "New site from Git"
   - Velg GitHub og autorisér tilgang
   - Velg `urso-side` repository

2. **Build innstillinger:** (automatisk fra `netlify.toml`)

   ```text
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

Se `docs/netlify-deploy.md` for detaljerte instruksjoner.

## Utviklingsinformasjon

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

### Bygging for produksjon

```bash
dotnet publish src/Frontend -c Release -o publish/frontend
dotnet publish src/Backend -c Release -o publish/backend
```

## Bidrag

Dette prosjektet følger Urso sine verdier:

- **Tillit**: Pålitelig kode og dokumentasjon
- **Kompetanse**: Beste praksis og moderne teknologi
- **Innovasjon**: Kreative løsninger og nye tilnærminger
- **Menneskelighet**: Fokus på brukeropplevelse og tilgjengelighet

## Getting Started

### Prerequisites

- .NET SDK 10.0 or later installed

### Running the Solution

1. Navigate to the project root.
2. Run `dotnet restore` to restore NuGet packages.
3. Run `dotnet build` to build the solution.

#### Running Backend Only

```bash
dotnet run --project src/Backend
```

#### Running Frontend Only

```bash
dotnet run --project src/Frontend
```

#### Running Tests

```bash
dotnet test
```

## Development

- **Testing Framework**: NUnit with NSubstitute for mocking
- **Language**: All UI text should be in Norwegian (Norsk)
- **Architecture**: Clean separation between API backend and frontend client

## Notes

Ensure both backend and frontend are running for the application to function correctly. The backend serves the API endpoints while the frontend provides the user interface.

## Deploy til Netlify

Prosjektet er konfigurert for automatisk deploy til Netlify:

### Automatisk Deploy via Git
1. **Koble GitHub repository til Netlify:**
   - Gå til [netlify.com](https://netlify.com) og logg inn
   - Klikk "New site from Git"
   - Velg GitHub og autorisér tilgang
   - Velg `urso-side` repository

2. **Build innstillinger:** (automatisk fra `netlify.toml`)
   ```
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

Se `docs/netlify-deploy.md` for detaljerte instruksjoner.
