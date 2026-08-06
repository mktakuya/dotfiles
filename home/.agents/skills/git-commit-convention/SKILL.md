---
name: git-commit-convention
description: git commit するとき、コミットメッセージを書く・書き直すとき、または Co-Authored-By を付けるかどうか判断するときに使う。件名・本文の書き方とクレジットの規約。
---

# コミットメッセージ規約

## 件名（1 行目）

- 日本語で「〜する」「〜を修正する」のように動詞終わりで、変更内容を簡潔に書く
- prefix は基本的に不要
  - ただし revert / refactor など文脈上必要な場合は `revert:` `refactor:` のように小文字で付けてよい

## 本文（3 行目以降）

必要に応じて「なぜその変更をしたのか」を書く。

- 変更の動機・背景・理由を説明する（「何を変えたか」ではなく「なぜ変えたか」）
- 関連する GitHub PR のレビューコメント URL、Slack スレッド URL、Notion ページ URL などがあればそのまま貼る
- 自明な変更や、件名だけで十分な場合は本文なしでよい

## Co-Authored-By

- 単なるコメントに対するコミットでは Co-Authored-By を使わない
- GitHub 上で Suggested change されたものを採用する場合は、Co-Authored-By でレビュワーをクレジットする
- クレジットに使うユーザー名・メールアドレスは `~/.config/git/message` を参照する

```bash
cat ~/.config/git/message
```

コメントアウトされた候補が並んでいるので、該当するレビュワーの行を採用する。

## 書き方の例

```
境界値の比較演算子を修正する

パラメータが上限値そのものだったときに弾かれていた。
https://github.com/example/repo/pull/123#discussion_r456

Co-authored-by: reviewer <reviewer@example.com>
```
