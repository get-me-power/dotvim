syntax enable
filetype plugin indent on

"文字コードをUTF-8に変更"
set fenc=utf-8
set encoding=utf-8
"バックアップファイルを作らない"
set nobackup
"スワップファイルを作らない"
set noswapfile
set viminfo=

"TABキーを押した際にタブ文字の代わりにスペースを入れる,スペースのサイズは四文字"
set expandtab
set tabstop=4
set shiftwidth=4

"行番号を表示"
set number

"改行時などに、自動でインデントを設定してくれる"
set smartindent

"背景色を変更"
set background=dark

"全角スペースの可視化"
"function! ZenkakuSpace()
"	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
"endfunction

"if has('syntax')
"	augroup ZenkakuSpace
"		autocmd!
"		autocmd ColorScheme * call ZenkakuSpace()
"	autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace','　')
"	augroup END

"	call ZenkakuSpace()

"endif

"自動的に閉じ括弧を入力"
imap [ []<LEFT>
imap ( ()<LEFT>


"トラックパッドを有効にする"
set mouse=a

"行末の1文字先までカーソルを移動可能に"
set virtualedit=onemore

"jjでescの代わりに"
inoremap <silent> jj <ESC>

"shell依存のカラースキームを解消"
:set t_Co=256

"エンターキーで確定する前から、文字が入力されるたびに検索を行う
set incsearch

"検索で大文字と小文字を区別しない"
set ignorecase

"大文字と小文字が同じ文字列に含まれた場合,区別する"
set smartcase

"検索文字列をハイライト"
set hlsearch

"ペースト用の設定"
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

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

"shellのキーバインド設定"
tnoremap <silent> <ESC> <C-\><C-n>

set backspace=indent,eol,start

"lightlineの設定"
set laststatus=2

let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste'],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name'
            \ },
            \ }

"helpを日本語化"
set helplang=ja,en
"set runtimepath+=~/Javasnippet.vim
"set runtimepath+=~/InsertSemiColon.vim
"set runtimepath+=~/vim-zenspace
"set runtimepath+=~/sweep_trail.vim
"set runtimepath+=~/Timer.vim
"set runtimepath+=~/EmacsKeyBind.vim
