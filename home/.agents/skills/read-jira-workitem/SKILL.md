---
name: read-jira-workitem
description: Jira チケット ID（ABC-123 のような英大文字-数字形式）や *.atlassian.net の URL が渡されたときに使う。acli コマンドによる Jira チケットの閲覧・検索・操作のリファレンス。
---

# Jira ワークアイテムの閲覧・検索・操作

`acli` コマンドを使った Jira 操作のリファレンス。

## チケット閲覧

```bash
acli jira workitem view KEY-123
```

- JSON 出力: `--json`
- フィールド指定: `--fields summary,comment,status`（デフォルト: key,issuetype,summary,status,assignee,description）
- ブラウザで開く: `--web`

## チケット検索

```bash
acli jira workitem search --jql "project = PROJ"
```

- 件数のみ: `--count`
- CSV 出力: `--csv`
- JSON 出力: `--json`
- 件数制限: `--limit 50`
- 全件取得: `--paginate`
- フィールド指定: `--fields "key,summary,assignee"`

## コメント追加

```bash
acli jira workitem comment --key "KEY-123" --body "コメント内容"
```

## チケット作成

```bash
acli jira workitem create --summary "タイトル" --project "PROJ" --type "Task"
```

- 担当者: `--assignee "user@example.com"`（自分: `@me`）
- ラベル: `--label "bug,cli"`
- 説明: `--description "説明文"`
- 親チケット: `--parent KEY-123`

## ステータス変更

```bash
acli jira workitem transition --key "KEY-123" --status "In Progress"
```

## プロジェクト一覧

```bash
acli jira project list
```

## 注意事項

- チケットの description（説明欄）を更新する場合は `/update-jira-workitem` スキルを使うこと
