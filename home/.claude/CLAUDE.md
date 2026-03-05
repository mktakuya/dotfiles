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

### 入力方法

- ユーザーは音声入力を使ってプロンプトを入力することがある
- そのため、同音異義語の誤変換や音声認識由来の誤字が含まれる場合がある（例: 「CLAUDE」→「cloude」、「プロンプト」→「フロント」など）
- 明らかな誤変換がある場合は文脈から意図を推測して対応する

## 思考・提案プロセス（BFS → DFS アプローチ）

設計・アーキテクチャに関わる議論や、複数のアプローチが考えられる課題に対して適用する。自明なタスク（typo 修正、単純なリファクタリング、明確に一択の実装など）ではこのプロセスを省略してよい。

ユーザーは「手堅く仕事を進める」ために、課題解決において**「幅優先探索（BFS）で合意してから、深さ優先探索（DFS）を行う」**ことを重視しています。Claude Code は壁打ち相手として、以下のプロセスを強制・促進してください。

1. **幅優先探索 (BFS) フェーズ:**
   - すぐに単一の解決策の詳細やコード実装に入らないこと。
   - まずは必ず複数の解決策（案A, 案B, 案C...）を提示し、それぞれの Pros / Cons / 影響範囲 をフラットに比較する。
   - ユーザーが最初から1つの案に固執して深掘りしようとした場合、「詳細を詰める前に、他の選択肢も軽く洗い出しておきませんか？」と提案し、視野を広げるサポートをする。
2. **意思決定フェーズ:**
   - 複数の選択肢と Pros / Cons が出揃った段階で、「この状態でドキュメント（Notion等）にまとめ、チームに相談（壁打ち）しますか？」とユーザーに確認する。
3. **深さ優先探索 (DFS) フェーズ:**
   - チーム（またはユーザー自身）によって方針が1つに決定された後にのみ、詳細な設計、エッジケースの考慮、シーケンスの整理、具体的な実装コードの出力に移行する。

## ツール

### Git

- コミットメッセージは以下のルールに従う:
  - 1行目（件名）: 日本語で「〜する」「〜を修正する」のように動詞終わりで変更内容を簡潔に書く
    - prefix は基本的に不要。ただし revert/refactor など文脈上必要な場合は `revert:` `refactor:` のように小文字で付けてよい
  - 3行目以降（本文）: 必要に応じて「なぜその変更をしたのか」を書く
    - 変更の動機・背景・理由を説明する（「何を変えたか」ではなく「なぜ変えたか」）
    - 関連する GitHub PR のレビューコメント URL、Slack スレッド URL、Notion ページ URL などがあればそのまま貼る
    - 自明な変更や件名だけで十分な場合は本文なしでよい

### コマンド

- GitHub に関する操作は gh コマンドを使用する
  - `github.com` のURLを渡されたときは、 gh コマンドを利用して情報を取得してください
  - Pull Request の作成を依頼されたときは、必ずリポジトリの Pull Request テンプレートファイルを探し、あれば利用してください
- Jira の情報取得は acli コマンドを使用する
  - `*.atlassian.net` のURLを渡されたときは、 acli コマンドを利用して情報を取得してください
  - acli コマンドの使い方:
    - チケット閲覧: `acli jira workitem view KEY-123`
      - JSON出力: `--json`
      - フィールド指定: `--fields summary,comment,status`（デフォルト: key,issuetype,summary,status,assignee,description）
      - ブラウザで開く: `--web`
    - チケット検索: `acli jira workitem search --jql "project = PROJ"`
      - 件数のみ: `--count`
      - CSV出力: `--csv`
      - JSON出力: `--json`
      - 件数制限: `--limit 50`
      - 全件取得: `--paginate`
      - フィールド指定: `--fields "key,summary,assignee"`
    - コメント追加: `acli jira workitem comment --key "KEY-123" --body "コメント内容"`
    - チケット作成: `acli jira workitem create --summary "タイトル" --project "PROJ" --type "Task"`
      - 担当者: `--assignee "user@example.com"`（自分: `@me`）
      - ラベル: `--label "bug,cli"`
      - 説明: `--description "説明文"`
      - 親チケット: `--parent KEY-123`
    - ステータス変更: `acli jira workitem transition --key "KEY-123" --status "In Progress"`
    - チケット編集（description更新）: `/update-jira-ticket` スキルを使うこと
    - プロジェクト一覧: `acli jira project list`

### MCP

以下の情報は MCP 経由で取得する

- Notion
- Figma

Webアプリケーションの開発中は、 Playwright MCP を利用してWebブラウザを操作し動作確認をする。
ユーザーは JetBrains IDE を使用しており、 rails server や sidekiq あるいは pnpm dev といった開発用のサーバーはすでに起動済である。そのため、 Claude Code 自身がサーバーを起動する必要は無い。

