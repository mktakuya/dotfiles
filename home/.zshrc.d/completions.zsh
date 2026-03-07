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

if [[ -d $HOME/.pyenv ]]; then
  FPATH="$HOME/.pyenv/completions:$FPATH"
fi

if type "gcloud" > /dev/null 2>&1; then
  case ${OSTYPE} in darwin*)
    FPATH="/opt/homebrew/share/google-cloud-sdk/completion.zsh.inc:$FPATH"
  esac
fi
