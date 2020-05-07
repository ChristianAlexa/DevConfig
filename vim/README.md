# README

vim setup from 0 to god.

* Install neovim

```bash
$ brew install neovim
```

* Auto set up env

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

* Put init.vim here

```
~/.config/nvim/init.vim
```

* Run neovim

```bash
$ nvim
```
* Install Plugins

```
:PlugInstall
```

* Create alias for nvim in ~/.zshrc

```bash
alias vim="nvim"
alias vi="nvim"
```

