# Urso Netlify Deploy Guide

Denne guiden viser hvordan du deployer Urso-nettsiden til Netlify.

## Netlify Konfigurasjon

Prosjektet inneholder følgende Netlify-konfigurasjonsfiler:

- `netlify.toml` - Hovedkonfigurasjon for Netlify
- `build.sh` - Build script for Linux/macOS
- `build.cmd` - Build script for Windows

## Deploy til Netlify

### Metode 1: Git Integration (Anbefalt)

1. **Push koden til Git repository:**

   ```bash
   git add .
   git commit -m "Klar for Netlify deploy"
   git push origin main
   ```

2. **Koble til Netlify:**
   - Gå til [netlify.com](https://netlify.com)
   - Logg inn og klikk "New site from Git"
   - Velg GitHub/GitLab/Bitbucket og autorisér
   - Velg `urso-side` repository

3. **Build innstillinger:** (skal være automatisk fra netlify.toml)
   - **Build command:** `dotnet publish src/Frontend -c Release -o dist --nologo`
   - **Publish directory:** `dist/wwwroot`
   - **Node version:** Ikke nødvendig (.NET prosjekt)

4. **Deploy:**
   - Klikk "Deploy site"
   - Netlify vil automatisk bygge og deploye siden

### Metode 2: Manual Deploy

1. **Bygg lokalt:**

   ```powershell
   # Windows
   .\build.ps1
   
   # Linux/macOS
   ./build.sh
   ```

2. **Drag & Drop:**
   - Gå til [netlify.com](https://netlify.com)
   - Dra `dist/wwwroot` mappen til Netlify deploy området

## Netlify Funksjoner

### Automatisk Deploy

- Hver push til main branch trigger automatisk rebuild
- Deploy preview for pull requests
- Branch deploys for utvikling

### Optimalisering

- **Caching:** Statiske filer cache i 1 år
- **Compression:** Automatisk gzip komprimering  
- **CDN:** Global content delivery network

### Sikkerhet

- **HTTPS:** Automatisk SSL sertifikat
- **Headers:** Sikkerhetsheadere inkludert
- **CSP:** Content Security Policy konfigurert

## Custom Domain

1. **Legg til domene:**
   - Gå til Site settings → Domain management
   - Klikk "Add custom domain"
   - Skriv inn `urso.no` (eller ønsket domene)

2. **DNS Konfiguration:**
   - Pek A record til Netlify IP
   - Eller bruk Netlify DNS for enkel setup

## Environment Variables

For produksjon kan du legge til miljøvariabler:

1. Gå til Site settings → Environment variables
2. Legg til nødvendige variabler:
   - `ASPNETCORE_ENVIRONMENT=Production`
   - Andre API nøkler hvis nødvendig

## Troubleshooting

### Build Feil

- Sjekk at .NET 10 SDK er tilgjengelig
- Verifiser at alle dependencies er tilgjengelige
- Sjekk build logs i Netlify dashboard

### 404 Feil

- Sjekk at `publish` directory er `dist/wwwroot`
- Verifiser at SPA rewrite fungerer (se netlify.toml)
- Test routing lokalt først

### Performance

- Bruk Netlify Analytics for innsikt
- Optimaliser bilder med Netlify Image CDN
- Aktiver Brotli komprimering

## URLs

- **Netlify Dashboard:** [app.netlify.com](https://app.netlify.com)
- **Docs:** [docs.netlify.com](https://docs.netlify.com)
- **Support:** [answers.netlify.com](https://answers.netlify.com)
