# Thorsten's dotfiles

My personal development environment configurations for macOS. Managed with `stow` and organized for quick bootstrapping on new machines.

## 🚀 Quick Start

### 1. Install Xcode Command Line Tools

Required by `git` and Homebrew. Skip if already installed.

```bash
xcode-select --install
```

### 2. Clone the repo

```bash
git clone https://github.com/ThorstenHans/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 3. Install Software

Installs Homebrew (if missing) and all packages from the `Brewfile`.

```bash
./install-software.sh
```

### 4. Link dotfiles

```bash
./install.sh
```

Safe to re-run at any time to ensure everything is correctly linked.


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

