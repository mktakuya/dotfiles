augroup markdown
    au!
    au BufNewFile, BufRead *.md, *.markdown setl filetype=gmarkdown
augroup END
autocmd FileType markdown setl autoindent smartindent expandtab nocindent
autocmd FileType markdown setl tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType gmarkdown setl autoindent smartindent expandtab nocindent
autocmd FileType gmarkdown setl tabstop=2 softtabstop=2 shiftwidth=2
let g:vim_markdown_folding_disabled=1
