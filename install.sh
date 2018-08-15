#!/bin/sh
cd $(dirname $0)

mkdir -p ~/.config

for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.config' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done

ln -Fis $PWD/.config/nvim $HOME/.config/
