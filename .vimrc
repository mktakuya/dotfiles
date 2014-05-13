" --------------------
" 基本設定
" --------------------
" ファイル読み込み時の設定
set nocp
set filetype=on
filetype plugin indent on
set fileencoding=utf-8
set browsedir=buffer
au BufWritePost * mkview
autocmd BufReadPost * loadview

" バックアップ関連
set backup
set backupdir=$HOME/.vimbackup

" Swapファイル関連
set swapfile
set directory=$HOME/.vimbackup
set updatecount=100
set updatetime=180000

" Backspace関連
set backspace=start,eol,indent

" インデント関連
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab

" クリップボード関連の設定
set clipboard=autoselect
set clipboard+=unnamed
set clipboard=unnamedplus

" 見た目の設定
set syntax=on
set number
set ruler
set showmatch
set laststatus=2
set statusline =%F%r%h%=
set cursorline
set colorcolumn=80

" マウス関連
set mouse=h
set mousehide

" 検索関連
set incsearch
set ignorecase
set smartcase
set wrapscan

" コード補完関連
set wildmenu wildmode=list:full

" 入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

" --------------------
" 言語別設定
" --------------------
" HTML
autocmd FileType html setlocal nocindent expandtab tabstop=8 softtabstop=2 shiftwidth=2

" CSS
autocmd FileType css setlocal nocindent expandtab tabstop=8 softtabstop=2 shiftwidth=2

" C言語
autocmd FileType c setlocal cindent expandtab tabstop=8 softtabstop=8 shiftwidth=8

" PHP http://tech.basicinc.jp/PHP/2013/06/17/vim-php/
autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict

" Python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Ruby
set tabstop=2 shiftwidth=2 softtabstop=2

" Jinja
autocmd FileType jinja setl nocindent expandtab tabstop=8 softtabstop=2 shiftwidth=2

" --------------------
" 外部ファイル
" --------------------
" neobundle
source $HOME/dotfiles/.vimrc.neobundle

" neocomplcache
source $HOME/dotfiles/.vimrc.neocomplcache

" --------------------
" プラグインの設定
" --------------------
" taglist.vim
set tags=tags
nmap <F8> :Tlist

" NERDTreeToggle
nmap <F9> :NERDTreeToggle

"" hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_allow_ft = 'html\|vim\|ruby\|sh'

