#!/bin/sh
cd $(dirname $0)

mkdir -p ~/.vim

for dotfile in .?*
do
    if [ $dotfile != '..' ] && [ $dotfile != '.git' ] && [ $dotfile != '.config' ]
    then
        ln -Fis "$PWD/$dotfile" $HOME
    fi
done
