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
  set undofile
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Change mapleader
let mapleader=" "

"*********************************************************************
" Appearance
"*********************************************************************

set background=dark
syntax enable

let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

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
  autocmd BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Disable the preview window feature
set completeopt-=preview

"*********************************************************************
" Plugins
"*********************************************************************

let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
  echo 'Installing vim-plug...'
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  :execute 'source '.fnameescape(vim_plug_path)
endif

if has('nvim')
    let has_features = has('timers')
else
    " Check if Job and Channel functions are available, instead of the features
    let has_features = has('timers') && exists('*job_start') && exists('*ch_close_in')
endif

call plug#begin()

Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/vim-pydocstring'
Plug 'houtsnip/vim-emacscommandline'
Plug 'jamessan/vim-gnupg'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'leafgarland/typescript-vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has_features
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'w0rp/ale'
  Plug 'fszymanski/deoplete-emoji'
  Plug 'wokalski/autocomplete-flow'
  Plug 'zchee/deoplete-clang'
  Plug 'zchee/deoplete-jedi'
endif

call plug#end()

" 907th/vim-auto-save
let g:auto_save = 1

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" heavenshell/vim-jsdoc
let g:jsdoc_tags = {
\   'returns': 'return',
\ }

" JamshedVesuna/vim-markdown-preview
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Google Chrome'
if executable('grip')
  let vim_markdown_preview_github=1
endif

" jiangmiao/auto-pairs
let g:AutoPairsMapSpace = 0

" junegunn/fzf
command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number '.shellescape(<q-args>), 0, <bang>0)
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--color=always --format="%C(auto)%h%d %s %C(green)%C(bold)%cr"'

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" scrooloose/nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let NERDTreeMapJumpNextSibling = '<C-n>'
let NERDTreeMapJumpPrevSibling = '<C-p>'

" Shougo/deoplete.nvim
let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * silent! pclose!

" Shougo/neosnippet
let g:neosnippet#enable_completed_snippet = 1

" vim-airline/vim-airline
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

" w0rp/ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pylint'],
\   'typescript': ['tslint'],
\ }

"*********************************************************************
" Keymap
"*********************************************************************

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-p> :bprevious<CR>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

autocmd BufNewFile,BufRead *.js nmap <silent> <C-l> <Plug>(jsdoc)
autocmd BufNewFile,BufRead *.py nmap <silent> <C-l> <Plug>(pydocstring)

nmap <leader><TAB> <plug>(fzf-maps-n)
xmap <leader><TAB> <plug>(fzf-maps-x)
omap <leader><TAB> <plug>(fzf-maps-o)

nnoremap <leader>=              :Autoformat<CR>
nnoremap <leader>:              :AsyncRun<SPACE>
nnoremap <leader>W              :w !sudo tee % > /dev/null<CR>
nnoremap <leader>b              :Buffers<CR>
nnoremap <leader>f<SPACE>       :Files<SPACE>
nnoremap <leader>ff             :Files<CR>
nnoremap <leader>g<SPACE>       :GGrep<SPACE>
nnoremap <leader>gb             :Gblame<CR>
nnoremap <leader>gc             :BCommits<CR>
nnoremap <leader>gd             :Gdiff<CR>
nnoremap <leader>gf             :GFiles<CR>
nnoremap <leader>gg             :GGrep<SPACE><C-r><C-w><CR>
nnoremap <leader>gl             :Commits<CR>
nnoremap <leader>gs             :GFiles?<CR>
nnoremap <leader>l              :ALELint<CR>
nnoremap <leader>m              :Marks<CR>
nnoremap <leader>n              :NERDTreeToggle<CR>
nnoremap <leader>t              :TagbarToggle<CR>

"*********************************************************************
" Overrides
"*********************************************************************

if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif
