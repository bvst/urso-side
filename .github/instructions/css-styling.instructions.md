---
applyTo: '**/*.css, **/*.scss'
---
# CSS/SCSS Styling Instruksjoner for Urso

## Fargebruk
- Bruk alltid CSS-variabler hvis de er definert (f.eks. `var(--primary-color)`, `var(--accent-color-brown)`).
- Hvis variabler ikke er definert, bruk følgende HEX-koder:
  - Primær (Dyp blå): `#1F3B4D`
  - Aksent (Bjørnebrun): `#6F4E37`
  - Bakgrunn (Lys grå): `#F5F7FA`
  - Aksent (Dempet grønn): `#88A095`
  - Hvit: `#FFFFFF`
- Sørg for god kontrast mellom tekst og bakgrunnsfarger for lesbarhet (WCAG AA).

## Typografi
- **Overskrifter (h1, h2, h3, etc.):**
  - Font-family: Montserrat, Poppins, Inter, sans-serif; (Bruk Montserrat som førstevalg)
- **Brødtekst (p, body, etc.):**
  - Font-family: Inter, sans-serif;
  - Font-size: 14px-16px (standard 16px);
  - Line-height: 1.5;

## Grafiske Elementer
- Vurder subtile piksel-inspirerte border-detaljer eller bakgrunner der det passer.
- Bruk av kode-symboler (`< />`) skal være stilistisk og ikke forstyrrende.
- Foretrekk enkle, geometriske former for dekorative bakgrunner.

## Interaktive Tilstander
- Alle interaktive elementer (knapper, lenker, input-felt) skal ha tydelige `:hover`, `:focus`, og `:active` tilstander som følger fargepaletten.