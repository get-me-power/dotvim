set encoding=utf-8
scriptencoding utf-8

" ---- setting custom plugins ------- "
"set runtimepath+=~/Javasnippet.vim
"set runtimepath+=~/InsertSemiColon.vim
"set runtimepath+=~/vim-zenspace
"set runtimepath+=~/sweep_trail.vim
"set runtimepath+=~/Timer.vim
set runtimepath+=~/myplugin/Weather.vim
"set runtimepath+=~/vim-amake
set runtimepath+=~/myplugin/Tweet.vim
set runtimepath+=~/myplugin/commentout.vim
set runtimepath+=~/myplugin/vimgon-quest-menu
set runtimepath+=~/myplugin/vim-starwars
set runtimepath+=~/myplugin/vim-sl
" set runtimepath+=~/myplugin/PlayMusic.vim
syntax enable
filetype plugin indent on

" テキストの折返しをするかどうか...
" set nowrap

set autoindent
set smartindent

"backgroundを暗い色に設定"
set background=dark

"colorschemeをgruvboxに設定
colorscheme gruvbox

"行番号を表示"
set number

"バックアップファイルを作らない"
set nobackup

"バックスペースの問題を解消"
" :h 'backspace'
set backspace=indent,eol,start

"行末の1文字先までカーソルを移動可能に"
set virtualedit=onemore

"エンターキーで確定する前から，文字が入力されるたびに検索を行う"
set incsearch

"検索で大文字と小文字を区別しない"
set ignorecase

"スワップファイルを作らない"
set noswapfile

"検索文字列をハイライト"
set hlsearch

"TABキーを押した際にタブ文字の代わりにスペースを入れる,スペースのサイズは四文字"
set expandtab
set tabstop=4
set shiftwidth=4

" コマンドラインモードの補完をカスタマイズ
set wildmenu
set wildmode=full

" 履歴の記録を増やす
set history=200

"マウスを有効"
if has('mouse')
  set mouse=a
endif

"modeを非表示にする
set noshowmode

"スペース + tでターミナル起動"
let mapleader = "\<Space>"
nnoremap <Leader>t :terminal<CR>

"スペース + v でターミナル起動"
nnoremap <Leader>v :vsplit<CR>

nnoremap <Leader>s :split<CR>

"ウインドウ移動ショートカットをswに当てる"
nnoremap sw <C-w>w

"---------setting lightline.vim-----------"
set laststatus=2

"シーケンスの遅延を解消
set ttimeoutlen=10

let g:lightline = {
      \ 'colorscheme': 'gotham256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

"--------setting vim-quickrun------------"
"
if !exists("g:quickrun_config")
  let g:quickrun_config = {}
endif

"shellのキーバインド設定"
tnoremap <silent> <ESC> <C-\><C-n>
"検索ハイライトの設定"
nnoremap <ESC><ESC> :nohlsearch<CR>

"hjkl縛り"
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

"helpを日本語化"
set helplang=ja,en

" インデントコマンドを定義
function Indent()
  let save_cursor = getcurpos()
  execute "normal " . "gg=G"
  call setpos('.', save_cursor)
endfunction
command -nargs=0 Indent call Indent()

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

"--------plugin update command---------"
function PluginUpdate() abort
  if has('mac') || has('linux')
    !git -C ~/dotfiles submodule foreach git pull origin master
  endif
endfunction
command -nargs=0 PluginUpdate call PluginUpdate()

"言語別にインデントを分ける"
augroup MyFileTypeEvent
  autocmd!
  autocmd FileType py setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType vim packadd ale
  autocmd FileType eruby setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd BufReadPre *.org packadd vim-orgmode
augroup END

" autofmtの設定
set formatexpr=autofmt#japanese#formatexpr()

" javaのsyntaxの設定
let g:java_highlight_all=1
let g:java_highlight_functions="style"
let g:java_allow_cpp_keywords=1

" termdebegを使えるようにする
function! OnTermdebug() abort
  if executable('gdb')
    packadd termdebug
    :Termdebug
  else
    echo 'gdb is not found'
  endif
endfunction
command -nargs=0 OnTermdebug call OnTermdebug()

" ---setting vim-lsp---------

if executable('pyls')
  " pip install python-language-server
  au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('solargraph')
  " gem install solargraph
  au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],})
endif

if executable('gopls')
  augroup LspGo
    au!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'go-lang',
          \ 'cmd': {server_info->['gopls']},
          \ 'whitelist': ['go'],
          \ })
    autocmd FileType go setlocal omnifunc=lsp#complete
    autocmd FileType go nmap <buffer> gd <plug>(lsp-definition)
    autocmd FileType go nmap <buffer> ,n <plug>(lsp-next-error)
    autocmd FileType go nmap <buffer> ,p <plug>(lsp-previous-error)
  augroup END
endif

if executable('clangd')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#necovim#get_source_options({
      \ 'name': 'necovim',
      \ 'whitelist': ['vim'],
      \ 'completor': function('asyncomplete#sources#necovim#completor'),
      \ }))
let g:lsp_diagnostics_echo_cursor = 1
setlocal omnifunc=lsp#complete

" ----setting gina.vim
packadd gina.vim

call gina#custom#command#option('status', '--opener', 'vsplit')
call gina#custom#command#option('diff', '--opener', 'vsplit')
