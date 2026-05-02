#!/usr/bin/env bash

cd "$(cd "$(dirname "$0")" && pwd)" || exit 1

# ----- $HOME 直下
for src in "$PWD/home"/.*; do
  base=$(basename "$src")
  [ "$base" = "." ]  && continue
  [ "$base" = ".." ] && continue

  ln -nfs "$src" "$HOME/$base"
done

# ----- AGENTS.md
ln -nfs "$PWD/home/AGENTS.md" "$HOME/AGENTS.md"

# ----- Agent Skills
mkdir -p ~/.claude/skills
for skill in "$PWD/home/.agents/skills"/*/; do
  name=$(basename "$skill")
  [ "${name:0:1}" = "." ] && continue
  [ -L ~/.claude/skills/"$name" ] && continue
  ln -s "$skill" ~/.claude/skills/"$name"
done

# ----- $HOME/.config
mkdir -p "$HOME/.config"
for dir in "$PWD/dot_config"/*; do
  name=$(basename "$dir")

  ln -nfs "$dir" "$HOME/.config/$name"

  # git/config は OS 別に切り替え
  if [ "$name" = "git" ]; then
    if [ "$(uname)" = "Darwin" ]; then
      ln -nfs "$dir/config.macos" "$HOME/.config/git/config"
    else
      ln -nfs "$dir/config.other" "$HOME/.config/git/config"
    fi
    continue
  fi
done

# ----- Bundler
if command -v bundle > /dev/null 2>&1; then
  bundle config set --global default_cli_command install
fi
