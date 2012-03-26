#!/bin/sh

DIR=$(dirname $0)
FILES=`find $DIR -name '.?*'   \
  ! -name '.git*' \
  ! -name '.svn*' \
  ! -name '.elc*' \
  -exec basename {} \;`

for FILE in $FILES; do
  echo "create symbolic link => $HOME/$FILE"
  `ln -Fis $PWD/$FILE $HOME`
done
