# Urso Website

Urso er et IT-konsulentselskap med navn inspirert av det portugisiske ordet for bjørn. 

- **Verdier:** Tillit, kompetanse, innovasjon, menneskelighet.
- **Stil:** Moderne, minimalistisk og profesjonelt.
- **Primærfarger:** Dyp blå (#1F3B4D), Bjørnebrun (#6F4E37)

This project consists of:

1. **Backend**: A .NET Core Web API project located in the `src/Backend` folder.
2. **Frontend**: A Blazor WebAssembly project located in the `src/Frontend` folder.
3. **Tests**: Unit tests located in the `test/Backend.Tests` folder.

## Project Structure

```
├── src/
│   ├── Backend/           # .NET Core Web API
│   └── Frontend/          # Blazor WebAssembly
├── test/
│   └── Backend.Tests/     # NUnit tests for Backend
├── docs/
│   └── brand-guidelines.md # Brand guidelines and design specifications
├── .gitignore             # Git ignore file
├── UrsoSide.sln          # Solution file
└── README.md             # This file
```

## Getting Started

### Prerequisites

- .NET SDK 10.0 or later installed

### Running the Solution

1. Navigate to the project root.
2. Run `dotnet restore` to restore NuGet packages.
3. Run `dotnet build` to build the solution.

#### Running Backend Only
```bash
dotnet run --project src/Backend
```

#### Running Frontend Only
```bash
dotnet run --project src/Frontend
```

#### Running Tests
```bash
dotnet test
```

## Development

- **Testing Framework**: NUnit with NSubstitute for mocking
- **Language**: All UI text should be in Norwegian (Norsk)
- **Architecture**: Clean separation between API backend and frontend client

## Notes

Ensure both backend and frontend are running for the application to function correctly. The backend serves the API endpoints while the frontend provides the user interface.
