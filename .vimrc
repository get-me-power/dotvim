syntax enable
filetype plugin indent on

"行番号を表示"
set number

"文字コードをUTF-8に変更"
set fenc=utf-8
set encoding=utf-8

"バックアップファイルを作らない"
set nobackup

"バックスペースの問題を解消"
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

"マウスを有効"
set mouse=a

"起動するシェルの設定"
set sh=zsh

"スペース + tでターミナル起動"
let mapleader = "\<Space>"
nnoremap <Leader>t :terminal<CR>

"スペース + v でターミナル起動"
nnoremap <Leader>v :vsplit<CR>

nnoremap <Leader>s :split<CR>

"ウインドウ移動ショートカットをswに当てる"
nnoremap sw <C-w>w

"lightlineの設定"
set laststatus=2

let g:lightline = {
            \ 'active': {
            \   'left': [ [ 'mode', 'paste'],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name'
            \ },
            \ }

"shellのキーバインド設定"
tnoremap <silent> <ESC> <C-\><C-n>
nnoremap <ESC><ESC> :nohlsearch<CR>


"helpを日本語化"
set helplang=ja,en
"set runtimepath+=~/Javasnippet.vim
"set runtimepath+=~/InsertSemiColon.vim
"set runtimepath+=~/vim-zenspace
"set runtimepath+=~/sweep_trail.vim
"set runtimepath+=~/Timer.vim
"set runtimepath+=~/EmacsKeyBind.vim
"set runtimepath+=~/workspace/Weather.vim
