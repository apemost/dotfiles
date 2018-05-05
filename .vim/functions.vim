"*********************************************************************
" Functions
"*********************************************************************

function! TrySource(filepath)
  if filereadable(a:filepath)
    execute 'source' fnameescape(a:filepath)
  endif
endfunction

function! HasFeatures()
  return has('timers') && exists('*job_start') && exists('*ch_close_in')
endfunction
