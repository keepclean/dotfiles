git clone --bare git@github.com:keepclean/dotfiles.git $HOME/.dotfiles

function config {
   /usr/bin/git --git-dir="${HOME}"/.dotfiles/ --work-tree="${HOME}" $@
}

ostype="$(uname)"
if [ "${ostype}" = 'Linux' ]; then
    branch="linux"
else
    branch="macos"
fi

config checkout "${branch}"
if [ $? = 0 ]; then
  echo "Checked out dotfiles."
else
    echo "Backing up pre-existing dotfiles."
    mkdir -p .dotfiles-backup
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I {} mv {} .dotfiles-backup/{}
fi

config checkout "${branch}"
config config status.showUntrackedFiles no
