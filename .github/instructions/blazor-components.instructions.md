---
applyTo: '**/*.razor'
---
# Blazor Komponent Instruksjoner for Urso

## Generell Struktur
- Komponenter skal være godt strukturerte og enkle å forstå.
- Bruk `@code {}` blokken for C#-logikk.
- Bruk parameterattributter (`[Parameter]`) for input.

## Styling
- Referer til globale CSS/SCSS-stiler for farger og typografi der det er mulig.
- For komponent-spesifikk styling, vurder CSS isolation (`Component.razor.css`).
- UI-elementer skal følge prinsippene for responsivt design og intuitive interaksjoner.

## Tekst og Innhold
- Tekst generert for komponenter skal følge "Tone of Voice" definert i globale instruksjoner (vennlig, kompetent, forståelig).
- Bruk `placeholder`-tekst som er meningsfull og følger tone of voice.

## Eksempel på prompt for ny komponent:
// "Lag en Blazor-komponent for et profilkort.
// Informasjon som skal vises: Navn, Tittel, Kort biografi.
// Styling: Bruk primærfarge for navnefeltets bakgrunn, hvit tekst. Resten av kortet lys grå bakgrunn.
// Font: Overskrifter i Montserrat, bio i Inter."