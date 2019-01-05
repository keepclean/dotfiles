if command -v brew >/dev/null; then
    echo "brew has already been installed"; exit
fi

if [ "$(uname)" != "Darwin" ]; then
    echo "brew for macos only"; exit
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

BREW="$(command -v brew)"
BREW_FORMULAS="coreutils \
    curl \
    fd \
    fzf \
    git \
    gnu-sed \
    gnu-tar \
    go \
    icdiff \
    jq \
    jump \
    mr \
    python \
    reattach-to-user-namespace \
    ripgrep \
    shellcheck \
    tmux \
    tree \
    vim \
    yamllint \
    ydiff"

for f in ${BREW_FORMULAS}; do
    "${BREW}" install "${f}"
done

"${BREW}" tap homebrew/cask-fonts
BREW_CASK_FORMULAS="appcleaner \
    boostnote \
    dash \
    divvy \
    firefox \
    flycut \
    font-input \
    hammerspoon \
    keepassxc \
    marta \
    p4v \
    skim \
    turbo-boost-switcher \
    visual-studio-code \
    vlc \
    wireshark"

for f in ${BREW_CASK_FORMULAS}; do
    "${BREW}" cask install "${f}"
done
