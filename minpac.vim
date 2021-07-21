function! s:init() abort
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('andymass/vim-matchup')
  call minpac#add('buoto/gotests-vim')
  call minpac#add('cocopon/iceberg.vim')
  call minpac#add('cocopon/vaffle.vim')
  call minpac#add('cohama/lexima.vim')
  call minpac#add('easymotion/vim-easymotion')
  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('glidenote/memolist.vim')
  call minpac#add('itchyny/vim-cursorword')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('lambdalisue/gina.vim')
  call minpac#add('lambdalisue/suda.vim')
  call minpac#add('lambdalisue/glyph-palette.vim')
  call minpac#add('mattn/vim-lsp-settings')
  call minpac#add('OmniSharp/omnisharp-vim')
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('previm/previm')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('thinca/vim-quickrun')
  call minpac#add('thinca/vim-ref')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tyru/caw.vim')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('vim-jp/autofmt')
  call minpac#add('vim-jp/vimdoc-ja')
  call minpac#add('vim-jp/syntax-vim-ex')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  " textobj
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-indent')
  call minpac#add('mattn/vim-textobj-url')
  call minpac#add('osyo-manga/vim-textobj-multiblock')
  call minpac#add('sgur/vim-textobj-parameter')
  "lazy loading
  call minpac#add('dense-analysis/ale', {'type': 'opt'})
  call minpac#add('vim-jp/vital.vim', {'type': 'opt'})
endfunction
function! s:install() abort
  let path = '~/.vim/pack/minpac/opt/minpac'
  let path = expand(path)
  if isdirectory(path)
    call delete(path, 'rf')
  endif
  call system(printf('git clone https://github.com/k-takata/minpac.git %s', path))
endfunction
" Load plugin.d/*.vim
function! s:load_configurations() abort
  for path in glob('$VIMHOME/plugin.d/*.vim', 1, 1, 1)
    execute printf('source %s', fnameescape(path))
  endfor
endfunction
call s:load_configurations()
command! PackInstall call s:install()
command! PackUpdate  packadd minpac | source $VIMHOME/minpac.vim | call s:init() | call minpac#update()
command! PackClean   packadd minpac | source $VIMHOME/minpac.vim | call s:init() | call minpac#clean()
command! PackStatus  packadd minpac | call minpac#status()
