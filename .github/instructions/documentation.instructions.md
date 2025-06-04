---
applyTo: '**/*.md'
---
# Dokumentasjon Instruksjoner for Urso

## Generelle Prinsipper
- Skriv klar, konsise og profesjonell dokumentasjon
- Bruk norsk språk for brukervendt dokumentasjon
- Følg Urso sine verdier: tillit, kompetanse, innovasjon, menneskelighet
- Inkluder praktiske eksempler og kodeblokker hvor relevant

## Struktur og Formatering
- Bruk konsistent Markdown-formatering
- Start med tydelig overskrift og kort beskrivelse
- Organiser innhold med passende overskriftsnivåer (H2, H3, etc.)
- Bruk lister for å gjøre informasjon lettere å skanne

### Markdown Linting Regler
- **MD022**: Overskrifter skal være omgitt av blanke linjer (over og under)
- **MD031**: Kodeblokker skal være omgitt av blanke linjer (over og under)
- **MD040**: Kodeblokker skal alltid ha språkspesifikasjon (```powershell, ```json, etc.)
- **MD032**: Lister skal være omgitt av blanke linjer (over og under)

## README Filer
- Inkluder alltid en kort beskrivelse av prosjektet
- List opp hovedfunksjoner med emojis for visuell appell
- Gi tydelige instruksjoner for "Kom i gang"
- Inkluder teknisk stack og arkitekturinformasjon
- Dokumenter bygge- og deploy-prosesser
- Følg markdown linting-regler for konsistent formatering

```markdown
# Prosjektnavn

Kort beskrivelse av prosjektet.

## 🚀 Funksjoner

- ✅ **Funksjon 1** - Beskrivelse
- ✅ **Funksjon 2** - Beskrivelse

## Kom i gang

### Forutsetninger

- Liste over nødvendige verktøy

### Installasjon

```bash
npm install
# eller
dotnet restore
```

## Dokumentasjon linker

- [Link til dokumentasjon](docs/)
```

## Kodeeksempler
- Inkluder språkspesifikk syntaks-highlighting for alle kodeblokker
- Bruk realistiske eksempler fra prosjektet
- Kommenter kompleks kode inline
- Vis både "før" og "etter" når det er relevant
- Omgi kodeblokker med blanke linjer over og under

```markdown
Eksempel på korrekt formatering:

Text før kodeblokk.

```powershell
# Bygg prosjektet
.\build.ps1 -Clean -Verbose
```

Text etter kodeblokk.
```

## Deploy Guider
- Start med oversikt over prosessen
- Gi både automatiske og manuelle alternativer
- Inkluder troubleshooting-seksjoner
- List opp nødvendige environment variables
- Dokumenter post-deploy verifikasjon

## Markdown Formatering Best Practices

### Overskrifter (MD022)
Alltid ha blank linje før og etter overskrifter:

```markdown
Text før overskrift.

## Min Overskrift

Text etter overskrift.
```

### Kodeblokker (MD031, MD040)
Omgi kodeblokker med blanke linjer og spesifiser språk:

```markdown
Text før kodeblokk.

```powershell
Write-Host "Hello World"
```

Text etter kodeblokk.
```

### Lister (MD032)
Omgi lister med blanke linjer:

```markdown
Text før liste.

- Element 1
- Element 2
- Element 3

Text etter liste.
```

## API Dokumentasjon
- Bruk OpenAPI/Swagger som hovedkilde
- Dokumenter alle endpoints med eksempler
- Inkluder feilkoder og feilhåndtering
- Vis request/response-eksempler

## Urso-Spesifikke Retningslinjer
- Bruk bjørn-emoji (🐻) sparsomt og passende
- Reflekter merkevareidentiteten i tone og språk
- Fokuser på praktisk nytte for utviklere og brukere
- Vis frem teknisk kompetanse uten å være overveldende

## Vedlikehold
- Oppdater dokumentasjon sammen med kodeendringer
- Verifiser at alle lenker og referanser fungerer
- Test instruksjonene på ren miljø regelmessig
- Arkiver utdatert dokumentasjon i stedet for å slette
- Kjør markdown linting før commit for å sikre kvalitet

## Linting og Kvalitetssikring

### Obligatoriske Markdown Linting Regler
- **MD022**: Blank linje over og under alle overskrifter
- **MD031**: Blank linje over og under alle kodeblokker
- **MD040**: Språkspesifikasjon på alle kodeblokker (```powershell, ```json, ```bash, etc.)
- **MD032**: Blank linje over og under alle lister

### Verktøy
- Bruk VS Code med markdownlint extension
- Kjør `markdownlint **/*.md` før commit
- Fiks alle linting-feil før pull request

## Tilgjengelighet
- Bruk beskrivende lenketekst
- Inkluder alt-tekst for bilder
- Strukturer innhold logisk med overskrifter
- Test med skjermlesere når mulig
