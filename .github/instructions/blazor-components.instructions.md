---
applyTo: '**/*.razor'
---
# Blazor Komponent Instruksjoner for Urso

## Generell Struktur

- Komponenter skal være godt strukturerte og enkle å forstå.
- **Foretrekk code-behind separation** for komplekse komponenter med mye C#-logikk.
- Bruk parameterattributter (`[Parameter]`) for input.
- Organiser relaterte filer i egne mapper for bedre struktur.

## Code-Behind Best Practices

### For enkle komponenter
- Bruk `@code {}` blokken direkte i .razor-filen for enkel logikk.

### For komplekse komponenter (anbefalt tilnærming)
1. **Opprett base-klasse**: `ComponentNameBase.cs` som arver fra `ComponentBase`
2. **Bruk inheritance**: `@inherits ComponentNameBase` i .razor-filen
3. **Protected medlemmer**: Bruk `protected` for felt og metoder som skal være tilgjengelige i markup
4. **Namespace**: Følg prosjektets navnekonvensjon (`Frontend.Pages`, `Frontend.Components`, etc.)

### Eksempel på code-behind struktur:
```csharp
// ContactBase.cs
using Microsoft.AspNetCore.Components;
using Frontend.Models;

namespace Frontend.Pages;

public class ContactBase : ComponentBase
{
    protected ContactFormModel contactForm = new();
    protected bool isSubmitting = false;
    protected string submitMessage = "";
    protected bool submitSuccess = false;

    protected async Task HandleSubmit()
    {
        // Implementation
    }
}
```

```razor
<!-- Contact.razor -->
@page "/contact"
@inherits ContactBase

<!-- Markup her -->
```

### Fordeler med inheritance over partial classes:
- Unngår kompilerings-konflikter med Blazor's auto-genererte partial classes
- Tydeligere separasjon mellom UI og logikk
- Enklere testing og vedlikehold
- Bedre IntelliSense-støtte

## Organisering og Mappestruktur

### For større komponenter eller sider:
- Opprett egen mappe: `Pages/ComponentName/`
- Inkluder alle relaterte filer:
  - `ComponentName.razor` (markup)
  - `ComponentName.razor.css` (styling)
  - `ComponentNameBase.cs` (logikk)
  - Eventuelle modeller eller hjelpeklasser

### Eksempel mappestruktur:
```
Pages/
├── Contact/
│   ├── Contact.razor
│   ├── Contact.razor.css
│   ├── ContactBase.cs
│   └── ContactFormModel.cs (hvis spesifikk for denne siden)
├── About/
│   ├── About.razor
│   ├── About.razor.css
│   └── AboutBase.cs
└── Services/
    ├── Services.razor
    ├── Services.razor.css
    └── ServicesBase.cs
```

## Styling

- Referer til globale CSS/SCSS-stiler for farger og typografi der det er mulig.
- For komponent-spesifikk styling, bruk CSS isolation (`Component.razor.css`).
- UI-elementer skal følge prinsippene for responsivt design og intuitive interaksjoner.
- Følg Urso's fargepalett og typografi-retningslinjer.

## Tekst og Innhold

- Tekst generert for komponenter skal følge "Tone of Voice" definert i globale instruksjoner (vennlig, kompetent, forståelig).
- Bruk `placeholder`-tekst som er meningsfull og følger tone of voice.
- Alle brukervendte tekster skal være på norsk med mindre annet er spesifisert.

## Tekniske Krav

- Bruk `@using` direktiver i `_Imports.razor` for å unngå repetitive using-statements.
- Implementer proper error handling i async-metoder.
- Følg C# naming conventions (PascalCase for public medlemmer, camelCase for private).
- Kommentér kompleks logikk på norsk eller engelsk.

## JavaScript-Integrasjon

### Timing og DOM-opplasting
- **Ikke bruk standard DOMContentLoaded** for å manipulere elementer rendret av Blazor, da dette kjører for tidlig.
- **Bruk livssyklusmetoder** for å sikre at JavaScript kjøres etter at Blazor har rendret komponentene:
  - `OnAfterRenderAsync(bool firstRender)` er det ideelle tidspunktet for å kalle JavaScript.
  - Bruk `firstRender`-parameteren for å unngå unødvendige kall ved re-rendring.

### Struktur for JavaScript-interaksjon
1. **Global JavaScript-funksjon**: Pakk inn komponentspesifikk logikk i navngitte globale funksjoner:
   ```javascript
   // urso.js
   window.funksjonsNavn = function() {
       // Implementering som finner og manipulerer DOM-elementer
   };
   ```

2. **Blazor-komponent invokering**:
   ```csharp
   [Inject] protected IJSRuntime JSRuntime { get; set; } = default!;
   
   protected override async Task OnAfterRenderAsync(bool firstRender)
   {
       if (firstRender)
       {
           await JSRuntime.InvokeVoidAsync("funksjonsNavn");
       }
   }
   ```

### Eksempel på JS/Blazor-interaksjon
For komponenter med interaktivitet som mobilnavigasjon, modaler eller dynamiske skjemaer:

```javascript
// urso.js
window.initializeUrsoNavigation = function() {
    const navToggle = document.querySelector('.nav-toggle');
    const navMenu = document.querySelector('.nav-menu');
    
    if (navToggle && navMenu) {
        navToggle.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            navToggle.classList.toggle('active');
        });
    }
};
```

```csharp
// MainLayoutBase.cs
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;

namespace Frontend.Layout;

public class MainLayoutBase : LayoutComponentBase
{
    [Inject] protected IJSRuntime JSRuntime { get; set; } = default!;
    
    protected override async Task OnAfterRenderAsync(bool firstRender)
    {
        if (firstRender)
        {
            await JSRuntime.InvokeVoidAsync("initializeUrsoNavigation");
        }
    }
}
```

### Best practices
- Initialiser JavaScript kun når nødvendig, vanligvis én gang når komponenten først rendres.
- Unngå å integrere inline JavaScript i .razor-filer.
- Bruk data-attributter for å markere elementer som skal manipuleres med JavaScript.
- Implementer feilhåndtering for JavaScript-kall (`try-catch` i C#).
- Vurder tilbakekallsfunksjoner fra JavaScript til .NET for kompleks interaksjon.

## Eksempel på prompt for ny komponent

// "Lag en Blazor-komponent for et profilkort med code-behind separation.
// Informasjon som skal vises: Navn, Tittel, Kort biografi.
// Styling: Bruk primærfarge for navnefeltets bakgrunn, hvit tekst. Resten av kortet lys grå bakgrunn.
// Font: Overskrifter i Montserrat, bio i Inter.
// Organiser i egen mappe: Components/ProfileCard/"
