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
fun! StripTrailingWhitespace()
    " don't strip on these filetypes
    if &ft =~ 'modula2\|markdown'
        return
    endif
    %s/\s\+$//e
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" 全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

" 全角記号を正しく表示させる
" http://ac-mopp.blogspot.jp/2012/10/mac-iterm2-vim.html
set ambiwidth=double

set undodir=D:$HOME/.vimbackup

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
set clipboard=unnamed

" 見た目の設定
set syntax=on
set number
set ruler
set showmatch
set laststatus=2
set statusline =%F%r%h%=
set nocursorline
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
set autoindent smartindent expandtab nocindent tabstop=2 softtabstop=2 shiftwidth=2

" HTML
autocmd FileType html setlocal nocindent tabstop=2 softtabstop=2 shiftwidth=2

" CSS
autocmd FileType css setlocal nocindent tabstop=2 softtabstop=2 shiftwidth=2

" C言語
autocmd FileType c setlocal cindent tabstop=8 softtabstop=8 shiftwidth=8

" PHP http://tech.basicinc.jp/PHP/2013/06/17/vim-php/
autocmd FileType php set  dictionary=~/.vim/dict/php.dict
autocmd FileType php setl cindent
autocmd FileType php setl tabstop=2 shiftwidth=2 softtabstop=2

" Python
autocmd FileType python setl cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8

" Ruby
autocmd FileType ruby setl expandtab tabstop=2 shiftwidth=2 softtabstop=2

" erb
autocmd FileType eruby setl tabstop=2 shiftwidth=2 softtabstop=2

" slim
autocmd FileType slim setl tabstop=2 shiftwidth=2 softtabstop=2 expandtab

autocmd FileType scss setl tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Javascript
autocmd filetype javascript setlocal shiftwidth=2 softtabstop=2 tabstop=2 expandtab

" JSON
autocmd BufNewFile,BufRead *.json  set filetype=json
autocmd BufNewFile,BufRead *.json  set tabstop=2 shiftwidth=2 expandtab

" Coffee Script
autocmd FileType coffee setl tabstop=2 shiftwidth=2 softtabstop=2

" Jinja
autocmd FileType jinja setl tabstop=8 softtabstop=2 shiftwidth=2

" Markdown

" TeX
let g:tex_conceal=''

" YAML
autocmd FileType yaml,yml setl tabstop=2 shiftwidth=2 softtabstop=2

"------------------------------------
" indent guides
"------------------------------------
hi IndentGuidesOdd  ctermbg=white
hi IndentGuidesEven ctermbg=white
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

syntax on
filetype plugin indent on
