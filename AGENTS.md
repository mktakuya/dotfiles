# dotfiles

mktakuya の個人 dotfiles リポジトリ。`setup.sh` を実行することで、各ファイルをホームディレクトリにシンボリックリンクとして展開する。

## セットアップ

```bash
./setup.sh
```

- `home/` 以下の隠しファイルを `$HOME/` にシンボリックリンクで展開する
- `home/AGENTS.md` を `$HOME/AGENTS.md` にシンボリックリンクで展開する
- `home/.agents/skills/` 以下の各スキルディレクトリを `~/.claude/skills/` にシンボリックリンクで展開する
- `dot_config/` 以下の各ディレクトリを `$HOME/.config/` にシンボリックリンクで展開する
- Git 設定は OS を判定し、macOS なら `config.macos`、それ以外なら `config.other` を `config` として使う

## 注意事項

- このリポジトリは個人 PC・会社貸与 PC で共通利用しているため、個人情報・会社固有の情報（社内ホスト名、社内トークン、Jira プロジェクトキー、プロダクトのコードネーム、業務固有のエイリアスなど）をコミットしない
- `home/` 以下のファイルを直接編集すると、シンボリックリンク経由でホームディレクトリの設定も変更される
- `dot_config/git/config` は `setup.sh` が作るシンボリックリンクで、直接編集しない。OS に応じて `config.macos` または `config.other` を編集する
- `home/.claude/` は Claude Code のグローバル設定領域であり、プロジェクト横断のスキル・設定・プロンプトが含まれる
