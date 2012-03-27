#!/bin/bash

DOT_FILES=(.gitconfig .gitignore .inputrc .vimrc .vimrc.bundle .tmux.conf)

for file in ${DOT_FILES[@]}
do
  echo "create symbolic link => $HOME/$file"
  ln -Fsi $HOME/dotfiles/$file $HOME/$file
done
