#!/bin/bash

# Installer .NET 10 SDK if not already installed
if ! command -v dotnet &> /dev/null; then
    echo "Installing .NET 10 SDK..."
    wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
    chmod +x dotnet-install.sh
    ./dotnet-install.sh --version 10.0.100-preview.3.25127.1 --install-dir ~/.dotnet
    export PATH="$HOME/.dotnet:$PATH"
fi

echo "Building Urso Frontend for production..."
dotnet --version

# Restore packages
dotnet restore src/Frontend

# Build and publish
dotnet publish src/Frontend -c Release -o dist --nologo

echo "Build completed successfully!"
echo "Deploy folder: dist/wwwroot"
