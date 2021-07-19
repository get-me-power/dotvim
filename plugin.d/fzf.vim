" setting fzf's runtime
if executable('fzf')
  if has('mac')
    " homebrew install fzf
    set rtp+=/usr/local/opt/fzf
  elseif has('linux')
    set rtp+=~/.fzf
  endif
endif


let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': '10new' }
let g:fzf_history_dir = '~/.local/share/fzf-history'
