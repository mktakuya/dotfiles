#!/usr/bin/env sh
mkdir -p ./tmp
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ./tmp/installer.sh
sh ./tmp/installer.sh ~/.cache/dein
