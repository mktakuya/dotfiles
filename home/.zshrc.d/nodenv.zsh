if [[ -d $HOME/.nodenv ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"

  eval "$(nodenv init - --no-rehash zsh)"
fi
