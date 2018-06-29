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

syntax on
filetype plugin indent on
