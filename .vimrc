"*********************************************************************
" General
"*********************************************************************

" Make Vim more useful
set nocompatible

" Optimize for fast terminal connections
set ttyfast

" Set to auto read when a file is changed from the outside
set autoread

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Ignore case of searches
set ignorecase

" When searching try to be smart about cases
set smartcase

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Don’t add empty newlines at the end of files
" set binary
" set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Change mapleader
let mapleader=" "

"*********************************************************************
" Appearance
"*********************************************************************

if !has('gui_running')
  " Compatibility for Terminal
  let g:solarized_termtrans=1
endif

" Use the Solarized Dark theme
syntax enable
set background=dark
colorscheme solarized

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Enable line numbers
set number

" Show the cursor position
set ruler

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around
set nostartofline

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Highlight searches
set hlsearch

" Highlight dynamically as pattern is typed
set incsearch

" Make tabs as wide as two spaces
set tabstop=2

" Always show status line
set laststatus=2

" Enable mouse in all modes
set mouse=a

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

"*********************************************************************
" Plugins
"*********************************************************************

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --tern-completer'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'

call plug#end()

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" haya14busa/incsearch.vim
let g:incsearch#auto_nohlsearch = 1

" junegunn/fzf
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" scrooloose/nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Valloric/YouCompleteMe
let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
let g:ycm_auto_trigger = 1

" vim-airline/vim-airline
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" w0rp/ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'html': ['htmlhint'],
\ }

"*********************************************************************
" Keymap
"*********************************************************************

map /   <Plug>(incsearch-forward)
map ?   <Plug>(incsearch-backward)
map g/  <Plug>(incsearch-stay)
map z/  <Plug>(incsearch-fuzzy-/)
map z?  <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)
map n   <Plug>(incsearch-nohl-n)
map N   <Plug>(incsearch-nohl-N)
map *   <Plug>(incsearch-nohl-*)
map #   <Plug>(incsearch-nohl-#)
map g*  <Plug>(incsearch-nohl-g*)
map g#  <Plug>(incsearch-nohl-g#)

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <C-p> :bp<CR>
nmap <C-n> :bn<CR>

" Save a file as root
nnoremap <leader>W :w !sudo tee % > /dev/null<CR>

nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>d :Gdiff<CR>
nnoremap <leader>f :FZF<space>
nnoremap <leader>g :GGrep<space>
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>k :GFiles<CR>
nnoremap <leader>s :GFiles?<CR>
nnoremap <leader>t :TagbarToggle<CR>

"*********************************************************************
" Overrides
"*********************************************************************

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
