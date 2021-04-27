set encoding=utf-8
scriptencoding utf-8

" Encoding. {{{
if has('vim_starting') " Changing encoding in Vim at runtime is undefined behavior.
  set fileencodings=utf-8,sjis,cp932,euc-jp
  set fileformats=unix,mac,dos
endif

" setting global variable
let g:tex_flavor = "latex"
" default plugin setting
let g:loaded_gzip              = 1
let g:loaded_tar               = 1
let g:loaded_tarPlugin         = 1
let g:loaded_zip               = 1
let g:loaded_zipPlugin         = 1
let g:loaded_rrhelper          = 1
let g:loaded_2html_plugin      = 1
let g:loaded_vimball           = 1
let g:loaded_vimballPlugin     = 1
let g:loaded_getscript         = 1
let g:loaded_getscriptPlugin   = 1
"let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1
let g:netrw_nogx = 1


if has('gui_running')
  set guifont=Hack\ Nerd\ Font
endif

" setting fzf's runtime
if executable('fzf')
  if has('mac')
    " homebrew install fzf
    set rtp+=/usr/local/opt/fzf
  elseif has('linux')
    set rtp+=~/.fzf
  endif
endif

"packadd minpac
if exists('g:loaded_minpac')
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('andymass/vim-matchup')
  call minpac#add('cocopon/iceberg.vim')
  call minpac#add('cocopon/vaffle.vim')
  call minpac#add('cohama/lexima.vim')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('itchyny/vim-cursorword')
  call minpac#add('itchyny/calendar.vim')
  call minpac#add('lambdalisue/gina.vim')
  call minpac#add('lambdalisue/suda.vim')
  call minpac#add('thinca/vim-quickrun')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('prabirshrestha/vim-lsp')
  call minpac#add('prabirshrestha/asyncomplete.vim')
  call minpac#add('prabirshrestha/asyncomplete-lsp.vim')
  call minpac#add('previm/previm')
  call minpac#add('mattn/vim-lsp-settings')
  call minpac#add('sheerun/vim-polyglot')
  call minpac#add('tyru/open-browser.vim')
  call minpac#add('vim-jp/autofmt')
  call minpac#add('vim-jp/vimdoc-ja')
  call minpac#add('vim-jp/syntax-vim-ex')
  call minpac#add('vim-jp/vital.vim', {'type': 'opt'})
  call minpac#add('easymotion/vim-easymotion')
  call minpac#add('ryanoasis/vim-devicons')
  call minpac#add('lambdalisue/glyph-palette.vim')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('glidenote/memolist.vim')
  call minpac#add('mhinz/vim-sayonara')
  call minpac#add('tyru/caw.vim')
  call minpac#add('thinca/vim-ref')
endif

command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update()
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

syntax enable
filetype plugin indent on

" テキストの折返しをするかどうか...
" set nowrap

" setting csv.vim
let g:csv_delim = ','

set autoindent
set smartindent

"backgroundを暗い色に設定"
set background=dark

"colorschemeをgruvboxに設定
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme iceberg

"行番号を表示
set number

"バックアップファイルを作らない
set nobackup

"バックスペースの問題を解消
" :h 'backspace'
set backspace=indent,eol,start

"行末の1文字先までカーソルを移動可能に
set virtualedit=onemore

"エンターキーで確定する前から，文字が入力されるたびに検索を行う
set incsearch

"検索で大文字と小文字を区別しない
set ignorecase

"スワップファイルを作らない
set noswapfile

"検索文字列をハイライト
set hlsearch

"TABキーを押した際にタブ文字の代わりにスペースを入れる,スペースのサイズは四文字
set expandtab
set tabstop=4
set shiftwidth=4

" コマンドラインモードの補完をカスタマイズ
set wildmenu
set wildmode=full

" 履歴の記録を増やす
set history=200

"マウスを有効
if has('mouse')
  set mouse=a
endif

"modeを非表示にする
set noshowmode

"スペースをトリガーにする
let mapleader = "\<Space>"

noremap <Leader>t :terminal<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>f :GFiles<CR>
if executable('rg')
  nnoremap <Leader>g :Rg<CR>
endif

"ウインドウ移動ショートカットをswに当てる
nnoremap sw <C-w>w

if has('terminal')
  tnoremap <silent><C-u> <C-\><C-N>
endif

"検索ハイライトの設定
nnoremap <ESC><ESC> :nohlsearch<CR>

