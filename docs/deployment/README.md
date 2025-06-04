# 🚀 Urso Deployment Guide

Denne mappen inneholder all dokumentasjon for deployment av Urso-nettsiden til Netlify.

## 📋 Deployment Status

- ✅ **Live Site**: [urso.no](https://urso.no)
- ✅ **Build Status**: Successful (.NET 10 preview)
- ✅ **DNS Configuration**: Custom domain configured
- ✅ **Automated Deployment**: GitHub Actions workflow active

## 📚 Dokumentasjon

- **[DEPLOY-GUIDE.md](DEPLOY-GUIDE.md)** - Hovedguide for deployment til Netlify
- **[DEPLOYMENT-COMPLETE.md](DEPLOYMENT-COMPLETE.md)** - Komplett oversikt over prosjektoppsett

## 🛠️ Quick Deploy

Prosjektet er konfigurert for automatisk deployment via GitHub. Push endringer til main branch for å utløse deployment.

```powershell
git add .
git commit -m "Deploy updates"
git push origin main
```

## 🔧 Manual Build

For lokal testing av build-prosessen:

```powershell
# Windows
./build.ps1

# Linux/macOS  
./build.sh
```

## 📞 Support

For deployment-problemer, se dokumentasjonen eller kontakt utviklingsteamet.
