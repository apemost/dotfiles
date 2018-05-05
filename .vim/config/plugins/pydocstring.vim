"*********************************************************************
" heavenshell/vim-pydocstring
"*********************************************************************

Plug 'heavenshell/vim-pydocstring'

autocmd BufNewFile,BufRead *.py nmap <silent> <C-l> <Plug>(pydocstring)
