#!/bin/sh
cd $(dirname $0)

mkdir -p ~/.vim
mkdir -p ~/.config
mkdir -p ~/.peco
mkdir -p ~/.claude

for dotfile in .?*
do
  if [ $dotfile != '..' ] && [ $dotfile != '.git' ]
  then
    ln -Fis "$PWD/$dotfile" $HOME
  fi
done

ln -Fis "$PWD/CLAUDE.global.md" "$HOME/.claude/CLAUDE.md"

# Link dot_* directories to home
ln -Fis "$PWD/dot_config/nvim" "$HOME/.config/"
ln -Fis "$PWD/dot_peco" "$HOME/.peco"

