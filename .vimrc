"文字コードをUTF-8に変更"
set encoding=utf-8
scriptencoding utf-8

syntax enable
filetype plugin indent on

"backgroundを暗い色に設定"
set background=dark

"colorschemeをgruvboxに設定
colorscheme gruvbox

"行番号を表示"
set number

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
" 本当の<Tab>を使うには、CTRL-V<Tab>
set expandtab
set tabstop=4
set shiftwidth=4

"マウスを有効"
if has('mouse')
    set mouse=a
endif

"起動するシェルの設定"
set sh=zsh

"modeを非表示にする
set noshowmode

"スペース + tでターミナル起動"
let mapleader = "\<Space>"
nnoremap <Leader>t :terminal<CR>

"スペース + v でターミナル起動"
nnoremap <Leader>v :Vexplore!<CR>

nnoremap <Leader>s :Hexplore<CR>

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

"helpを日本語化"
set helplang=ja,en

" インデントコマンドを定義
function Indent()
    let save_cursor = getcurpos()
    execute("normal " . "gg=G")
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
    cd ~/dotfiles
    !git submodule foreach git pull origin master
    try
        cd %:h
    catch /^Vim\%((\a\+)\)\=:E499:/
        echo 'buffer is empty'
        cd
    endtry
endfunction
command -nargs=0 PluginUpdate call PluginUpdate()

"言語別にインデントを分ける"
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" autofmtの設定
set formatexpr=autofmt#japanese#formatexpr()

" javaのsyntaxの設定
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

" termdebegを使えるようにする
function! OnTermdebug() abort
    if executable('gdb')
        packadd termdebug
    else
        echo 'gdb is not found'
    endif
endfunction
command -nargs=0 OnTermdebug call OnTermdebug()

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
set runtimepath+=~/myplugin/latex.vim
set runtimepath+=~/myplugin/vimgon-quest-menu
set runtimepath+=~/myplugin/vim-sl
set runtimepath+=~/myplugin/Weather.vim
