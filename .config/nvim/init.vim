filetype off
filetype plugin indent off

if &compatible
  set nocompatible
endif

set number
set cursorline
set laststatus=2

set fileencoding=utf-8

set background=dark
set termguicolors

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

set autoread
set hidden
set noswapfile
set nobackup

"" Load dein
runtime! bundles/dein/dein.vim

filetype plugin indent on
