case $OSTYPE in
  darwin*)
    BREW_PREFIX="$(brew --prefix)"
    FPATH="$BREW_PREFIX/share/zsh/site-functions:$BREW_PREFIX/share/zsh-completions:$FPATH"
    ;;
esac

if [[ -d $HOME/.rbenv ]]; then
  FPATH="$HOME/.rbenv/completions:$FPATH"
fi

if [[ -d $HOME/.nodenv ]]; then
  FPATH="$HOME/.nodenv/completions:$FPATH"
fi
