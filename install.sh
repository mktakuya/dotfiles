#!/bin/sh
cd $(dirname $0)

mkdir -p ~/.vim
mkdir -p ~/.config
mkdir -p ~/.peco

for dotfile in .?*
do
  if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
  then
    ln -Fis "$PWD/$dotfile" $HOME
  fi
done

# Link dot_* directories to home
ln -Fis "$PWD/dot_config/nvim" "$HOME/.config/"
ln -Fis "$PWD/dot_claude" "$HOME/.claude"
ln -Fis "$PWD/dot_peco" "$HOME/.peco"
