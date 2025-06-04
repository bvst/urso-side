---
applyTo: '**/*.toml, **/netlify.toml, **/*.yml, **/*.yaml'
---
# Deploy og Konfigurasjon Instruksjoner for Urso

## Netlify Konfigurasjon (netlify.toml)

- Bruk klare og beskrivende kommentarer på norsk
- Inkluder alle nødvendige headers for sikkerhet og ytelse
- Konfigurer SPA routing for Blazor WebAssembly
- Sett opp caching-strategier for optimal ytelse

```toml
# Netlify konfigurasjon for Urso Blazor WebAssembly
[build]
  # Bygger Blazor WebAssembly til wwwroot/
  command = "dotnet publish src/Frontend -c Release -o dist --nologo"
  # Deploy mappen som inneholder den statiske nettsiden
  publish = "dist/wwwroot"

[build.environment]
  # Spesifiserer .NET versjon
  DOTNET_VERSION = "10.0"
```

## GitHub Actions (*.yml,*.yaml)

- Bruk beskrivende navn for workflows og jobs
- Inkluder kommentarer for komplekse steps
- Følg beste praksis for sikkerhet (secrets, permissions)
- Test workflows grundig før produksjon

```yaml
name: Deploy to Netlify

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - name: Checkout code
      uses: actions/checkout@v4
```

## Environment Variables

- Dokumenter alle nødvendige miljøvariabler
- Bruk beskrivende navn og kommentarer
- Skil mellom development og production
- Aldri commit sensitive verdier

```bash
# .NET Environment
ASPNETCORE_ENVIRONMENT=Production

# Analytics (valgfritt)
GOOGLE_ANALYTICS_ID=GA-XXXXXXXXX
```

## Sikkerhetshensyn

- Implementer Content Security Policy (CSP)
- Bruk HTTPS-only i produksjon
- Sett sikkerhetshardere (X-Frame-Options, etc.)
- Konfigurer CORS riktig for API-tilgang

```toml
[[headers]]
  for = "/*"
  [headers.values]
    X-Frame-Options = "DENY"
    X-Content-Type-Options = "nosniff"
    Content-Security-Policy = "default-src 'self'"
```

## Performance Optimalisering

- Aktiver komprimering (Gzip/Brotli)
- Sett lange cache-tider for statiske ressurser
- Bruk CDN for global distribusjon
- Optimaliser bildeformater og størrelser

```toml
[[headers]]
  for = "/_framework/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000, immutable"
```

## Urso-Spesifikke Konfigurasjoner

- Bruk norske kommentarer i konfigurasjonsfiler
- Følg Urso sine merkevareretningslinjer
- Sørg for konsistens på tvers av miljøer
- Prioriter brukervennlighet og tilgjengelighet

## Versjonshåndtering

- Tag releases med semantisk versjonering
- Dokumenter breaking changes
- Oppretthold backwards compatibility når mulig
- Test deployments på staging før produksjon

## Monitoring og Logging

- Konfigurer feilrapportering
- Sett opp ytelsesovervåkning
- Aktiver strukturert logging
- Implementer health checks

## Backup og Disaster Recovery

- Dokumenter backup-strategier
- Test gjenopprettingsprosedyrer
- Oppretthold redundans på kritiske tjenester
- Sett opp automatiske alerts
