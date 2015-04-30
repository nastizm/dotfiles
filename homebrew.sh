#!/bin/sh
# homebrew

TAPS=(
    peco/peco
    homebrew/binary
    homebrew/versions
)

FORMULAS=(
    mysql56
    docker
    boot2docker
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
)

CASKS=(
    java
    sequel-pro
)

echo "update brew..."
brew update

echo "install start"
brew tap ${TAPS[@]} && brew install ${FORMULAS[@]}
brew cask ${CASKS[@]}
echo "end install"

brew cleanup

