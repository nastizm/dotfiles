#!/bin/sh
# 管理する場合はこちらに書く

if [ ! -e ~/.tmux.conf ]; then
  ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
else
  echo ".tmux.conf already exists."
fi

if [ ! -e ~/.zshenv ]; then
  ln -s ~/dotfiles/.zshenv ~/.zshenv
else
  echo ".zshenv already exists."
fi

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
