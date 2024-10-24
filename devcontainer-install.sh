#! /usr/bin/env bash

set -euo pipefail

echo "## Checking if necessary applications are installed"
check_for_binary stow
check_for_binary curl
check_for_binary zsh


# First let's detect if we are running on Linux or MacOS
# Install GNU stow, curl and zsh
if [ "$(uname)" == "Darwin" ]; then
  brew install stow curl zsh
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ];
  # let's stick with apt for now as package manager
  # most of my linux environments are debian based
  apt update
  apt install stow zsh curl --yes
else
  echo "OS not supported"
  exit 1
fi

