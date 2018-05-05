"*********************************************************************
" Keymap
"*********************************************************************

nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-p> :bprevious<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>

nnoremap <Leader>! :w !sudo tee % > /dev/null<CR>

nnoremap <Leader>bd :bdelete<CR>

nnoremap <Leader>tf :UndotreeHide<CR>:NERDTreeFind<CR>
nnoremap <Leader>tn :UndotreeHide<CR>:NERDTreeToggle<CR>
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>tu :NERDTreeClose<CR>:UndotreeToggle<CR>

nnoremap <Leader>wo :copen<CR>
nnoremap <Leader>wx :cclose<CR>
