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

nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>

nnoremap <Leader>wo :copen<CR>
nnoremap <Leader>wx :cclose<CR>
