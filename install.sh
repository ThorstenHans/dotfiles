#! /usr/bin/env bash

set -euo pipefail

cd "$(dirname "$0")"

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

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
if [[ ! -d "$XDG_CONFIG_HOME" ]]; then
  mkdir -p "$XDG_CONFIG_HOME"
fi

# Link dotfiles
echo "# Linking dotfiles to $HOME"
stow -R -t "$HOME" zsh-init
stow -R -t "$HOME" npm

echo "# Linking dotfiles to $XDG_CONFIG_HOME"
stow --ignore 'zsh-init' --ignore 'npm' -R -t "$XDG_CONFIG_HOME" .

# Install TPM if not already present
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  echo "# Installing TPM (tmux plugin manager)"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
