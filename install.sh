#! /usr/bin/env bash

set -euo pipefail

check_for_binary() {
  if ! command -v $1 &>/dev/null; then
    echo "$1 is not installed"
    exit 1
  fi
}

echo "# Checking if necessary applications are installed"
check_for_binary stow
check_for_binary zsh
check_for_binary fzf
check_for_binary zoxide
check_for_binary starship
echo " Necessary binaries are installed"

# Link dotfiles
echo "# Linking dotfiles to $HOME"
if [[ -f "$HOME/.zshenv" ]]; then
  rm $HOME/.zshenv
fi
stow -t $HOME zsh-init
stow -t $HOME npm

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
  mkdir -p "$XDG_CONFIG_HOME"
fi

echo "# Linking dotfiles to $XDG_CONFIG_HOME"
stow --ignore \zsh-init --ignore \npm -t $XDG_CONFIG_HOME .
