#!/usr/bin/env bash

cd "$(cd "$(dirname "$0")" && pwd)" || exit 1

# ----- $HOME 直下
for src in "$PWD/home"/.*; do
  base=$(basename "$src")
  [ "$base" = "." ]  && continue
  [ "$base" = ".." ] && continue

  ln -nfs "$src" "$HOME/$base"
done

# ----- $HOME/.config
mkdir -p "$HOME/.config"
for dir in "$PWD/dot_config"/*; do
  name=$(basename "$dir")
  ln -nfs "$dir" "$HOME/.config/$name"
done
