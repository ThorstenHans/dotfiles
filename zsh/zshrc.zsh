# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# Source PowerLevel10k config
source ${config_dir}/p10k.zsh

# load custom aliases
source ${config_dir}/aliases.zsh

# custom settings
source ${config_dir}/history.zsh
source ${config_dir}/variables.zsh

# az autocompletion
source ${config_dir}/az.zsh

# nvm
source ${config_dir}/nvm.zsh
  



# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/p10k.zsh.
[[ ! -f ~/dotfiles/zsh/p10k.zsh ]] || source ~/dotfiles/zsh/p10k.zsh
