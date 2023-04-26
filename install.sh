#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e
# capture working directory
working_dir=$(pwd)
dependencies=(curl zsh git)

# prints an info to the screen
info() {
    printf "\r  [\033[00;34mINFO\033[0m] $1\n"
}

# prints a success-message to the screen
success() {
    printf "\r\033[2K  [\033[00;32m OK \033[0m] $1\n"
    echo ""
}

# prints an error-message to the screen and exits the app
error(){
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    exit
}

# changes the default shell to ZSH
change_shell() {
    info "Changing Shell to ZSH"
    chsh -s $(which zsh)
    success "Shell set to ZSH"
}

# creates a backup-copy of a file
backup_file() {
    if test -f $1; then
        info "Creating backup for existing $1"
        mv $1 $1.backup
        success "Backup created for $1 at $1.backup"
    fi
}

# verifies that Homebrew is installed on the Mac
verify_homebrew(){
    if  ! command -v brew &> /dev/null ; then
        error "Homebrew not installed. Please install brew first"
        # todo: install brew at some point automatically
        exit 1 
    fi
}

# verifies that dependencies are installed on the Mac
verify_mac_dependencies(){
    for lib in "${dependencies[@]}"
    do
        info "Installing $lib if not present"
        brew ls --versions $lib || brew install $lib
        success "$lib is installed"
    done
}

# verifies that dependencies are installed on Linux
verify_linux_dependencies(){
    sudo apt update -q > /dev/null
    for lib in "${dependencies[@]}"
    do
        info "Installing $lib if not present"
        sudo apt install $lib -q --yes > /dev/null
        success "$lib is installed"
    done
}

# verifies environment and installs dependencies (os specific)
verify_runtime(){
    os_type=$(uname)
    case "$os_type" in 
        "Darwin")
        {
            info "Running on MacOS"
            verify_homebrew
            verify_mac_dependencies
        } ;;
        "Linux" )
        {
            info "Running on Linux"
            verify_linux_dependencies
        };;
        *)
        {
            error "Unsupported OS"
        };;
    esac
}

# creates a file link
link_file(){
    info "Linking $2"
    ln -sfv $1 $2 > /dev/null
    success "$2 linked"
}

# creates a directory if it doesnt exist
verify_directory(){
    if test ! -d $1; then
        mkdir -p $1
        success "directory $1 created"
    fi
}

verify_runtime

files=("$HOME/.zshrc" "$HOME/.gitconfig" "$HOME/.gitignore" "$HOME/.editorconfig" "$HOME/.editorconfig" "$HOME/.npmrc")

for f in "${files[@]}"
do
	backup_file $f
done

info "Linking dotfiles"

link_file "${working_dir}/git/config" "${HOME}/.gitconfig"
link_file "${working_dir}/git/ignore" "${HOME}/.gitignore"
link_file "${working_dir}/zsh/zshrc.zsh" "${HOME}/.zshrc"
link_file "${working_dir}/editorconfig/config" "${HOME}/.editorconfig"
link_file "${working_dir}/npm/config" "${HOME}/.npmrc"
verify_directory $HOME/.azure/
link_file "${working_dir}/azure-cli/config" "${HOME}/.azure/config"
verify_directory $HOME/.config/gh
link_file "${working_dir}/github-cli/config" "${HOME}/.config/gh/config.yml"

success "All done! 🚀"

info "Either restart your terminal instance, or just invoke zsh"
