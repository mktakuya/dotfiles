# (d) is default on

# ------------------------------
# General Settings
# ------------------------------
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす

### PATH ###
# MacのPATH
case ${OSTYPE} in darwin*)
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
esac

#bindkey -e               # キーバインドをemacsモードに設定
bindkey -v              # キーバインドをviモードに設定

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う setopt notify            # バックグラウンドジョブの状態変化を即時報告する setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

### Glob ###
setopt extended_glob # グロブ機能を拡張する
unsetopt caseglob    # ファイルグロブで大文字小文字を区別しない

### History ###
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する

# マッチしたコマンドのヒストリを表示できるようにする
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# すべてのヒストリを表示する
function history-all { history -E 1 }


# ------------------------------
# Look And Feel Settings # ------------------------------
### Ls Color ###
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### Prompt ###
# プロンプトに色を付ける
autoload -U colors; colors
# 一般ユーザ時
tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト
# SSHログイン時のプロンプト
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
  PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
;

# ------------------------------
# Other Settings
# ------------------------------
### RVM ###
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

### Aliases ###
case ${OSTYPE} in
    darwin*)
        alias ls="ls -G"
        ;;
    linux*)
        alias ls="ls --color"
        ;;
esac

alias v=vim
alias rv='r vim'
alias g=git
alias sl=ls
alias be='bundle exec'

# cdコマンド実行後、lsを実行する
function cd() {
  builtin cd $@ && ls;
}


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Eclipse
export PATH="/usr/local/eclipse:$PATH"

### Processing
export PATH="/opt/processing-2.1:$PATH"

### http://shirusu-ni-tarazu.hatenablog.jp/entry/2013/01/18/034233
setopt nonomatch

### http://d.hatena.ne.jp/ksnt/20110308 Pythonの対話シェルの補完
export PYTHONSTARTUP="$HOME/.pythonstartup"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

### PostgreSQL関連
# http://qiita.com/tstomoki/items/0f1a930bd42a8e1fdaac
export PGDATA=/usr/local/var/postgres

# mosh
compdef mosh=ssh

# direnv
case ${OSTYPE} in darwin*)
    eval "$(direnv hook zsh)"
esac

# MacVim関連
case ${OSTYPE} in darwin*)
    if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
        alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
        alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    fi
esac

case ${OSTYPE} in darwin*)
    if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
        export WORKON_HOME=$HOME/.virtualenvs
        source /usr/local/bin/virtualenvwrapper.sh
    fi
esac

### Java関連 ###
case ${OSTYPE} in darwin*)
    export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
esac

### zsh-completions ###
case ${OSTYPE} in darwin*)
    if [ -e /usr/local/share/zsh-completions ]; then
        fpath=(/usr/local/share/zsh-completions $fpath)
    fi
esac

### cabal ###
export PATH=${HOME}/.cabal/bin:$PATH

### git の補完 ###
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

### Swift ###
case ${OSTYPE} in darwin*)
    export PATH=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH
esac

### coffeescriptのコンパイル ###
alias node-coffee='coffee --compile --output js coffee && node'


### pyenv ###
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


### nodebrew ###
export PATH=$HOME/.nodebrew/current/bin:$PATH

### Golang ###
alias gore="gore -autoimport"
case ${OSTYPE} in darwin*)
    export PATH="/usr/local/go/bin:$PATH"
    export GOROOT=`go env GOROOT`
    export GOPATH="$HOME/dev"
    export PATH="$PATH:$GOPATH/bin"
esac

### peco ###
case ${OSTYPE} in darwin*)
    bindkey '^]' peco-src
esac

function peco-src() {
    local src=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$src" ]; then
        BUFFER="cd $src"
        zle accept-line
    fi
    zle -R -c
}
zle -N peco-src

# http://qiita.com/shiraco/items/8971e38cbbd42ea32d73
alias nswitch="source ~/.switch_proxy.zsh"
if [ -e "$HOME/.switch_proxy.zsh" ]; then
    nswitch
fi

# added by travis gem
[ -f /Users/mktakuya/.travis/travis.sh ] && source /Users/mktakuya/.travis/travis.sh

# for golang glide
export GO15VENDOREXPERIMENT=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mktakuya/.go_appengine/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/mktakuya/.go_appengine/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mktakuya/.go_appengine/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/mktakuya/.go_appengine/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U compinit
compinit -u

