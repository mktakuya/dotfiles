set number
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set splitright
set clipboard=unnamed
set hls

" Neovim v0.4.3でファイルを開くと一文字目がgに置換され謎のコマンドが入力される話 - JoTech
" https://hiroki-sawano.hatenablog.com/entry/2020/07/09/223247
cnoremap 1130 <C-u>undo<CR>

let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'

fun! StripTrailingWhitespace()
  if &ft =~ 'modula2\|markdown'
    return
  endif
  %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable
