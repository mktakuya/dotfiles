---
name: create-pull-request
description: Pull Request を作成・更新するときに使う。gh コマンドでのドラフト作成手順、PR テンプレートの探索、レビュアーの扱い。
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

### 2. ドラフトで作成する

```bash
gh pr create --draft --title "<件名>" --body-file <本文ファイル>
```

- **必ず `--draft` を付ける**。レビュー可能な状態にするかどうかはユーザーが判断する
- 件名はコミットメッセージと同じ規約に従う（`/git-commit-convention` 参照）
- 本文が複数行になるときは、ファイルに書いて `--body-file` で渡す

### 3. レビュアー

- レビュアーは自動でアサインしない
- ユーザーが明示的に指示した場合のみ `--reviewer` を付ける

## 注意事項

- GitHub に関する操作はすべて gh コマンドで行う。`github.com` の URL に直接アクセスしない
- 既存 PR の更新は `gh pr edit`、状態確認は `gh pr view` を使う
