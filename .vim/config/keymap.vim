"*********************************************************************
" Keymap
"*********************************************************************

" Make Y behave like other capitals
nnoremap Y y$

nmap <silent> <C-n> :bnext<CR>
nmap <silent> <C-p> :bprevious<CR>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>

nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>

nnoremap <Leader>bd :bdelete<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>

nnoremap <Leader>wo :copen<CR>
nnoremap <Leader>wx :cclose<CR>

function! s:google(q)
  let q = substitute(a:q, '["\n]', ' ', 'g')
  let q = substitute(q, '[[:punct:] ]', '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf('open "https://www.google.com/search?q=%s"', q))
endfunction

nnoremap <leader>? :call <SID>google(expand('<cWORD>'))<CR>
xnoremap <leader>? "gy:call <SID>google(@g)<CR>
