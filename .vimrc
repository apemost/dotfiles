let g:custom_theme_background = 'dark'
let g:custom_theme_colorscheme = 'molokai'

let g:custom_plugins_completion = 'youcompleteme'
let g:custom_plugins_lint = 'ale'

let g:custom_plugins_enabled = [
      \   'YouCompleteMe',
      \   'airline',
      \   'ale',
      \   'asyncrun',
      \   'auto-pairs',
      \   'auto-save',
      \   'autoformat',
      \   'cpp',
      \   'editorconfig',
      \   'emacscommandline',
      \   'emmet',
      \   'fugitive',
      \   'fzf',
      \   'gitgutter',
      \   'gnupg',
      \   'go',
      \   'is',
      \   'javascript',
      \   'jsdoc',
      \   'json',
      \   'kotlin',
      \   'markdown',
      \   'nerdcommenter',
      \   'nerdtree',
      \   'pydocstring',
      \   'rename',
      \   'repeat',
      \   'sneak',
      \   'surround',
      \   'tabular',
      \   'tagbar',
      \   'typescript',
      \   'ultisnips',
      \   'undotree',
      \   'vue',
      \ ]

execute 'source' fnamemodify(expand('<sfile>'), ':h') . '/.vim/init.vim'
