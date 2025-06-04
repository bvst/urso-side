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

### Automatisert Validering 🤖

Urso-prosjektet har et komplett valideringssystem som automatisk håndhever alle markdown-standarder:

- **Real-time validering**: VS Code gir umiddelbar tilbakemelding mens du redigerer
- **Pre-commit hooks**: Forhindrer commit av ikke-kompatible filer
- **Bulk auto-fixing**: Automatisk rettelse av alle formatfeil

#### Validering Kommandoer

```powershell
# Valider alle markdown-filer
markdownlint **/*.md --config .markdownlint.json

# Auto-fiks alle rettbare problemer
markdownlint **/*.md --config .markdownlint.json --fix

# Komplett Urso-standarder validering
pwsh -File .\validate-urso-standards.ps1
```

#### VS Code Integration

- Command Palette → "Tasks: Run Task" → "validate-markdown"
- Command Palette → "Tasks: Run Task" → "validate-urso-standards"

## README Filer

- Inkluder alltid en kort beskrivelse av prosjektet
- List opp hovedfunksjoner med emojis for visuell appell
- Gi tydelige instruksjoner for "Kom i gang"
- Inkluder teknisk stack og arkitekturinformasjon
- Dokumenter bygge- og deploy-prosesser

**Formatering**: All markdown-formatering håndteres automatisk av valideringssystemet.

## Kodeeksempler

- Inkluder språkspesifikk syntaks-highlighting for alle kodeblokker
- Bruk realistiske eksempler fra prosjektet
- Kommenter kompleks kode inline
- Vis både "før" og "etter" når det er relevant

**Merk**: All formatering (blanke linjer, språkspesifikasjon, etc.) håndteres automatisk av valideringssystemet.

## Deploy Guider

- Start med oversikt over prosessen
- Gi både automatiske og manuelle alternativer
- Inkluder troubleshooting-seksjoner
- List opp nødvendige environment variables
- Dokumenter post-deploy verifikasjon

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

### Automatisert Kvalitetssikring

Urso-prosjektet har implementert omfattende automatisering for dokumentkvalitet:

- **Kontinuerlig validering**: Alle markdown-filer valideres automatisk
- **Pre-commit kontroll**: Git hooks forhindrer problematiske commits
- **Bulk-reparasjon**: Enkle kommandoer for å fikse alle formateringsproblemer
- **Integrert arbeidsflyt**: Validering tilgjengelig direkte i VS Code

For detaljer om valideringssystemet, se: `docs/development/STANDARDS-ENFORCEMENT.md`

## Tilgjengelighet

- Bruk beskrivende lenketekst
- Inkluder alt-tekst for bilder
- Strukturer innhold logisk med overskrifter
- Test med skjermlesere når mulig
