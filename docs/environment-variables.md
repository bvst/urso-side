# Urso Netlify Environment Variables

Hvis du trenger å konfigurere environment variables for produksjon, kan du legge disse til i Netlify dashboard.

## Hvordan legge til Environment Variables

1. Gå til din site i Netlify dashboard
2. Naviger til **Site settings** → **Environment variables**
3. Klikk **"Add variable"**

## Anbefalte Variables

```bash
# .NET Environment
ASPNETCORE_ENVIRONMENT=Production

# Analytics (valgfritt)
GOOGLE_ANALYTICS_ID=GA-XXXXXXXXX

# Contact Form (valgfritt)
EMAILJS_SERVICE_ID=your_service_id
EMAILJS_TEMPLATE_ID=your_template_id
EMAILJS_PUBLIC_KEY=your_public_key

# Custom Domain (settes automatisk av Netlify)
URL=https://urso.no
```

## Bruk i Blazor

Du kan lese environment variables i Blazor WebAssembly via configuration:

```csharp
@inject IConfiguration Configuration

@code {
    private string? analyticsId = Configuration["GoogleAnalyticsId"];
}
```

## Sikkerhet

- ❌ **IKKE** legg til sensitive API keys som environment variables i frontend
- ✅ **BRUK** kun public keys og ikke-sensitive konfiguration
- ✅ **SENSITIVE DATA** bør håndteres via backend API
