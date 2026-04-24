# Thorsten's dotfiles

My personal development environment configurations for macOS. Managed with `stoq` and organized for quick bootstrapping on new machines.

## 🚀 Quick Start

### 1. Clone the repo

```bash
git clone [https://github.com/ThorstenHans/dotfiles.git](https://github.com/ThorstenHans/dotfiles.git) ~/dotfiles
cd ~/dotfiles
```

## Installation

Run `install.sh` to link all the `dotfiles`. 


## Install Software

Once `install.sh` has finished, run `install-software.sh`


## Upgrading the `Brewfile`

The [`Brewfile`](./Brewfile) contains a list of all software installed via Homebrew (formulas, casks, ...). To update the `Brewfile`, run the following command:

```bash
brew bundle dump --force --describe
```

## Local `pre-commit` hook

To prevent yourself from leaking sensitive data, I highly recommend running `gitleaks` as part of a `pre-commit` hook.

Create `.git/hooks/pre-commit` and ensure it is executable

```bash
#!/usr/bin/env bash

set -euo pipefail

gitleaks git --pre-commit --redact --staged --verbose
```

