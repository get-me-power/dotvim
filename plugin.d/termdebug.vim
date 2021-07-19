function! s:OnTermdebug() abort
  if executable('gdb')
    packadd termdebug
    :Termdebug
  else
    echo 'gdb is not found'
  endif
endfunction
command -nargs=0 OnTermdebug call s:OnTermdebug()