" ----setting gina.vim
nnoremap <Up> :Gina status<CR>
nnoremap <Down> :Gina commit<CR>
nnoremap <Left> :Gina diff<CR>
nnoremap <Right> :Gina grep<CR>
if !has('gui_running')
  noremap! <Up> <Nop>
  noremap! <Down> <Nop>
  noremap! <Left> <Nop>
  noremap! <Right> <Nop>
endif

"---------setting vim-airline-----------

"シーケンスの遅延を解消
set ttimeoutlen=10
let g:airline_powerline_fonts = 1
let g:airline_extensions = ['tabline', 'gina', 'fzf', 'branch', 'searchcount', 'quickfix']
let g:airline_section_c = '%t%m'


nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

"--------setting vim-quickrun------------

if !exists("g:quickrun_config")
  let g:quickrun_config = {
        \    "_" : {
        \       "runner" : "job",
        \       "outputter" : "buffer",
        \   },
        \    'tex': {
        \    'command': 'platex',
        \    'exec': ['%c -output-directory %s:h %s', 'dvipdfmx -o %s:r.pdf %s:r.dvi', 'open %s:r.pdf']
        \   },
        \    'plantuml': {
        \    "command": "plantuml",
        \    "exec": ["%c %s", "open %s:r.png"],
        \}
        \}
endif

" define indent command
function s:Indent()
  let save_cursor = getcurpos()
  execute "normal " . "gg=G"
  call setpos('.', save_cursor)
endfunction
command -nargs=0 Indent call s:Indent()

function s:PluginList()
  let files = split(globpath(&rtp, "pack/minpac/*/*"), "\n")
  call map(files, 'fnamemodify(v:val, ":t")')
  for plug in files
    echo plug
  endfor
endfunction
command -nargs=0 PluginList call s:PluginList()

" 補完コマンドの再設定
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : MyInsCompl()
function! MyInsCompl()
  let c = nr2char(getchar())
  if c == "l"
    return "\<C-x>\<C-l>"
  elseif c == "n"
    return "\<C-x>\<C-n>"
  elseif c == "p"
    return "\<C-x>\<C-p>"
  elseif c == "k"
    return "\<C-x>\<C-k>"
  elseif c == "t"
    return "\<C-x>\<C-t>"
  elseif c == "i"
    return "\<C-x>\<C-i>"
  elseif c == "]"
    return "\<C-x>\<C-]>"
  elseif c == "f"
    return "\<C-x>\<C-f>"
  elseif c == "d"
    return "\<C-x>\<C-d>"
  elseif c == "v"
    return "\<C-x>\<C-v>"
  elseif c == "u"
    return "\<C-x>\<C-u>"
  elseif c == "o"
    return "\<C-x>\<C-o>"
  elseif c == "s"
    return "\<C-x>s"
  endif
  return "\<Tab>"
endfunction

augroup MyFileTypeIndentOverRide
  autocmd!
  autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" --------setting autofmt----------
set formatexpr=autofmt#japanese#formatexpr()

" --------settihg vim-lsp----------
let g:lsp_diagnostics_echo_cursor = 1
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" ----------setting termdebeg-------

function! s:OnTermdebug() abort
  if executable('gdb')
    packadd termdebug
    :Termdebug
  else
    echo 'gdb is not found'
  endif
endfunction
command -nargs=0 OnTermdebug call s:OnTermdebug()

if executable('ctags')
  set tags=./tags;
endif

" -------setting vim-devicons------------

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '' " symbol for closed folder (f07b)

" --------setting fzf.vim----------

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': '10new' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

" ----------setting previm-----------

let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
nnoremap <silent> <C-p> :PrevimOpen<CR>

" ----------setting vaffle-----------

function! RenderMyFavoriteIcon(item) abort
  return WebDevIconsGetFileTypeSymbol(a:item.basename, a:item.is_dir)
endfunction
let g:vaffle_render_custom_icon = 'RenderMyFavoriteIcon'

augroup my-glyph-palette
  autocmd! *
  autocmd FileType vaffle call glyph_palette#apply()
augroup END
" ---------setting open-blowser.vim

nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" delete hidden buffer

function s:DeleteHiddenBuffers()
  let tpbl=[]
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
    silent execute 'bwipeout' buf
  endfor
endfunction
command -nargs=0 DeleteHiddenBuffers call s:DeleteHiddenBuffers()

let g:python_highlight_all = 1

" setting caw.vim
nmap <Leader>c <Plug>(caw:zeropos:toggle)
vmap <Leader>c <Plug>(caw:zeropos:toggle)

let g:ref_man_cmd = '/usr/bin/man'
let g:gina#command#blame#formatter#format = "%su%=by %au %ma%in"
