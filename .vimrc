set nocp
set filetype=on
filetype plugin indent on
set fileencoding=utf-8
set browsedir=buffer
au BufWritePost * mkview
autocmd BufReadPost * loadview

fun! StripTrailingWhitespace()
    if &ft =~ 'modula2\|markdown'
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType c setlocal foldmethod=syntax

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

set ambiwidth=double

set eol
set backspace=start,eol,indent

set clipboard=unnamed

set syntax=on
set number
set ruler
set showmatch
set laststatus=2
set statusline =%F%r%h%=
set nocursorline
set colorcolumn=80

set mouse=h
set mousehide

set incsearch
set ignorecase
set smartcase
set wrapscan

set noswapfile
set nobackup

set wildmenu wildmode=list:full

set autoindent
set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

syntax on
filetype plugin indent on

