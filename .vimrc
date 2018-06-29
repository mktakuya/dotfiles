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

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

set ambiwidth=double

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

syntax on
filetype plugin indent on
