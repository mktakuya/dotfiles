# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## リポジトリ概要

開発ツールや環境の設定ファイルを含む個人のdotfilesリポジトリです。シンボリックリンクベースのインストール方式を採用している標準的なdotfiles構成になっています。

## インストールとセットアップ

- **メインインストール**: `./install.sh` を実行してホームディレクトリにすべてのdotfilesのシンボリックリンクを作成
- **Neovimプラグインセットアップ**: `./install_dein.sh ~/.cache/dein` を実行してNeovim用のdein.vimプラグインマネージャーをインストール

## アーキテクチャと構造

### 主要コンポーネント

- **シェル設定**: `.zshrc` にはカスタムエイリアス、関数、環境変数を含む包括的なzshセットアップ
- **エディタ設定**: Vim（`.vimrc`）とNeovim（`.config/nvim/`）の両方に対応した設定
- **Git設定**: `.gitconfig` にはカスタムエイリアスと1Password SSH署名設定
- **言語固有設定**: Python（`.pythonstartup`）、Ruby（`.pryrc`）などの言語環境設定
- **Claude Code設定**: 
  - `.claude/` - このリポジトリ固有のClaude Code設定とファイル
  - `dot_claude/` - ホームディレクトリに展開される汎用Claude Code設定（`~/.claude/`として配置）

### Neovimプラグインシステム

- プラグインマネージャーとして **dein.vim** を使用
- プラグイン設定は `.config/nvim/dein.toml` と `.config/nvim/dein_lazy.toml` に記述
- 個別のプラグイン設定は `.config/nvim/bundles/plugins/` に保存
- 主要プラグイン: ALE（リンティング）、deoplete（補完）、ctrlp（ファジーファインダー）、NERDTree（ファイルエクスプローラー）

### 環境管理

`.zshrc` では複数の開発環境をセットアップ:
- **Node.js**: nodenvによるバージョン管理
- **Python**: pyenvとvirtualenvサポート
- **Ruby**: rbenvによるバージョン管理
- **Go**: GOPATH設定とカスタムエイリアス
- **Rust**: Cargoバイナリパス設定

### 主要エイリアスと関数

Gitショートカット: `g`, `ga`, `gd`, `gs`, `gco`, `gc` など
Docker Compose: `dcup`, `dcdown`, `dcr`, `dce`, `dcl`
開発ツール: `be` (bundle exec), `ys` (yarn start)
カスタム関数: `peco-src` (ファジーリポジトリ検索), `peco-git-switch` (ブランチ切り替え)

## 開発ワークフロー

このリポジトリはシンボリックリンクベースのアプローチを使用し、`install.sh` スクリプトがリポジトリファイルからホームディレクトリ内の期待される場所へのシンボリックリンクを作成します。

### 特別な処理
- `.config/nvim` ディレクトリは全体として特別にシンボリックリンクされます
- `dot_claude/` ディレクトリは `~/.claude/` としてコピーされ、全プロジェクト共通のClaude Code設定として使用されます

## ツール統合

- **peco**: コマンド履歴とgitブランチのインタラクティブフィルタリング
- **ghq**: `/Users/mktakuya/src` をルートとするリポジトリ管理
- **direnv**: 環境変数の自動読み込み
- **1Password**: Git コミット用SSH キー署名
- **各種補完機能**: GitHub CLI、AWS Vault、Terraform、Google Cloud SDK