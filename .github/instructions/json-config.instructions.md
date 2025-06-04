---
applyTo: '**/*.json'
---
# JSON Konfigurasjon Instruksjoner for Urso

## Generelle Prinsipper
- Bruk konsistent formatering og innrykk (2 eller 4 spaces)
- Sorter keys alfabetisk når det er praktisk
- Bruk beskrivende egenskapsnavn
- Valider JSON syntax før commit

## Package.json Struktur
```json
{
  "name": "urso-frontend",
  "version": "1.0.0",
  "description": "Urso IT-konsulent frontend applikasjon",
  "main": "index.js",
  "scripts": {
    "build": "dotnet publish -c Release",
    "dev": "dotnet run",
    "test": "dotnet test"
  },
  "keywords": ["urso", "it-konsulent", "blazor", "frontend"],
  "author": "Urso Team",
  "license": "MIT"
}
```

## Project Files (.csproj som JSON-lignende)
- Organiser properties logisk
- Bruk beskrivende kommentarer
- Gruppér relaterte ItemGroups
- Versjon dependencies eksplisitt

## Configuration Files (appsettings.json)
```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft.AspNetCore": "Warning"
    }
  },
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=UrsoDb;Trusted_Connection=true"
  },
  "Urso": {
    "CompanyName": "Urso IT-konsulent",
    "ContactEmail": "kontakt@urso.no",
    "Features": {
      "EnableAnalytics": true,
      "EnableContactForm": true
    }
  }
}
```

## Environment-Specific Configuration
- Bruk miljø-spesifikke filer (appsettings.Development.json)
- Aldri commit sensitive data som passwords
- Bruk environment variables for secrets
- Dokumenter alle konfigurasjonsverdier

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "Microsoft.AspNetCore": "Information"
    }
  },
  "Urso": {
    "Features": {
      "EnableAnalytics": false,
      "EnableContactForm": true,
      "DebugMode": true
    }
  }
}
```

## Launch Settings (launchSettings.json)
```json
{
  "profiles": {
    "http": {
      "commandName": "Project",
      "dotnetRunMessages": true,
      "launchBrowser": true,
      "applicationUrl": "http://localhost:5167",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    },
    "https": {
      "commandName": "Project",
      "dotnetRunMessages": true,
      "launchBrowser": true,
      "applicationUrl": "https://localhost:7167;http://localhost:5167",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
```

## API Response Formats
- Bruk konsistente property names (camelCase for JSON)
- Inkluder metadata for paginering og status
- Implementer standard error response format
- Versjonér API responses

```json
{
  "data": {
    "users": [
      {
        "id": "123",
        "name": "Ola Nordmann",
        "email": "ola@example.com",
        "role": "admin"
      }
    ]
  },
  "meta": {
    "totalCount": 150,
    "page": 1,
    "pageSize": 10
  },
  "success": true,
  "timestamp": "2025-01-01T12:00:00Z"
}
```

## Error Response Format
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validering feilet",
    "details": [
      {
        "field": "email",
        "message": "E-post adresse er påkrevd"
      }
    ]
  },
  "timestamp": "2025-01-01T12:00:00Z"
}
```

## Manifest Files
```json
{
  "name": "Urso IT-konsulent",
  "short_name": "Urso",
  "description": "Pålitelig IT-konsulent med menneskelig varme",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#1F3B4D",
  "theme_color": "#6F4E37",
  "icons": [
    {
      "src": "/icon-192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/icon-512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

## Internationalization (i18n)
```json
{
  "nav": {
    "home": "Hjem",
    "about": "Om oss",
    "services": "Tjenester",
    "contact": "Kontakt"
  },
  "hero": {
    "title": "IT-konsulent med menneskelig varme",
    "subtitle": "Vi leverer kompetente teknologiløsninger med forståelse og tillit"
  },
  "contact": {
    "email": "kontakt@urso.no",
    "phone": "+47 123 45 678"
  }
}
```

## Test Configuration
```json
{
  "testRunner": "NUnit",
  "coverageThreshold": {
    "global": {
      "branches": 80,
      "functions": 80,
      "lines": 80,
      "statements": 80
    }
  },
  "testPathIgnorePatterns": [
    "/bin/",
    "/obj/"
  ]
}
```

## Urso-Spesifikke Konvensjoner
- Bruk norske beskrivelser i user-facing JSON
- Inkluder Urso merkevarefarger i tema-konfigurasjoner
- Følg norske formater for datoer og tall
- Prioriter tilgjengelighet i konfigurasjon

```json
{
  "urso": {
    "brand": {
      "colors": {
        "primary": "#1F3B4D",
        "accent": "#6F4E37",
        "background": "#F5F7FA"
      },
      "fonts": {
        "heading": "Montserrat",
        "body": "Inter"
      }
    },
    "locale": {
      "language": "no",
      "dateFormat": "dd.mm.yyyy",
      "numberFormat": "no-NO"
    }
  }
}
```

## Sikkerhet og Validering
- Aldri inkluder API keys eller passord
- Bruk environment variables for sensitive data
- Valider JSON schema for viktige konfigurasjoner
- Implementer input sanitization

## Performance Considerations
- Minimiser JSON file sizes
- Bruk compression for store JSON filer
- Cache konfigurasjoner når mulig
- Unngå dype nesting strukturer

## Dokumentasjon
- Kommenter komplekse konfigurasjoner
- Dokumenter alle tilgjengelige options
- Inkluder eksempler for vanlige use cases
- Hold dokumentasjon synkronisert med endringer
