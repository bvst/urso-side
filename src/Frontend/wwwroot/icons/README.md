# 🐻 Urso Ikoner

Dette dokumentet beskriver ikon-systemet for Urso-nettstedet.
Som en refleksjon av Urso sine kjerneverdier om tillit og kompetanse,
har vi implementert et robust og profesjonelt ikonsystem.

## 📋 Oversikt

Urso-nettstedet bruker et sett med tilpassede ikoner basert på merkevareidentiteten,
som sikrer en konsistent og profesjonell brukeropplevelse på tvers av enheter:

- `favicon-16x16.png` og `favicon-32x32.png` - Standard favicons for nettlesere
- `apple-touch-icon.png` - For iOS-enheter når nettsiden legges til på hjemskjerm
- `android-chrome-192x192.png` og `android-chrome-512x512.png` - For Android-enheter
- `safari-pinned-tab.svg` - Monokrom SVG for Safari festede faner
- `site.webmanifest` - Konfigurasjonsfil for Progressive Web App (PWA) funksjonalitet

Alle ikoner er generert med Urso merkevarefarger:

- Primærfarge (Dyp blå): `#1F3B4D`
- Aksentfarge (Bjørnebrun): `#6F4E37`

## 🛠️ Ikongenerering

Ikonfiler genereres automatisk med PowerShell-skriptet `UrsoIcons.ps1`, en innovativ
løsning som demonstrerer Urso sin tekniske kompetanse og tilnærming til effektiv utvikling.

### 📚 Bruksanvisning

```powershell
# Generer ikoner hvis de mangler
.\UrsoIcons.ps1

# Tving generering av alle ikoner (overskriver eksisterende)
.\UrsoIcons.ps1 -Force

# Slett eksisterende ikoner før generering
.\UrsoIcons.ps1 -Clean
```

Konsistente og korrekte ikoner er en viktig del av Urso sin profesjonelle merkevare,
og reflekterer vår verdi om pålitelighet og oppmerksomhet til detaljer.

### 🔧 Tekniske Detaljer

Skriptet bruker System.Drawing for å generere PNG-filer programmatisk.
Dette sikrer at vi har nøyaktig kontroll over fargene og utseendet på ikonene,
og demonstrerer vår tekniske kompetanse og innovative tilnærming til utvikling.

## 💻 HTML Implementasjon

Ikonene er referert i `index.html` med følgende kode:

```html
<!-- Favicon and app icons -->
<link rel="icon" type="image/png" sizes="32x32" href="icons/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="icons/favicon-16x16.png" />
<link rel="apple-touch-icon" sizes="180x180" href="icons/apple-touch-icon.png" />
<link rel="manifest" href="icons/site.webmanifest" />
<link rel="mask-icon" href="icons/safari-pinned-tab.svg" color="#1F3B4D" />
<meta name="msapplication-TileColor" content="#1F3B4D" />
<meta name="theme-color" content="#1F3B4D" />
```

## 🚀 Produksjonsanbefalinger

De genererte ikonene er midlertidige og ment for utviklingsformål. For produksjonsbruk anbefales det å:

1. Engasjere en profesjonell designer for å skape optimaliserte ikoner
2. Sikre at alle ikoner følger merkevareretningslinjene
3. Teste ikoner på alle relevante enheter og nettlesere

Denne tilnærmingen er i tråd med Urso sine verdier om høy kvalitet og profesjonalitet.

## 🔍 Feilsøking

Hvis du støter på problemer med ikongenerering, sjekk følgende:

| Problem | Løsning | Verdi |
|---------|---------|-------|
| Feil ved oppretting | Kontroller at PowerShell støtter System.Drawing | Kompetanse |
| Ikoner vises ikke | Verifiser at HTML-referansene er korrekte | Tillit |
| Feil farger i ikoner | Sjekk fargedefinisjoner i `UrsoIcons.ps1` | Presisjon |

Den menneskelige tilnærmingen til tekniske problemer er viktig for Urso,
og reflekterer vår verdi om å kombinere teknisk kompetanse med forståelse.
