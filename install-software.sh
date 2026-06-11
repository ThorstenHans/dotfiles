#!/usr/bin/env bash

set -euo pipefail

# Ensure the script runs from the directory where it is located
# This allows it to find the 'Brewfile' sitting next to it
cd "$(dirname "$0")"

echo "----------------------------------------------------"

# Check for Xcode Command Line Tools (required by Homebrew and git)
if ! xcode-select -p &>/dev/null; then
  echo "Xcode Command Line Tools not found. Installing..."
  xcode-select --install
  echo "Please complete the installation dialog, then re-run this script."
  exit 1
fi

echo "🚀  Initializing Homebrew installation..."
echo "📂  Reading from: $(pwd)/Brewfile"
echo "----------------------------------------------------"

# Check if Brewfile actually exists in the current directory
if [ ! -f "Brewfile" ]; then
  echo "❌ Error: Brewfile not found in $(pwd)"
  echo "Make sure your Brewfile is in the same folder as this script."
  exit 1
fi

# Check if Homebrew is installed, install it if not
if ! command -v brew &>/dev/null; then
  echo "🍺 Homebrew not found. Installing it now..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "📦 Installing dependencies (this may take a while)..."
echo "----------------------------------------------------"

if brew bundle; then
  echo "----------------------------------------------------"
  echo "✅ Success! All Brewfile dependencies are installed."
else
  echo "----------------------------------------------------"
  echo "⚠️  Some items failed to install."
  echo "Check the output above for specific errors."
  exit 1
fi
