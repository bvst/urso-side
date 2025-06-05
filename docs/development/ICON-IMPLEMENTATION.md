# 🐻 Urso Ikon Implementasjon

## 📋 Oversikt

Dette dokumentet beskriver implementasjonen av Urso-spesifikke ikoner for nettstedet,
inkludert løsningen på tidligere problemer med ikonvisning. I tråd med Urso sine verdier om
tillit og kompetanse, sikrer denne implementasjonen at nettstedets visuelle identitet
reflekterer vår merkevare på en konsistent og profesjonell måte.

## 🛠️ Problemløsning og Implementasjon

### 🔍 Problem

Urso-nettstedet brukte tidligere standard Blazor ikoner istedenfor tilpassede ikoner med Urso merkevare.
Ikonfiler som skulle vært binære PNG-filer var feilaktig lagret som tekstfiler. Dette var i strid med
vår verdi om kompetanse og profesjonalitet i alle aspekter av vår tekniske implementasjon.

### ✅ Løsning

1. Utviklet et robust PowerShell-script (`UrsoIcons.ps1`) som genererer alle nødvendige ikonfiler,
   som demonstrerer Urso sin innovative tilnærming til tekniske utfordringer:
   - favicon-16x16.png og favicon-32x32.png
   - apple-touch-icon.png
   - android-chrome-192x192.png og android-chrome-512x512.png
   - safari-pinned-tab.svg
   - site.webmanifest for PWA-funksjonalitet

2. Implementerte ikongenereringslogikk med System.Drawing som:
   - Følger Urso fargepalett
   - Bruker anti-aliasing for høy kvalitet
   - Tilpasser detaljer basert på ikonstørrelse
   - Håndterer feil robust

3. Sikret at alle ikonfiler er:
   - Korrekt formaterte binærfiler (ikke tekst)
   - I riktige størrelser for ulike enheter og nettlesere
   - Passer med Urso merkevare
   - Implementert med en pålitelig løsning som reflekterer vår verdi om tillit

## 📚 Bruksanvisning

### 🔧 Generering av Ikoner

`UrsoIcons.ps1`-scriptet finnes i rotkatalogen og brukes for å generere alle nødvendige ikonfiler:

```powershell
# Standard generering
.\UrsoIcons.ps1

# Overskriver eksisterende filer
.\UrsoIcons.ps1 -Force

# Sletter først, så genererer nye
.\UrsoIcons.ps1 -Clean
```

### 💻 HTML Implementasjon

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

## 🔬 Tekniske Detaljer

### 🎨 Ikondesign

Ikonene følger Urso sin merkevareidentitet med følgende hovedkomponenter:

- Bakgrunnsfarge: Urso primærfarge (Dyp blå `#1F3B4D`)
- Bjørnefigur: Urso aksentfarge (Bjørnebrun `#6F4E37`)
- Detaljer som øyne, nese osv. for større ikonstørrelser

### 📄 Ytterligere Dokumentasjon

For mer tekniske detaljer, se:

- `src\Frontend\wwwroot\icons\README.md` - Teknisk dokumentasjon for utviklere
- `UrsoIcons.ps1` - Selve scriptet har omfattende kommentarer og hjelpetekst

## 🚀 Produksjonsanbefalinger

De genererte ikonene er midlertidige og beregnet for utvikling.
For produksjon anbefales det å engasjere en profesjonell designer for å skape optimaliserte ikoner
i tråd med merkevareretningslinjene i `docs/brand-guidelines.md`. Dette sikrer at vår
visuelle identitet holder høyeste kvalitet, noe som reflekterer Urso sine verdier om
kompetanse og profesjonalitet.

## 🔧 Feilsøking

### Vanlige problemer

| Problem | Løsning | Verdi |
|---------|---------|-------|
| Ikoner genereres ikke | Sjekk at System.Drawing er tilgjengelig i PowerShell | Kompetanse |
| Ikoner har feil format | Bruk `-Force` flagget for å regenerere | Innovasjon |  
| Farger ser ikke korrekte ut | Verifiser at riktig fargepalett er brukt i scriptet | Tillit |

Denne seksjonen viser Urso sin menneskelige tilnærming til tekniske utfordringer,
og gir praktiske løsninger som reflekterer våre kjerneverdier.
