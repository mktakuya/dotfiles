# dotfiles

mktakuya の個人 dotfiles リポジトリ。`setup.sh` を実行することで、各ファイルをホームディレクトリにシンボリックリンクとして展開する。

## セットアップ

```bash
./setup.sh
```

- `home/` 以下の隠しファイルを `$HOME/` にシンボリックリンクで展開する
- `home/AGENTS.md` を `$HOME/AGENTS.md` にシンボリックリンクで展開する
- `home/.agents/skills/` 以下の各スキルディレクトリを `~/.claude/skills/` と `~/.codex/skills/` の両方にシンボリックリンクで展開する。リポジトリから消えたスキルへの壊れたリンクは掃除される
- `dot_config/` 以下の各ディレクトリを `$HOME/.config/` にシンボリックリンクで展開する
- Git 設定は OS を判定し、macOS なら `config.macos`、それ以外なら `config.other` を `config` として使う

## 注意事項

- このリポジトリは個人 PC・会社貸与 PC で共通利用しているため、個人情報・会社固有の情報（社内ホスト名、社内トークン、Jira プロジェクトキー、プロダクトのコードネーム、業務固有のエイリアスなど）をコミットしない
- `home/` 以下のファイルを直接編集すると、シンボリックリンク経由でホームディレクトリの設定も変更される
- `dot_config/git/config` は `setup.sh` が作るシンボリックリンクで、直接編集しない。OS に応じて `config.macos` または `config.other` を編集する
- `home/.claude/` は Claude Code のグローバル設定領域であり、プロジェクト横断の設定・フック・出力スタイルが含まれる
- `home/AGENTS.md` は毎セッション全文がコンテキストに載る。常に守るべきルールだけを置き、手順書やリファレンスは `home/.agents/skills/` の Skill に切り出す
- `home/.claude/` と `home/.codex/` は実行時生成物（履歴・キャッシュ・sqlite）も含むため `.gitignore` で全体を無視し、管理対象だけを `!` で復活させている。新しい設定ディレクトリを追加したときは `.gitignore` への追記を忘れないこと
