autoload -Uz compinit promptinit
compinit
promptinit

# デフォルトのプロンプトを walters テーマに設定する
prompt walters

# ----- $HOME/.zshrc.d/*.zsh をロードする
for file in "$HOME/.zshrc.d/"*.zsh(N); do
  source "$file"
done
