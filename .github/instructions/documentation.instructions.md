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

## README Filer
- Inkluder alltid en kort beskrivelse av prosjektet
- List opp hovedfunksjoner med emojis for visuell appell
- Gi tydelige instruksjoner for "Kom i gang"
- Inkluder teknisk stack og arkitekturinformasjon
- Dokumenter bygge- og deploy-prosesser

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
```

## Kodeeksempler
- Inkluder språkspesifikk syntaks-highlighting
- Bruk realistiske eksempler fra prosjektet
- Kommenter kompleks kode inline
- Vis både "før" og "etter" når det er relevant

```markdown
```powershell
# Bygg prosjektet
.\build.ps1 -Clean -Verbose
```
```

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

## Tilgjengelighet
- Bruk beskrivende lenketekst
- Inkluder alt-tekst for bilder
- Strukturer innhold logisk med overskrifter
- Test med skjermlesere når mulig
