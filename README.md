# dotfiles

Personal unix dotfiles (forked by [NeoVG](https://github.com/NeoVG/dotfiles))
Adapted for use with Ubuntu 18.04.

- Bash prompt inspired by [Agnoster](https://gist.github.com/agnoster/3712874) theme for [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh).
- $EDITOR set to vim if present
- Useful aliases:
```shell
alias ..='cd ..'
alias la='ls -lah'
alias du1='du -xHhd 1'
alias df='df -h'
alias tmux='tmux -2 -CC'
alias su='sudo su'                               # if not root
alias ls='ls --color'                            # Linux
```
- Shell completion for
    - sudo
    - git
- Sysinfo on login (bsdinfo, archey or screenfetch, whichever is found first)
- Nifty .vimrc

## Usage

Read only:

```shell
git clone https://bitbucket.org/bloomi/dotfiles.git ~/.dotfiles
source ~/.dotfiles/bashrc
```

Read/Write:

```shell
git clone git@bitbucket.org:bloomi/.dotfiles.git
source ~/.dotfiles/bashrc
```
