git clone --bare https://github.com/keepclean/dotfiles.git "${HOME}"/.dotfiles

config() {
   /usr/bin/git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}" "$@"
}

branch="macos"
ostype="$(uname)"
if [ "${ostype}" = "Linux" ]; then
    branch="linux"
fi

config checkout "${branch}"
config config status.showUntrackedFiles no

if command -v zsh; then
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
else
    echo "zimfw will not be installed, install zsh first"
fi

if [ "${ostype}" = "Darwin" ]; then
    VCS_DIR="${HOME}/Code/src"
    test -d "${VCS_DIR}" || mkdir -p "${VCS_DIR}"
    path="github.com/jonathanfilip/lucius"
    git clone https://"${path}".git "${VCS_DIR}/${path}"
fi
