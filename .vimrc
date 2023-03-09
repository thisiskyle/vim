vim9script

g:vimpack_list = [ "https://github.com/sheerun/vim-polyglot" ]

packadd vim-polyglot
packadd elyk
packadd replaced
packadd vimpack

if has("gui_running")
    set guioptions='' 
    set columns=110
    set lines=40
    set guifont=agave:h11
endif

if has("win32")
    set undodir=$HOME/vimfiles/undo/
    set viewdir=$HOME/vimfiles/view/
else
    set undodir=$HOME/.vim/undo/
    set viewdir=$HOME/.vim/view/
endif


if !isdirectory(&undodir)
    call mkdir(&undodir, "", 0700)
endif

if !isdirectory(&viewdir)
    call mkdir(&viewdir, "", 0700)
endif


filetype plugin indent on
syntax on
set belloff=all 
set laststatus=0 
set scrolloff=0 
set modelines=0
set wildmenu
set wildoptions=pum
set incsearch 
set hlsearch 
set nowrapscan
set autoindent 
set expandtab 
set tabstop=4 
set shiftwidth=4
set tags=./tags,tags;
set noswapfile 
set undofile
set nobackup
set cursorline
set t_Co=256
set background=dark 
set ruler
set rulerformat=%60(%=%m\ %t\ \ %l,%c%) 
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:-
set statusline=%=%m\ %t\ \ %l,%c\ 

color elyk

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
