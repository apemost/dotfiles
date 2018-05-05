"*********************************************************************
" Plugins
"*********************************************************************

let s:vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(s:vim_plug_path)
  echo 'Installing vim-plug...'
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  execute 'source ' . fnameescape(s:vim_plug_path)
endif

let s:dirname = fnamemodify(expand('<sfile>'), ':h')
if !exists('g:enabled_plugins')
  let g:enabled_plugins = []
endif

function! s:load_plugins()
  for plugin in g:enabled_plugins
    if matchend(plugin, '\.vim') == len(plugin)
      call TrySource(s:dirname . '/plugins/' . plugin)
    else
      call TrySource(s:dirname . '/plugins/' . plugin . '.vim')
    endif
  endfor
endfunction

call plug#begin()
call s:load_plugins()
call plug#end()
