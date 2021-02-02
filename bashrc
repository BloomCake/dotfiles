# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set dotfiles dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "${DIR}" | grep -q dotfiles$
if [ $? -ne 0 ]; then
	DIR="${DIR}/.dotfiles"
fi

# silently update dotfiles
# git -C ${DIR} pull -q & disown

# execute rc files
source ${DIR}/rc.dotfilelinks
source ${DIR}/rc.aliases
source ${DIR}/rc.prompt
source ${DIR}/rc.complete
source ${DIR}/rc.sysinfo

# set EDITOR to vim
if [ -e /usr/bin/vim ]; then
	export EDITOR=/usr/bin/vim
elif [ -e /usr/local/bin/vim ]; then
	export EDITOR=/usr/local/bin/vim
fi

# load local rc if present
if [ -e ${DIR}/rc.local ]; then
	source ${DIR}/rc.local
fi

#######################
### from old bashrc ###
#######################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2000
HISTFILESIZE=4000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
source <(kubectl completion bash)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# python virtualenv wrapper
export WORKON_HOME=~/.virtualenvs
source /home/tobi/.local/bin/virtualenvwrapper.sh
