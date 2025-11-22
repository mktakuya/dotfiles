bindkey -v

bindkey "^[[Z" reverse-menu-complete
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

if type "peco" > /dev/null 2>&1; then
  bindkey '^]' peco-src
  bindkey '^b' peco-git-switch
fi
