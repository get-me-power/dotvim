scriptencoding utf-8

function! s:vimplug_check()
  call plug#begin($TRAVIS_BUILD_DIR . '/plugged')
  call plug#end()
  call assert_equal(2, exists(':Plug'))
  if len(v:errors) >= 1
    echo v:errors
    execute 'cq!'
  endif
  execute 'qall!'
endfunction

call s:vimplug_check()
