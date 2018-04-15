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

call plug#begin()

Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'chiel92/vim-autoformat'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'godlygeek/tabular'
Plug 'haya14busa/is.vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'heavenshell/vim-pydocstring'
Plug 'honza/vim-snippets'
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
Plug 'mbbill/undotree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'udalov/kotlin-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if has('timers') && exists('*job_start') && exists('*ch_close_in')
  Plug 'w0rp/ale'
endif

if has('mac')
  Plug 'Valloric/YouCompleteMe', {'do': './install.py --clang-completer --go-completer --js-completer'}
endif

call plug#end()

" 907th/vim-auto-save
let g:auto_save = 1

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" fatih/vim-go
let g:go_fmt_autosave = 0

" heavenshell/vim-jsdoc
let g:jsdoc_tags = {
  \   'returns': 'return',
  \ }

" JamshedVesuna/vim-markdown-preview
let vim_markdown_preview_hotkey = '<C-m>'
let vim_markdown_preview_browser = 'Google Chrome'
if executable('grip')
  let vim_markdown_preview_github = 1
endif

" jiangmiao/auto-pairs
let g:AutoPairsMapSpace = 0

" junegunn/fzf
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--color=always --format="%C(auto)%h%d %s %C(green)%C(bold)%cr"'
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* Gg
  \ call fzf#vim#grep(
  \   'git grep --line-number --color=always '.shellescape(<q-args>), 0,
  \   extend(
  \     {'dir': systemlist('git rev-parse --show-toplevel')[0]},
  \     <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   ), <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%') : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" octol/vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_no_function_highlight = 1

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_new_list_item_indent = 2

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = "<C-j>"

" scrooloose/nerdcommenter
let g:NERDDefaultAlign = 'left'

" scrooloose/nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.pyc$', '__pycache__', 'node_modules']
let NERDTreeMapJumpNextSibling = '<C-n>'
let NERDTreeMapJumpPrevSibling = '<C-p>'

" Valloric/YouCompleteMe
let g:ycm_key_list_select_completion = ['<TAB>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<C-p>', '<Up>']
let g:ycm_auto_trigger = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_semantic_triggers = {'c,cpp,python,javascript,typescript,go,java': ['re!\w{2}']}
let g:ycm_filetype_whitelist = {
  \ 'sh':1,
  \ 'zsh':1,
  \ 'vim':1,
  \ 'c':1,
  \ 'cpp':1,
  \ 'python':1,
  \ 'javascript':1,
  \ 'typescript':1,
  \ 'go':1,
  \ 'java':1,
  \ }

" vim-airline/vim-airline
let g:airline_theme = 'molokai'
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
let g:ale_pattern_options = {
  \   '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
  \   '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
  \ }

"*********************************************************************
" Keymap
"*********************************************************************

autocmd BufNewFile,BufRead *.js nmap <silent> <C-l> <Plug>(jsdoc)
autocmd BufNewFile,BufRead *.py nmap <silent> <C-l> <Plug>(pydocstring)

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-p> :bprevious<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>

nmap <Leader><Tab> <Plug>(fzf-maps-n)
xmap <Leader><Tab> <Plug>(fzf-maps-x)
omap <Leader><Tab> <Plug>(fzf-maps-o)

nnoremap <Leader>-      :ALELint<CR>
nnoremap <Leader>:      :copen<CR>:AsyncRun<Space>
nnoremap <Leader>=      :Autoformat<CR>

nnoremap <Leader>H      :help<Space>
nnoremap <Leader>W      :w !sudo tee % > /dev/null<CR>

nnoremap <Leader>a=     :Tabularize /=<CR>
nnoremap <Leader>a:     :Tabularize /:\zs<CR>
vnoremap <Leader>a=     :Tabularize /=<CR>
vnoremap <Leader>a:     :Tabularize /:\zs<CR>

nnoremap <Leader>bb     :Buffers<CR>
nnoremap <Leader>bd     :bdelete<CR>
nnoremap <Leader>bl     :BCommits<CR>

nnoremap <Leader>fa     :Ag<Space><C-r><C-w><CR>
nnoremap <Leader>ff     :Files<CR>
nnoremap <Leader>fg     :Gg<Space><C-r><C-w><CR>
nnoremap <Leader>fl     :Commits<CR>
nnoremap <Leader>fm     :Marks<CR>
nnoremap <Leader>fr     :Rg<Space><C-r><C-w><CR>
nnoremap <Leader>fs     :GFiles?<CR>

nnoremap <Leader>gb     :Gblame<CR>
nnoremap <Leader>gc     :Gcommit<Space>
nnoremap <Leader>gd     :Gdiff<CR>
nnoremap <Leader>ge     :Gedit<Space>
nnoremap <Leader>gg     :GFiles<CR>
nnoremap <Leader>gf     :Gfetch<Space>
nnoremap <Leader>gl     :Gpull<Space>
nnoremap <Leader>gm     :Gmerge<Space>
nnoremap <Leader>gp     :Gpush<Space>
nnoremap <Leader>gr     :Gread<Space>
nnoremap <Leader>gs     :Gstatus<CR>
nnoremap <Leader>gw     :Gwrite<Space>

nnoremap <Leader>jd     :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>ji     :YcmCompleter GoToInclude<CR>
nnoremap <Leader>jj     :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>jr     :YcmCompleter GoToReferences<CR>

nnoremap <Leader>sa     :Ag<Space>
nnoremap <Leader>sg     :Gg<Space>
nnoremap <Leader>sr     :Rg<Space>

nnoremap <Leader>tn     :UndotreeHide<CR>:NERDTreeToggle<CR>
nnoremap <Leader>tt     :TagbarToggle<CR>
nnoremap <Leader>tu     :NERDTreeClose<CR>:UndotreeToggle<CR>

"*********************************************************************
" Overrides
"*********************************************************************

if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif
