# README

## Setup ZSH

Check if you have zsh already.

```bash
zsh --version
```

Install zsh

```bash
brew install zsh
```

Set zsh as your default shell

```bash
chsh -s /bin/zsh
```

Install zsh autosuggestions

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
