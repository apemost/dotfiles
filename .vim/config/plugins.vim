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
let s:plugins = get(g:, 'custom_plugins_enabled', [])

function! s:load_plugins()
  for plugin in s:plugins
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
