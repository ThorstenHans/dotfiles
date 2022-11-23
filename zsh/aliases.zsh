# edit hosts with default editor
alias hosts='sudo $EDITOR /etc/hosts'
# edit dotfiles
alias ec="$EDITOR $HOME/dotfiles"
# source dotfiles
alias sc="source $HOME/.zshrc"


# 2 - navigation
alias dev="cd $HOME/dev"
alias customers="cd $HOME/dev/thinktecture/customers"
alias thns="cd $HOME/dev/thorstenhans/"
alias blog="cd $HOME/dev/thorstenhans/blog && code ."
alias ll="exa -l --git --icons"
alias la=ll
alias ls=ll
alias lt="exa -l --git --icons --tree"
alias tree=lt

# 3 - docker
# quick access to docker cli
alias d='docker'
# quick access to docker-compose cli
alias dc='docker-compose'
alias dcup='docker-compose up'
alias dcdown='docker-compose down'
# list all images
alias dim='docker images'
# quickly list all containres
alias dps='docker ps'
# including stopped containers
alias dpsa='docker ps -a'
# force removal
alias drm='docker rm -f'


# 4 - kubectl
# quick access to kubectl
alias k='kubectl'
# get all contexts 
alias kgx='kubectl config get-contexts'
# quickly switch context
alias ksx='kubectl config set-context'
# remove an existing context
alias kdx='kubectl config delete-context'
# modify default namespace for a context
alias kns='kubectl config set-context --current --namespace'
# execute command (interactive with tty)
alias kex='kubectl exec -it'
# check authorization 
alias kani='kubectl auth can-i'


# 5 - git
# just fix common typos. everything else is defined in global .gitconfig
alias got="git"
alias gti="git" # no volkswagen ;) 
alias gott="git"
alias gitt="git"
alias gir="git"
alias giy="git"


# 6 - terraform
# quick access to terraform
alias t="terraform"
alias tfmt="terraform fmt --recursive"
alias tvalidate="terraform validate"
alias tplan="terraform plan"
alias tapply="terraform apply"
alias tdestroy="terraform destroy"

# 7 - VSCode
alias ccode="code ."
