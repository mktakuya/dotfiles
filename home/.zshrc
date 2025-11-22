# ----- 共通設定
export LANG=ja_JP.UTF-8
export EDITOR=vim

setopt no_beep
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt prompt_subst
setopt notify

setopt extended_glob
unsetopt caseglob

setopt nonomatch


# ----- 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt bang_hist
setopt extended_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end


# ----- Homebrew
if type "brew" > /dev/null 2>&1; then
  eval "$(brew shellenv)"
fi


# ----- PATH を設定する
JETBRAINS_TOOLBOX_PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
if [[ -d $JETBRAINS_TOOLBOX_PATH ]] then
  export PATH="$PATH:$JETBRAINS_TOOLBOX_PATH"
fi

if type "go" > /dev/null 2>&1; then
  export GOPATH=$HOME/go
  export GOBIN=$GOPATH/bin
  export PATH=$PATH:$GOBIN
fi

# ----- 関数を定義する
function peco-src() {
  local ghq_root=$(ghq root)
  local src=$(ghq list | peco --query "$LBUFFER" --prompt "cd>")
  if [ -n "$src" ]; then
    BUFFER="cd $ghq_root/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

function peco-git-switch() {
  local branch=$(git branch | sed -r "s/^[ \*]+//" | peco)
  if [ -n "$branch" ]; then
    BUFFER="git switch $branch"
    zle accept-line
  fi
  zle -R -c
}
zle -N peco-git-switch


# ----- $HOME/.zshrc.d/*.zsh をロードする
for file in "$HOME/.zshrc.d/"*.zsh(N); do
  source "$file"
done


# ----- 補完を有効にする
autoload -Uz compinit
compinit -C


# ----- プロンプトを設定する
autoload -U colors && colors

tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt
PROMPT2=$tmp_prompt2
RPROMPT=$tmp_rprompt
SPROMPT=$tmp_sprompt

[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
