"*********************************************************************
" heavenshell/vim-jsdoc
"*********************************************************************

Plug 'heavenshell/vim-jsdoc'

let g:jsdoc_tags = {
      \   'returns': 'return',
      \ }

autocmd BufNewFile,BufRead *.js nmap <silent> <C-l> <Plug>(jsdoc)
