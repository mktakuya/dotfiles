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
# Claude Code と Codex の双方から見える場所に撒く
for skills_dir in "$HOME/.claude/skills" "$HOME/.codex/skills"; do
  mkdir -p "$skills_dir"

  for skill in "$PWD/home/.agents/skills"/*/; do
    name=$(basename "$skill")
    [ "${name:0:1}" = "." ] && continue

    ln -nfs "${skill%/}" "$skills_dir/$name"
  done

  # リポジトリから消えたスキルへの壊れたリンクを掃除する
  for link in "$skills_dir"/*; do
    [ -L "$link" ] || continue
    [ -e "$link" ] || rm "$link"
  done
done

# ----- $HOME/.config
mkdir -p "$HOME/.config"
for dir in "$PWD/dot_config"/*; do
  name=$(basename "$dir")
  target="$HOME/.config/$name"

  if [ -d "$target" ] && [ ! -L "$target" ]; then
    # ツール自身が実体のディレクトリを作っている場合（opencode の
    # node_modules など）は、ディレクトリごと張るとリンクが中に
    # ネストしてしまうため、中身を個別に張る
    for entry in "$dir"/*; do
      ln -nfs "${entry%/}" "$target/$(basename "$entry")"
    done
  else
    ln -nfs "$dir" "$target"
  fi

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
