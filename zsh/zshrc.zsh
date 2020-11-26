# source antigen
config_dir=$HOME/dotfiles/zsh
source ${config_dir}/antigen.zsh

# laod oh-my-zsh
antigen use oh-my-zsh

# load built-in plugins from oh-my-zsh
antigen bundle git
antigen bundle brew
antigen bundle docker
antigen bundle kubectl
antigen bundle terraform
antigen bundle command-not-found

# load plugins from GitHub ([org|user]/repo)

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# set theme to PowerLevel 10k
antigen theme romkatv/powerlevel10k

# apply theme
antigen theme apply

# apply oh-my-zsh with all plugins
antigen apply

# GPG
export GPG_TTY=$(tty)

# disable .NET CLI telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export EDITOR='code'
# Source PowerLevel10k config
source ${config_dir}/p10k.zsh

# load custom aliases
source ${config_dir}/aliases.zsh

# custom settings
source ${config_dir}/history.zsh
source ${config_dir}/variables.zsh

