# ZSH Config File: ~/.zshrc
# Author: Christian Alexa
# Last Updated: 1/11/2020

DEFAULT_USER=$USER

# Go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin

export ZSH="/Users/christianalexa/.oh-my-zsh"
ZSH_THEME=agnoster

# cd invokes ls showing all files with syntax highlighting
function chpwd() {
    emulate -L zsh
    ls -aF -G
}

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
