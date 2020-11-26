# my dot-files

This repository contains my current dot-files as of November 2020.

## Installation

- Clone the repository to your home directory
  - you should end up finding this repo at `~/dotfiles/README.md`
- Invoke the install script (`~/dotfiles/install.sh`)

## Dependencies

- if executed on MacOS, [Homebrew](https://brew.sh/) must be installed.

## Limitations

- Currently, the clone has to be located at `$HOME/dotfiles`.
- Custom fonts for [Powerlevel 10k](https://github.com/romkatv/powerlevel10k) have to be installed afterwards using `p10k` executable

## Whats included

- Azure CLI configuration
- Several [aliases](zsh/aliases.zsh) 
- [EditorConfig](https://editorconfig.org/)
- Git (config and global ignore)
- `curl` and `zsh` will be installed if not present on the system
- ZSH
  - [antigen](https://github.com/zsh-users/antigen)
  - [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
  - [Powerlevel 10k](https://github.com/romkatv/powerlevel10k)
  - Several plugins according to [zsh/zshrc.zsh](zsh/zshrc.zsh)
