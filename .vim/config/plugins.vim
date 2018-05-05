"*********************************************************************
" Plugins
"*********************************************************************

let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
  echo 'Installing vim-plug...'
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  execute 'source ' . fnameescape(vim_plug_path)
endif

let s:dirname = fnamemodify(expand('<sfile>'), ':h')
if !exists('g:plugins')
  let g:plugins = [
        \   'YouCompleteMe',
        \   'ale',
        \   'asyncrun',
        \   'auto-pairs',
        \   'editorconfig-vim',
        \   'emmet-vim',
        \   'fzf',
        \   'is',
        \   'kotlin-vim',
        \   'nerdcommenter',
        \   'nerdtree',
        \   'rename',
        \   'tabular',
        \   'tagbar',
        \   'typescript-vim',
        \   'ultisnips',
        \   'undotree',
        \   'vim-airline',
        \   'vim-auto-save',
        \   'vim-autoformat',
        \   'vim-cpp-enhanced-highlight',
        \   'vim-emacscommandline',
        \   'vim-fugitive',
        \   'vim-gitgutter',
        \   'vim-gnupg',
        \   'vim-go',
        \   'vim-javascript',
        \   'vim-jsdoc',
        \   'vim-json',
        \   'vim-markdown-preview',
        \   'vim-markdown',
        \   'vim-pydocstring',
        \   'vim-repeat',
        \   'vim-sneak',
        \   'vim-surround',
        \   'vim-vue',
        \ ]
endif

function! s:load_plugins()
  for plugin in g:plugins
    if matchend(plugin, '.vim') == len(plugin)
      call TrySource(s:dirname . '/plugins/' . plugin)
    else
      call TrySource(s:dirname . '/plugins/' . plugin . '.vim')
    endif
  endfor
endfunction


call plug#begin()
call s:load_plugins()
call plug#end()
