#! /usr/bin/env bash

set -euo pipefail

# Install GNU stow, curl and zsh
if [ "$(uname)" == "Darwin" ]; then
  brew install stow curl zsh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # let's stick with apt for now as package manager
  # most of my linux environments are debian based
  apt update
  apt install stow zsh curl --yes
else
  echo "OS not supported"
  exit 1
fi

