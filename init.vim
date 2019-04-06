set completeopt=menuone
set autoindent
set nocompatible
"tabの代わりにスペース"
set expandtab
set tabstop=4
set shiftwidth=4
set hidden
set nowrap
set incsearch
set number
set showmatch
set smarttab
set whichwrap=b,s,<,>,[,]
set laststatus=2
set nobackup
set noswapfile
set background=dark
filetype plugin indent on

inoremap <silent> jj <ESC>
au BufNewFile,BufRead *.pde setf processing
"lightlineの設定"

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

if has('mouse')
  set mouse=a
endif

if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# 'dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim', s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

"プラグインマネージャー"
call dein#begin(s:dein_dir)
"dein.vim"
call dein#add('Shougo/dein.vim')
"neovimからapiを叩く"
"call dein#add('kazukazuinaina/Weather.vim')
call dein#add('mattn/webapi-vim')
"neco-syntax"
call dein#add('Shougo/neco-syntax')
"lightline"
call dein#add('itchyny/lightline.vim')
call dein#add('yuttie/hydrangea-vim')
"NERDTree"
"call dein#add('scrooloose/nerdtree')"
"VimでProcessingを動かす"
"call dein#add('sophacles/vim-processing')
"call dein#add('Siphalor/vim-atomified')
"deoplete"
call dein#add('Shougo/deoplete.nvim')
"deoplete-jedi(pythonの補完)"
call dein#add('zchee/deoplete-jedi', {'lazy': 1, 'on_ft': 'python', 'on_event': 'InsertEnter'})
call dein#add('Shougo/deoplete-clangx', {'lazy': 1, 'on_event': 'InsertEnter'})
call dein#add('Shougo/neoinclude.vim', {'lazy': 1, 'on_event': 'InsertEnter'})
call dein#add('godlygeek/tabular')
call dein#add('Shougo/neco-vim', {'lazy': 1,'on_ft': 'vim', 'on_event': 'InsertEnter'})
"markdown用のプラグイン"
call dein#add('tpope/vim-markdown')
call dein#add('kannokanno/previm')
call dein#add('tyru/open-browser.vim')
"ruby用のプラグイン"
call dein#add('tpope/vim-endwise', {'lazy': 1, 'on_ft': 'ruby', 'on_event': 'InsertEnter'})
"NERDTree用のプラグイン"
"call dein#add('jistr/vim-nerdtree-tabs')"
call dein#add('tpope/vim-fugitive')
"Vueのシンタックスハイライトプラグイン"
call dein#add('posva/vim-vue')
"denite.vim"
call dein#add('Shougo/denite.nvim')
"ファイルエクスプローラー"
call dein#add('Shougo/defx.nvim')
"jsの補完"
call dein#add('ternjs/tern_for_vim', { 'build': 'npm install', 'lazy': 1, 'on_ft': 'javascript', 'on_event': 'InsertEnter' })
call dein#add('carlitux/deoplete-ternjs', { 'depends': ['deoplete.nvim', 'tern_for_vim'], 'lazy': 1, 'on_ft': 'javascript', 'on_event': 'InsertEnter'})
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"htmlの補完"
call dein#add('mattn/emmet-vim')
call dein#add('tpope/vim-surround')
"カラースキームプラグイン"
call dein#add('flazz/vim-colorschemes')
call dein#add('itchyny/vim-gitbranch')
if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-nvim-rpc')
endif
call dein#end()

"インストールされていないプラグインを自動インストール"
if dein#check_install()
    call dein#install()
endif

"deoplete.nvimの設定を記載"
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/7.0.1/lib/libclang.dylib'
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

"mattn/emmetのスニペット補完を設定"
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '  '
    \ }
"カラースキーム設定"
syntax enable
"カラースキームプラグイン指定"
colorscheme gotham256

"NERDTree用の設定
" Neovim起動時にNERDTreeも起動する"
"autocmd VimEnter * execute 'NERDTree'
"let g:nerdtree_tabs_open_on_console_startup=1
"map <Leader>n <plug>NERDTreeTabsToggle<CR>

"shellの設定"
set sh=zsh

"shellのキーバインド設定"
tnoremap <silent> <ESC> <C-\><C-n>

"言語別にインデントを分ける"
augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
  augroup END

"" markdown用の詳細設定 {{{
   autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
   autocmd BufRead,BufNewFile *.md  set filetype=markdown
   " Need: kannokanno/previm
   nnoremap <silent> <C-p> :PrevimOpen<CR> " Ctrl-pでプレビュー
   " 自動で折りたたまないようにする
   let g:vim_markdown_folding_disabled=1
   let g:previm_enable_realtime = 1
 " }}}
let g:previm_enable_realtime = 1

command! -nargs=* T split | terminal <args>

"スペース + tでターミナル起動"
let mapleader = "\<Space>"

nnoremap <Leader>t :T<CR>

nnoremap <leader>f :Denite file/rec<CR>

"スペース + v で垂直分割"
nnoremap <Leader>v :vsplit<CR>

nnoremap <Leader>s :split<CR>

"ウインドウ移動ショートカットをswに当てる"
nnoremap sw <C-w>w

"Defxコマンドをスペース+dに当てる"
nnoremap <Leader>d :Defx<CR>

".Vueファイルのカラースキームのための設定"
autocmd FileType vue syntax sync fromstart

"defx.nvimの設定"
autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
	  nnoremap <silent><buffer><expr> <CR>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> E
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
  endfunction
