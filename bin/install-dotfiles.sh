git clone --bare https://github.com/keepclean/dotfiles.git "${HOME}"/.dotfiles

function config {
   /usr/bin/git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}" "$@"
}

ostype="$(uname)"
if [ "${ostype}" = "Linux" ]; then
    branch="linux"
else
    branch="macos"
fi

if config checkout "${branch}"; then
    echo "Checked out dotfiles."
else
    echo "Backing up pre-existing dotfiles."
    mkdir -p .dotfiles-backup
    config checkout 2>&1 | grep -E "\s+\." | awk '{print $1}' | xargs -I {} mv {} .dotfiles-backup/{}
fi

config checkout "${branch}"
config config status.showUntrackedFiles no

git clone --recursive https://github.com/zimfw/zimfw.git "${HOME}"/.zim

if [ "${ostype}" = "Darwin" ]; then
    VCS_DIR="${HOME}/Code/vcs"
    test -d "${VCS_DIR}" || mkdir -p "${VCS_DIR}"
    chdir "${VCS_DIR}"
    git clone https://github.com/jonathanfilip/lucius.git
fi

if command -v zsh; then
    echo "Change shell to zsh"
    chsh -s "$(command -v zsh)"
fi
