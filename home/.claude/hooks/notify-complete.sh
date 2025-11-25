#!/usr/bin/env bash

PROJECT_NAME=$(basename "$PWD")
MESSAGE="$PROJECT_NAME の処理が完了しました"
osascript -e "display notification \"$MESSAGE\" with title \"Claude Code\" sound name \"Glass\""
