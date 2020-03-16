set encoding=utf-8
scriptencoding utf-8

" Encoding. {{{
if has('vim_starting')
  " Changing encoding in Vim at runtime is undefined behavior.
  set fileencodings=utf-8,sjis,cp932,euc-jp
  set fileformats=unix,mac,dos
endif

if has('gui_running')
  set guifont=Hack\ Nerd\ Font
endif

" ---- setting custom plugins ------- "
"set runtimepath+=~/Javasnippet.vim
"set runtimepath+=~/InsertSemiColon.vim
"set runtimepath+=~/vim-zenspace
"set runtimepath+=~/sweep_trail.vim
"set runtimepath+=~/Timer.vim
set runtimepath+=~/myplugin/Weather.vim
"set runtimepath+=~/vim-amake
set runtimepath+=~/myplugin/Tweet.vim
" set runtimepath+=~/myplugin/commentout.vim
" set runtimepath+=~/myplugin/vimgon-quest-menu
set runtimepath+=~/myplugin/vim-starwars
set runtimepath+=~/myplugin/vim-sl
set runtimepath+=~/myplugin/vim
" set runtimepath+=~/myplugin/PlayMusic.vim

" setting fzf's runtime
if executable('fzf')
  if has('mac')
    " homebrew install fzf
    set rtp+=/usr/local/opt/fzf
  elseif has('linux')
    set rtp+=~/.fzf
  endif
endif

syntax enable
filetype plugin indent on

" テキストの折返しをするかどうか...
" set nowrap

" setting csv.vim
let g:csv_delim=','

set autoindent
set smartindent

"backgroundを暗い色に設定"
set background=dark

"colorschemeをgruvboxに設定
colorscheme gruvbox

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
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>

"ウインドウ移動ショートカットをswに当てる
nnoremap sw <C-w>w

if has('terminal')
  tnoremap <silent><C-u> <C-\><C-N>
endif

"検索ハイライトの設定
nnoremap <ESC><ESC> :nohlsearch<CR>

" ----setting gina.vim
packadd gina.vim
if exists(':Gina')
  nnoremap <Up> :Gina status<CR>
  nnoremap <Down> :Gina commit<CR>
  nnoremap <Left> :Gina diff<CR>
  nnoremap <Right> :QuickRun<CR>
endif
noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

"---------setting vim-airline-----------

"シーケンスの遅延を解消
set ttimeoutlen=10

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#term#enabled = 0
let g:airline#extensions#nerdtree_statusline = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme = 'base16_gruvbox_dark_hard'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" powerline symbols

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

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
        \       "runner" : "vimproc",
        \       "runner/vimproc/updatetime" : 60
        \   },
        \    'tex': {
        \    'command': 'platex',
        \    'exec': ['%c -output-directory %s:h %s', 'dvipdfmx -o %s:r.pdf %s:r.dvi', 'open %s:r.pdf']
        \   },
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
  let files = split(globpath(&rtp, "pack/mypackage/*/*"), "\n")
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

"--------plugin update command---------

function s:PluginUpdate() abort
  if has('mac') || has('linux')
    !git -C ~/.vim submodule foreach git pull origin master
  endif
endfunction
command -nargs=0 PluginUpdate call s:PluginUpdate()

augroup MyFileTypeIndentOverRide
  autocmd!
  autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufNewFile,BufReadPre *.org packadd! vim-orgmode
augroup END

" --------setting autofmt----------
set formatexpr=autofmt#japanese#formatexpr()

" --------settihg vim-lsp----------
let g:lsp_diagnostics_echo_cursor = 1
nnoremap <expr> <silent> <C-]> execute(':LspDefinition') =~ "not supported" ? "\<C-]>" : ":echo<cr>"

" setting vim-anzu
let g:airline#extensions#anzu#enabled = 0
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)


" javaのsyntaxの設定
let g:java_highlight_all=1
let g:java_highlight_functions="style"
let g:java_allow_cpp_keywords=1

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
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsDefaultFolderOpenSymbol = '' " symbol for open folder (f07c)
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = '' " symbol for closed folder (f07b)

" --------setting fzf.vim----------

" This is the default extra key bindings
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" ----------setting previm-----------

let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
nnoremap <silent> <C-p> :PrevimOpen<CR>

if executable('java') && filereadable(expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.600.v20191014-2022.jar'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.600.v20191014-2022.jar'),
        \     '-configuration',
        \     expand('~/lsp/eclipse.jdt.ls/config_mac'),
        \     '-data',
        \     getcwd()
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif
