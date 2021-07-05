packadd ale
let g:ale_linters = {
      \ 'cs': ['OmniSharp']
      \}

nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> K <Plug>(omnisharp_preview_definition)
nmap <silent> <buffer> er <Plug>(omnisharp_global_code_check)
