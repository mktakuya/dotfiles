#!/bin/bash
# acli jira workitem create 実行前にチケット内容をチェックする hook

if ! command -v jq > /dev/null 2>&1; then
  exit 0
fi

input=$(cat)
tool_name=$(jq -r '.tool_name // empty' <<< "$input")

# Bash ツール以外はスルー
[ "$tool_name" != "Bash" ] && exit 0

command_str=$(jq -r '.tool_input.command // empty' <<< "$input")

# acli jira workitem create 以外はスルー
echo "$command_str" | grep -q 'acli jira workitem create' || exit 0

# --type の値からチケット種別を判定
issue_type=""
if echo "$command_str" | grep -qiE -- '--type\s+"?バグ"?'; then
  issue_type="バグ"
fi

ERRORS=()

# description フラグの存在チェック
if ! echo "$command_str" | grep -q -- '--description'; then
  ERRORS+=("「description」が指定されていません。")
elif [ "$issue_type" = "バグ" ]; then
  # バグチケットの必須セクション
  REQUIRED_SECTIONS=("概要" "再現方法" "修正内容" "見積もり前チェック" "関連リンク")
  for section in "${REQUIRED_SECTIONS[@]}"; do
    if ! echo "$command_str" | grep -qF "$section"; then
      ERRORS+=("「description」に「${section}」セクションがありません")
    fi
  done
else
  # ストーリー・タスクの必須セクション
  REQUIRED_SECTIONS=("背景" "やること" "やらないこと" "決まっていないこと" "見積もり前チェック" "受け入れ条件" "その他" "関連リンク")
  for section in "${REQUIRED_SECTIONS[@]}"; do
    if ! echo "$command_str" | grep -qF "$section"; then
      ERRORS+=("「description」に「${section}」セクションがありません")
    fi
  done
fi

if [ ${#ERRORS[@]} -gt 0 ]; then
  error_msg=$(printf "・%s\n" "${ERRORS[@]}")
  jq -n --arg msg "$error_msg" '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "Jiraチケットのチェックに引っかかりました。以下を修正してください：\n\($msg)"
    }
  }'
  exit 0
fi

echo "[Jira validate hook] チケット内容チェックOK" >&2
exit 0
