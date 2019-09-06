# User configuration sourced by interactive shells

if [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Customize to your needs...
export EDITOR=vim
export GOPATH=$HOME/code
export PATH=$PATH:$GOPATH/bin:$HOME/bin
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SYSTEMD_LESS="FRXMK"
setopt interactivecomments

[ -e ${HOME}/.tokens ] && source ${HOME}/.tokens

alias config='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'

WORDCHARS=''
[ -e "$(command -v jump)" ] && eval "$(jump shell zsh)"

zstyle ':completion:*' rehash true
