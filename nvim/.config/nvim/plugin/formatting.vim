" function! neoformat#formatters#php#enabled() abort
"     return ['prettierphp']
" endfunction

" function! neoformat#formatters#php#prettierphp() abort
"     return {
"         \ 'exe': 'prettier',
"         \ 'args': ['--stdin-filepath', '"%:p"'],
"         \ 'stdin': 1,
"         \ 'try_node_exe': 1,
"         \ }
" endfunction
