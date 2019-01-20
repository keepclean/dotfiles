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
export MANWIDTH=80

[ -e ${HOME}/.tokens ] && source ${HOME}/.tokens

alias config='/usr/bin/git --git-dir=${HOME}/.dotfiles/ --work-tree=${HOME}'
alias p4merge='/Applications/p4merge.app/Contents/MacOS/p4merge'

WORDCHARS=''
[ -e "$(command -v jump)" ] && eval "$(jump shell zsh)"

zstyle ':completion:*' rehash true

function change-appearance {
    local cmd="1337;SetProfile=${1}"
    local iterm2_prefix="\x1B]"
    local iterm2_suffix="\x07"

    if test -n ${TMUX}; then
        local tmux_prefix="\x1BPtmux;\x1B"
        local tmux_suffix="\x1B\\"
    fi
    echo -n "${tmux_prefix}${iterm2_prefix}${cmd}${iterm2_suffix}${tmux_suffix}"

    export ITERM_PROFILE=${1}
    tmux set-environment ITERM_PROFILE ${1}
}

function switch-to-light {
    change-appearance Light
}

function switch-to-dark {
    change-appearance Dark
}

function brew-update {
    if ! command -v brew > /dev/null; then
        return
    fi

    brew update --all
    brew upgrade

    for f in $(brew cask outdated --greedy --quiet); do
        test -z "${f}" && continue
        brew cask reinstall "${f}"
    done

    brew cleanup
}

function godoc {
    command godoc "$@"|${PAGER:-less}
}
