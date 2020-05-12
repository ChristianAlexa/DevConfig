# README

0 to vim GOD.

* Install neovim

You'll need homebrew.

```bash
$ brew install neovim
```

* Auto set up for vim plug

```bash
$ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
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

* Install plugins for Coc filetype support

To get intellisense for go and python files, you'll need these plugins.

Launch vi and run:
```bash
:CocInstall coc-go
:CocInstall coc-python
```

* Setup vim orgmode for documentation

I like orgmode for documentation, but emacs is trash.
If you choose to try vim orgmode, make sure you have vim python support:
```
$ sudo pip3 install neovim
```

[vim orgmode documentation](https://github.com/jceb/vim-orgmode/blob/master/doc/orgguide.txt)

