#!/bin/sh
# 管理する場合はこちらに書く

for file in `find $HOME/dotfiles -name '.*' | grep -v 'dotfiles/.git$' | perl -nle 'm!dotfiles/(.+)$! and print $1'`; do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# brew
if ! type brew > /dev/null >/dev/null 2>&1; then
  if [ ! -d /usr/local/bin/ ]; then
    sudo mkdir /usr/local/bin/
  fi
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
sh homebrew.sh

if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/.vimrc ~/.vimrc
else
  echo ".vimrc already exists."
fi

if [ ! -d ~/.zsh ]; then
  ln -s ~/dotfiles/.zsh ~/.zsh
else
  echo ".zsh already exists."
fi

if [ ! -d ~/.emacs.d ]; then
  ln -s ~/dotfiles/submodule/maaato/emacs/.emacs.d ~/.emacs.d
else
  echo ".emacs.d already exists."
fi

if [ ! -d ~/.gitignore ]; then
  ln -s ~/dotfiles/.gitignore ~/.gitignore
else
  echo ".gitignore already exists."
fi

if [ ! -d ~/.gitconfig ]; then
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
else
  echo ".gitconfig already exists."
fi

if [ ! -d ~/.gitconfig.local ]; then
  ln -s ~/dotfiles/.gitconfig.local ~/.gitconfig.local
fi

if ! gem list bundler -i; then
  sudo gem install bundler
fi
sudo bundle install

echo "end setup"
