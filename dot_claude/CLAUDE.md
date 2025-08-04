# Claude Code 汎用ガイド

このファイルは Claude Code (claude.ai/code) が様々なプロジェクトで作業する際の汎用的なガイドラインです。

## 基本方針

### コミュニケーション
- **言語**: 日本語で対話を行う
- **応答スタイル**: 簡潔で直接的な回答を心がける
- **説明**: 必要に応じて技術的な背景も日本語で説明する

## 開発環境とツール

### 利用可能なツール
- **Git**: カスタムエイリアス（g, ga, gd, gs, gco, gc等）
- **Docker**: Docker Compose用エイリアス（dcup, dcdown, dcr, dce, dcl）
- **Node.js**: nodenvによる管理、yarn shortcuts（ys=yarn start）
- **Python**: pyenv + virtualenv環境
- **Ruby**: rbenvによる管理、bundle exec（be）
- **Go**: GOPATH設定済み、gore -autoimport利用可能
- **Rust**: Cargo環境設定済み

### 開発補助ツール
- **peco**: コマンド履歴・git ブランチのファジー検索
  - `Ctrl+]`: ghq管理リポジトリへのファジー移動
  - `Ctrl+b`: gitブランチのファジー切り替え
- **ghq**: リポジトリ管理（ルート: `/Users/mktakuya/src`）
- **direnv**: 自動環境変数読み込み
- **1Password**: SSH署名によるGitコミット
- **acli**: Atlassian Jira / Confluence の公式CLIツール Jiraチケット参照時はこちらを利用

## 推奨ワークフロー

### プロジェクト開始時
1. `ghq get <repository_url>` でリポジトリをクローン
2. `direnv allow` で環境変数を設定（.envrcがある場合）
3. 言語固有の環境セットアップ（package.json, requirements.txt等）

### Git操作
- `gs` でステータス確認
- `ga .` で変更をステージング
- `gc` でコミット
- `gp` でプッシュ
- `gco <branch>` でブランチ切り替え

### コンテナ開発
- `dcup` でサービス起動
- `dce <service> <command>` でコンテナ内コマンド実行
- `dcl` でログ確認
- `dcdown` で停止

## エディタ設定

### Vim/Neovim
- 基本設定: 2スペースインデント、行番号表示、80文字列ガイド
- プラグイン: ALE（リンティング）、deoplete（補完）、NERDTree（ファイル探索）
- 自動整形: 保存時に末尾空白除去

### 推奨プラクティス
- ファイル保存時の自動フォーマット活用
- ALE による静的解析結果の確認
- ripgrep（rg）による高速ファイル検索

## 言語別ベストプラクティス

### JavaScript/TypeScript
- `ys` でローカル開発サーバー起動
- ESLint/Prettier による自動整形
- package.json の scripts セクション確認

### Python
- 仮想環境の自動アクティベーション（pyenv-virtualenv）
- `.pythonstartup` による対話モード拡張
- requirements.txt 管理

### Ruby
- `be` でbundle exec実行
- rbenv による複数バージョン管理
- Gemfile.lock の確認

### Go
- `gore` で対話的REPL（自動インポート有効）
- GOPATH設定済み環境
- `go mod` による依存関係管理

## トラブルシューティング

### 環境変数関連
- `direnv status` で状態確認
- シェル再起動で設定リロード

### Git関連
- SSH署名に関するエラーは1Password設定を確認
- `git config --global --list` で設定確認

### 言語環境関連
- `*env versions` でインストール済みバージョン確認
- `*env install --list` で利用可能バージョン確認

## 効率化のヒント

- `Ctrl+]` でプロジェクト間を素早く移動
- `Ctrl+b` でGitブランチを素早く切り替え
- `pssh` でSSH接続先を選択
- `history-all` で全履歴表示
- ripgrep（`rg`）でファイル内容検索

## コミット規約

### コミットメッセージ形式
- 日本語で簡潔に変更内容を記述
- 機能追加: 「〜を追加」
- 機能更新: 「〜を更新」  
- バグ修正: 「〜を修正」
- リファクタリング: 「〜をリファクタリング」

### 例
```
ユーザー認証機能を追加

- JWT トークンによる認証を実装
- ログイン・ログアウト API を追加
- 認証ミドルウェアを作成
```
