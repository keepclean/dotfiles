# User configuration sourced by interactive shells

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Customize to your needs...
export EDITOR=vim
setopt interactivecomments
export GOPATH=$HOME/Code/go
export PATH=/usr/local/opt/python/libexec/bin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -e ${HOME}/.tokens ] && source ${HOME}/.tokens

alias config='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias p4merge='/Applications/p4merge.app/Contents/MacOS/p4merge'

ipmiproxy() {
    open https://setup.yandex-team.ru/ipmiproxy/api/v1.0/${1}/kvm
}

WORDCHARS=''
[ -e "$(command -v jump)" ] && eval "$(jump shell zsh)"

zstyle ':completion:*' rehash true

function godoc {
    command godoc "$@"|${PAGER:-less}
}
