#!/bin/bash

DOT_FILES=(.gitconfig .gitignore .inputrc .vimrc .zshrc .zshenv .tmux.conf .cache)
for file in ${DOT_FILES[@]}
do
  echo "create symbolic link => $HOME/$file"
  ln -Fsi $HOME/dotfiles/$file $HOME/$file
done

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
