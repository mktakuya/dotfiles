"------------------------------------
" mktakuya の .vimrc
" URL: https://github.com/mktakuya/dotfiles/blob/master/.vimrc
"------------------------------------

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

" 保存時に行末の空白を除去する
"autocmd BufWritePre * :%s/\s\+$//ge
" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

"" ステータスライン
" ステータスラインに文字コード/改行文字種別を表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" 常にステータス行を表示
set laststatus=2

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
" 共通
set autoindent smartindent expandtab tabstop=4 softtabstop=4 shiftwidth=4

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
autocmd FileType ruby setl nocindent autoindent smartindent
autocmd FileType ruby setl tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Jinja
autocmd FileType jinja setl nocindent expandtab tabstop=8 softtabstop=2 shiftwidth=2

" Markdown
autocmd FileType markdown setl nocindent

"------------------------------------
" indent guides
"------------------------------------
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=white
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

"------------------------------------
" 外部ファイル
"------------------------------------
" 補完関連
source ~/dotfiles/.vimrc.completion

" unite.vim
"source ~/dotfiles/.vimrc.unite

" neobundle
source ~/dotfiles/.vimrc.neobundle

"------------------------------------
" プラグイン設定
"------------------------------------

" neocomplcache
"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
let g:neocomplcache_force_overwrite_completefunc=1
let g:neocomplcache_enable_camel_case_completion = 0

" taglist.vim
set tags=tags
nmap <F8> :Tlist

" NERDTreeToggle
nmap <F9> :NERDTreeToggle
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 40

set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" .md をMarkdownとして扱う
au BufRead,BufNewFile *.md set filetype=markdown

syntax on
filetype plugin indent on
