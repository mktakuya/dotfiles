---
name: create-pull-request
description: Pull Request を作成・更新するときに使う。gh コマンドでの作成手順、PR テンプレートの探索、アサイン者とレビュアーの扱い。
---

# Pull Request の作成

## 手順

### 1. PR テンプレートを探す

必ずリポジトリの Pull Request テンプレートを探し、あれば本文の骨格として利用する。

```bash
ls .github/PULL_REQUEST_TEMPLATE.md .github/pull_request_template.md \
   .github/PULL_REQUEST_TEMPLATE/ docs/PULL_REQUEST_TEMPLATE.md 2>/dev/null
```

テンプレートが見つからない場合のみ、変更内容に応じた本文を自分で構成する。

### 2. 作成する

```bash
# 個人開発プロジェクト（mktakuya/ 配下）の場合
gh pr create --assignee "@me" --title "<件名>" --body-file <本文ファイル>

# それ以外のリポジトリの場合
gh pr create --draft --assignee "@me" --title "<件名>" --body-file <本文ファイル>
```

- 必ず `--assignee "@me"` を付けて自分をアサイン者にする
- `mktakuya/` 配下の個人開発プロジェクトでは `--draft` を付けず、オープンな Pull Request を作成する
- それ以外のリポジトリでは必ず `--draft` を付ける
- 件名はコミットメッセージと同じ規約に従う（`/git-commit-convention` 参照）
- 本文が複数行になるときは、ファイルに書いて `--body-file` で渡す

### 3. レビュアー

- レビュアーは自動でアサインしない
- ユーザーが明示的に指示した場合のみ `--reviewer` を付ける

## 注意事項

- GitHub に関する操作はすべて gh コマンドで行う。`github.com` の URL に直接アクセスしない
- 既存 PR の更新は `gh pr edit`、状態確認は `gh pr view` を使う
