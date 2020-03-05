" rubyで定義元メソッドへジャンプ ctags+vim-tags - 気軽に楽しくプログラムと遊ぶ
" http://tamata78.hatenablog.com/entry/2015/07/16/211555
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -f .tags -R . 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R -f .Gemfile.lock.tags `bundle show --paths` 2>/dev/null"
set tags+=.tags
set tags+=.Gemfile.lock.tags

nnoremap <C-]> g<C-]>
