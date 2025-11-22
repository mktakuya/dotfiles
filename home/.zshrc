# ----- $HOME/.zshrc.d/*.zsh をロードする
for file in "$HOME/.zshrc.d/"*.zsh(N); do
  source "$file"
done

autoload -Uz compinit
compinit -C
