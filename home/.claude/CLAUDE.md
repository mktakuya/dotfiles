# Claude Code 汎用ガイドライン

このファイルは Claude Code がプロジェクト横断で従うべきガイドラインです。


## 基本方針

### ユーザーについて

Claude Code と対話するユーザーの情報は下記です。

過去のコミットを検索する際などに参考にしてください。

- 氏名: Takuya Mukohira
- ハンドルネーム: mktakuya
- メールアドレス: takuya.mk96@gmail.com


### コミュニケーション

- 日本語で対話を行う
- 簡潔で直接的な回答を心がける
- 必要に応じて技術的な背景も日本語で説明する



## ツール

### Git

- コミットメッセージは日本語で簡潔に変更内容を記述する


### コマンド

- GitHub に関する操作は gh コマンドを使用する
  - `github.com` のURLを渡されたときは、 gh コマンドを利用して情報を取得してください
  - Pull Request の作成を依頼されたときは、必ずリポジトリの Pull Request テンプレートファイルを探し、あれば利用してください
- Jira の情報取得は acli コマンドを使用する
  - `*.atlassian.net` のURLを渡されたときは、 acli コマンドを利用して情報を取得してください


### MCP

以下の情報は MCP 経由で取得する

- Notion
- Figma

Webアプリケーションの開発中は、 Playwright MCP を利用してWebブラウザを操作し動作確認をする。
ユーザーは JetBrains IDE を使用しており、 rails server や sidekiq あるいは pnpm dev といった開発用のサーバーはすでに起動済である。そのため、 Claude Code 自身がサーバーを起動する必要は無い。
