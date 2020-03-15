filetype off
filetype plugin indent off

if &compatible
  set nocompatible
endif

let g:ruby_host_prog = $RBENV_ROOT . '/shims/ruby'
let g:python_host_prog = $PYENV_ROOT . '/shims/python'
let g:python3_host_prog = $PYENV_ROOT . '/shims/python3'

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

" tab
nnoremap st :<C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT

set autoread
set hidden
set noswapfile
set nobackup

" [\ No newline at end of fileの修正 - Qiita](https://qiita.com/lemtosh469/items/b3a5b3b40d9f44dfbd06)
set binary noeol

"" Load dein
runtime! bundles/dein/dein.vim

autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufNewFile,BufRead *.coffee setlocal filetype=coffee

filetype plugin indent on
