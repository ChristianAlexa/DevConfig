# ZSH Config File: ~/.zshrc

export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}

DEFAULT_USER=$USER

# Go
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH=$HOME/go/bin:$PATH

export ZSH="/Users/$USER/.oh-my-zsh"
ZSH_THEME=ROBBYRUSSELL

# cd invokes ls showing all files with syntax highlighting
function chpwd() {
    emulate -L zsh
    ls -aF -G
}

alias vim="nvim"
alias vi="nvim"

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
