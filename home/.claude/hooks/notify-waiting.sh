#!/usr/bin/env bash

PROJECT_NAME=$(basename "$PWD")
MESSAGE="$PROJECT_NAME で入力待ち状態です"
osascript -e "display notification \"$MESSAGE\" with title \"Claude Code\" sound name \"Glass\""
