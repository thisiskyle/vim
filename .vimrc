vim9script

#
#  Plugin
#
g:vimpack_list = [ "https://github.com/sheerun/vim-polyglot" ]

packadd vim-polyglot
packadd elyk
packadd replaced
packadd vimpack

#
#  Settings
#
if has("gui_running")
    set guioptions='' 
    set columns=125
    set lines=60
    set guifont=agave:h11
endif

var vimhome = "$HOME/.vim"
if has("win32")
    vimhome = "$HOME/vimfiles"
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
set nobackup
set undofile
set nocursorline
set t_Co=256
set ruler
set rulerformat=%60(%=%m\ %t\ \(%c,%l\)%) 
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:-
set statusline=%=%m\ %t\ \ %l,%c\ 
exec "set viewdir=" .. vimhome .. "/view/"
exec "set undodir=" .. vimhome .. "/undo/"
set background=dark 
color elyk

#
#  Bindings
#
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

#
#  Misc Stuff
#
if !isdirectory(&viewdir)
    call mkdir(&viewdir, "", 0700)
endif

# make the undo directory if needed
if !isdirectory(&undodir)
    call mkdir(&undodir, "", 0700)
endif
