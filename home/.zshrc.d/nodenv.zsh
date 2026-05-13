if [[ -d $HOME/.nodenv ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  export NPM_CONFIG_IGNORE_SCRIPTS=true

  eval "$(nodenv init - --no-rehash zsh)"
fi
