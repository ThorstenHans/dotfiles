eval "$(/opt/homebrew/bin/brew shellenv)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

## Adding Snippets
zinit snippet OMZP::azure
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit ice as"completion"
zinit snippet OMZP::docker/completions/_docker
zinit snippet OMZP::dotnet
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

autoload -U compinit && compinit

zinit cdreplay -q


current_dir=$(dirname "${(%):-%N}")
dependencies_dir="$current_dir/deps"

for file in "$dependencies_dir"/*.zsh; do
  if [ -f "$file" ]; then
    source "$file"
  fi
done

# enable emacs bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History settings
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
# erase duplicates
HISTDUP=erase 
# append to the history instead of overwriting
setopt appendhistory 
# share history with other active instances
setopt sharehistory 
# prevent commands from being stored in history if they start with a space
setopt hist_ignore_space 
# prevent duplications from being added
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
# prevent duplicates from being shown when searching history
setopt hist_find_no_dups

# Completion 
zstyle ':completion:*' matcher-list  "m:{a-z}={A-Za-z}"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Shell Integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)" 
