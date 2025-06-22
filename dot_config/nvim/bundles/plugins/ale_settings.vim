let g:lightline = {
  \'active': {
  \  'left': [
  \    ['mode', 'paste'],
  \    ['readonly', 'filename', 'modified', 'ale'],
  \  ]
  \},
  \'component_function': {
  \  'ale': 'ALEGetStatusLine'
  \}
\ }
let g:ale_lint_on_text_changed = 0
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'python': ['autopep8', 'isort'],
      \ 'ruby': ['rubocop']
      \ }
let g:ale_fix_on_save = 1
