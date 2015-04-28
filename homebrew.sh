#!/bin/sh
# homebrew

TAPS=(
    peco/peco
)

FORMULAS=(
    caskroom/cask/brew-cask
    zsh
    peco
    tmux
    reattach-to-user-namespace
    go
    brew-cask
    the_platinum_searcher
    the_silver_searcher
)

CASKS=(
    vagrant
    virtualbox
)

echo "update brew..."
brew update

echo "install start"
brew tap ${TAPS[@]} && brew install ${FORMULAS[@]}
brew cask ${CASKS[@]}
echo "end install"

brew cleanup

