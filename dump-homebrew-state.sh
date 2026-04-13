#!/bin/bash

echo "----------------------------------------------------"
echo "🔍  Scanning system for Homebrew packages..."
echo "----------------------------------------------------"

# Run the bundle dump
if brew bundle dump --force --describe; then
  echo "✅ Success! Your Brewfile has been updated."
else
  echo "❌ Error: Failed to dump Homebrew dependencies."
  exit 1
fi

echo "----------------------------------------------------"
echo "💡 Next step: git add Brewfile && git commit -sm 'Update Brewfile'"
