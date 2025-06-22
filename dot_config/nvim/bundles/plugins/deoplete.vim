let g:deoplete#enable_at_startup = 1

call deoplete#custom#var('omni', 'input_patterns', {
\   'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
\ })
