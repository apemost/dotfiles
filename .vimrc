let g:custom_background = 'dark'
let g:custom_colorscheme = 'molokai'

let g:custom_completion_plugin = 'youcompleteme'
let g:custom_lint_plugin = 'ale'

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/.vim/init.vim'
