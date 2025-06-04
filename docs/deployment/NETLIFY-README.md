# Urso - IT Konsulent Nettsider

En moderne, norsk IT-konsulent nettside bygget med Blazor WebAssembly.

## 🚀 Live Demo

Besøk den live nettsiden: [urso.netlify.app](https://urso.netlify.app) *(erstatt med faktisk Netlify URL)*

## ✨ Funksjoner

- 🇳🇴 **Fullt norsk språk** - Tilpasset det norske markedet
- 🎨 **Urso merkevareidentitet** - Dyp blå og bjørnebrun fargepalett  
- 📱 **Responsivt design** - Fungerer perfekt på mobil, nettbrett og desktop
- ⚡ **Blazor WebAssembly** - Rask, moderne single-page application
- 🔧 **IT-tjenester showcase** - Comprehensive oversikt over tjenester
- 📞 **Kontaktskjema** - Enkel måte for kunder å ta kontakt
- 🎯 **SEO optimalisert** - Klar for søkemotorer
- 🌐 **PWA klar** - Progressive Web App funksjoner

## 🏗️ Teknologi

- **Frontend**: Blazor WebAssembly (.NET 10)
- **Styling**: Custom CSS med moderne design
- **Deploy**: Netlify med automatisk CI/CD
- **Versjonskontroll**: Git med GitHub Actions

## 🎨 Design

Urso-nettsiden følger merkevareidentiteten:

- **Primærfarge**: Dyp blå (#1F3B4D)
- **Aksent**: Bjørnebrun (#6F4E37)  
- **Bakgrunn**: Lys grå (#F5F7FA)
- **Typografi**: Inter (brødtekst), Montserrat (overskrifter)
- **Stil**: Profesjonell, varm og tilgjengelig

## 📁 Prosjektstruktur

```text
urso-side/
├── src/
│   └── Frontend/          # Blazor WebAssembly app
├── docs/                  # Dokumentasjon
├── .github/workflows/     # GitHub Actions
├── netlify.toml          # Netlify konfigurasjon
└── build.sh|cmd          # Build scripts
```

## 🚀 Kom i gang

### Lokal utvikling

```bash
# Klon repository
git clone https://github.com/[username]/urso-side.git
cd urso-side

# Kjør applikasjonen
dotnet run --project src/Frontend

# Åpne http://localhost:5167
```

### Produksjon build

```bash
# Bygg for produksjon
dotnet publish src/Frontend -c Release -o dist --nologo

# Deploy mappen: dist/wwwroot
```

## 🌐 Deploy til Netlify

### Automatisk deploy

1. Fork dette repository
2. Koble til [Netlify](https://netlify.com)
3. Velg repository og deploy!

Build-innstillingene er konfigurert i `netlify.toml`:

```toml
[build]
  command = "dotnet publish src/Frontend -c Release -o dist --nologo"
  publish = "dist/wwwroot"
```

### Manuell deploy

Dra og slipp `dist/wwwroot` mappen til Netlify dashboard.

## 📄 Sider

- **Hjem**: Hero-seksjon, tjeneste-oversikt, verdier
- **Om oss**: Selskapsinformasjon og historie  
- **Tjenester**: Detaljert oversikt over IT-tjenester
- **Kontakt**: Kontaktinformasjon og skjema

## 🤝 Bidrag

Bidrag er velkomne! Vennligst:

1. Fork prosjektet
2. Opprett feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit endringene (`git commit -m 'Add some AmazingFeature'`)
4. Push til branchen (`git push origin feature/AmazingFeature`)
5. Åpne en Pull Request

## 📝 Lisens

Dette prosjektet er open source og tilgjengelig under [MIT License](LICENSE).

## 📞 Kontakt

### Urso IT Konsulent

- 🌐 Website: [urso.netlify.app](https://urso.netlify.app)
- 📧 Email: kontakt@urso.no
- 📱 Telefon:

---

*Bygget med ❤️ av Urso-teamet*
