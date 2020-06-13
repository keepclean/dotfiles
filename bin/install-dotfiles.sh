test command -v zsh || { echo "installation of zimfw will file w/o zsh, install zsh first"; exit; }

curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh

git clone --bare https://github.com/keepclean/dotfiles.git "${HOME}"/.dotfiles

config() {
   /usr/bin/git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}" "$@"
}

branch="macos"
ostype="$(uname)"
if [ "${ostype}" = "Linux" ]; then
    branch="linux"
fi

config checkout --force "${branch}"
config config status.showUntrackedFiles no

if [ "${ostype}" = "Darwin" ]; then
    VCS_DIR="${HOME}/Code/src"
    test -d "${VCS_DIR}" || mkdir -p "${VCS_DIR}"
    path="github.com/jonathanfilip/lucius"
    git clone https://"${path}".git "${VCS_DIR}/${path}"
fi
