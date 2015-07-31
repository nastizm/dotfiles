#!/bin/sh
# homebrew

TAPS=(
    peco/peco
    homebrew/binary
    homebrew/versions
    motemen/ghq
)

FORMULAS=(
    mysql56
    docker
    boot2docker
    docker-compose
    git
    caskroom/cask/brew-cask
    zsh
    peco
    tmux
    reattach-to-user-namespace
    go
    brew-cask
    the_platinum_searcher
    the_silver_searcher
    pyenv  # python
    pyenv-virtualenv
    ghq
    nkf
)

CASKS=(
    java
    sequel-pro
    virtualbox
)

echo "update brew..."
brew update

echo "install start"
brew tap ${TAPS[@]} && brew install ${FORMULAS[@]}
brew cask ${CASKS[@]}
echo "end install"

brew cleanup

