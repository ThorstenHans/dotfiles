
# GPG
export GPG_TTY=$(tty) 
export ZSH="$HOME/.oh-my-zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

config_dir=$HOME/dotfiles/zsh

plugins=(
  git
  brew
  docker
  docker-compose
  gh
  helm
  kubectl
  # terrafrom
  command-not-found
  zsh-syntax-highlighting
  zsh-autosuggestions
)
# set theme to PowerLevel 10k
ZSH_THEME="powerlevel10k/powerlevel10k"



autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# Source PowerLevel10k config
source ${config_dir}/p10k.zsh

# load custom aliases
source ${config_dir}/aliases.zsh

# custom settings
source ${config_dir}/history.zsh

# az autocompletion
source ${config_dir}/az.zsh

# nvm
source ${config_dir}/nvm.zsh
  
# To customize prompt, run `p10k configure` or edit ~/dotfiles/zsh/p10k.zsh.
[[ ! -f ~/dotfiles/zsh/p10k.zsh ]] || source ~/dotfiles/zsh/p10k.zsh

source $ZSH/oh-my-zsh.sh

source ${config_dir}/variables.zsh



# Load Angular CLI autocompletion.
source <(ng completion script)
