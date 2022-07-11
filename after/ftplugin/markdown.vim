scriptencoding utf-8

ia tl - [ ]

setlocal foldmethod=indent

" todoリストのon/offを切り替える
nnoremap <buffer> <Leader>x call ToggleCheckbox()<CR>
vnoremap <buffer> <Leader>x call ToggleCheckbox()<CR>

" 選択行のチェックボックスを切り替える
function! ToggleCheckbox() abort
  let l:line = getline('.')
  if l:line =~ '\-\s\[\s\]'
    let l:result = substitute(l:line, '-\s\[\s\]', '- [x]', '')
    call setline('.', l:result)
  elseif l:line =~ '\-\s\[x\]'
    let l:result = substitute(l:line, '-\s\[x\]', '- [ ]', '')
    call setline('.', l:result)
  end
endfunction
