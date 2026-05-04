---
name: update-jira-workitem
description: Jira ワークアイテムの description を更新する。
---

# Jira ワークアイテムの description を更新する

Jira チケットの description（説明欄）を更新するワークフロー。

## 引数

- $ARGUMENTS: 更新対象のチケットキー（例: `ABC-123`）と、更新内容の指示

## 手順

### 1. 現在の description を取得

```bash
acli jira workitem view <TICKET_KEY> --fields description --json | jq '.fields.description' > /tmp/jira_desc_<ticket_key_lowercase>.json
```

- `<ticket_key_lowercase>` はチケットキーを小文字にしたもの（例: `ABC-123` → `abc-123`）
- `create_payload.py` が `ticket_key.lower()` でファイル名を解決するため、必ず小文字で保存すること
- 取得した JSON は Atlassian Document Format（ADF）形式
- これが元データになるので、必ず保存しておく

### 2. ADF JSON を編集

- `/tmp/jira_desc_<ticket_key_lowercase>.json` を読み込み、指示された箇所を変更する
- ADF の構造:
  - `{"type": "doc", "version": 1, "content": [...]}`
  - content 配列の各要素が heading, paragraph, bulletList, orderedList 等のブロック
- Python スクリプトで JSON を操作するのが安全（手書きだとミスしやすい）
- 編集後は同じファイル（`/tmp/jira_desc_<ticket_key_lowercase>.json`）を上書き保存しておく

### 3. 更新用ペイロードを作成

本スキルに含まれる `create_payload.py` を使う:

```bash
python ~/.agents/skills/update-jira-workitem/scripts/create_payload.py <TICKET_KEY>
```

`/tmp/jira_payload_<ticket_key>.json` に出力される。

### 4. チケットを更新

```bash
acli jira workitem edit --from-json /tmp/jira_payload_<ticket_key>.json --yes
```

## 注意事項

- **`--description` フラグはプレーンテキストしか受け付けない**。ADF（見出し・リスト等のスタイル）を保持したい場合は必ず `--from-json` を使うこと
- **`--description-file` は heading を含む ADF で失敗する**ことがある。`--from-json` の方が確実
- `--generate-json` でペイロードのテンプレートを確認できる
- 更新前に元の description を必ずバックアップすること
