let $VIMHOME = expand('<sfile>:p:h')

" Encoding. {{{
if has('vim_starting') " Changing encoding in Vim at runtime is undefined behavior.
  set encoding=utf-8
  scriptencoding utf-8
  if !has('gui_running')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  else
    set guifont=Hack\ Nerd\ Font
  endif
  set fileencodings=utf-8,sjis,cp932,euc-jp
  set fileformats=unix,mac,dos
  " Disable annoying bells
  set noerrorbells
  set novisualbell t_vb=
  if exists('&belloff')
    set belloff=all
  endif

  let g:tex_flavor = "latex"
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
  let g:vim_markdown_folding_disabled = 1
  let g:python_highlight_all = 1
endif

syntax enable
filetype plugin indent on
set autoindent
set smartindent
set background=dark
silent! colorscheme iceberg

set number
set nobackup
set backspace=indent,eol,start
set virtualedit=onemore
set incsearch
set ignorecase
set noswapfile
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set wildmenu
set wildmode=full
set history=200
set noshowmode

if has('mouse')
  set mouse=a
endif

if executable('ctags')
  set tags=./tags;
endif

"---key mapping---

let mapleader = "\<Space>"

nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <silent><Leader>f :GFiles<CR>
nnoremap <silent> <Leader>r :QuickRun<CR>
nnoremap sw <C-w>w
nnoremap <ESC><ESC> :nohlsearch<CR>

noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>

if has('terminal')
  nnoremap <Leader>t :terminal<CR>
  tnoremap <silent><C-u> <C-\><C-N>
endif

if executable('rg')
  nnoremap <Leader>g :Rg<CR>
endif

inoremap <expr><Tab> pumvisible() ? "\<C-n>" : MyInsCompl()
function! MyInsCompl() abort
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

function! s:Indent()
  let save_cursor = getcurpos()
  execute "normal " . "gg=G"
  call setpos('.', save_cursor)
endfunction
command -nargs=0 Indent call s:Indent()

function! s:PluginList()
  let files = split(globpath(&rtp, "pack/minpac/*/*"), "\n")
  call map(files, 'fnamemodify(v:val, ":t")')
  for plug in files
    echo plug
  endfor
endfunction
command -nargs=0 PluginList call s:PluginList()

function! s:DeleteHiddenBuffers()
  let tpbl = []
  call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
  for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val) == -1')
    silent execute 'bwipeout' buf
  endfor
endfunction
command -nargs=0 DeleteHiddenBuffers call s:DeleteHiddenBuffers()

function! s:Todo()
  tabnew $VIMHOME/todo.md
endfunction
command -nargs=0 Todo call s:Todo()

source $VIMHOME/minpac.vim
runtime! ftplugin/man.vim
