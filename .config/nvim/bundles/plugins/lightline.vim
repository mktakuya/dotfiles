let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
