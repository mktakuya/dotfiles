filetype off
filetype plugin indent off

if &compatible
  set nocompatible
endif

let g:ruby_host_prog = $RBENV_ROOT . '/shims/ruby'

set number
set cursorline
set laststatus=2

set fileencoding=utf-8

set background=dark
set termguicolors

set clipboard+=unnamedplus

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

nnoremap <Esc><Esc> :noh<CR>

set autoread
set hidden
set noswapfile
set nobackup

"" Load dein
runtime! bundles/dein/dein.vim

filetype plugin indent on
