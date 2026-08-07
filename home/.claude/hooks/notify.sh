#!/usr/bin/env bash
# Claude Code のフックから呼ばれ、macOS の通知センターにメッセージを出す。
#
#   notify.sh "<状態を表す文言>"
#
# 「<プロジェクト名> <文言>」という本文で通知する。プロジェクト名はフックの
# 入力 JSON の cwd から取る。$PWD はフックの実行位置に依存して当てにならない
# ことがあるため、取れなかった場合のフォールバックとしてのみ使う。

set -u

state=${1:-}
if [ -z "$state" ]; then
  echo "usage: notify.sh <message>" >&2
  exit 1
fi

# macOS 以外では何もしない
command -v osascript > /dev/null 2>&1 || exit 0

cwd=""
if command -v jq > /dev/null 2>&1; then
  cwd=$(jq -r '.cwd // empty' 2> /dev/null)
fi
[ -n "$cwd" ] || cwd="$PWD"

# 引数として渡すことで、プロジェクト名に引用符が含まれていても壊れないようにする
osascript \
  -e 'on run {msg}' \
  -e 'display notification msg with title "Claude Code" sound name "Glass"' \
  -e 'end run' \
  "$(basename "$cwd") ${state}" > /dev/null
