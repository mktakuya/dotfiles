case $OSTYPE in
  darwin*)
    BREW_PREFIX="$(brew --prefix)"
    FPATH="$BREW_PREFIX/share/zsh/site-functions:$BREW_PREFIX/share/zsh-completions:$FPATH"
    ;;
esac
