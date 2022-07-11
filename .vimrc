vim9script

#
# Package Loading
#
packadd vim-polyglot
packadd replace_all
packadd toggle_comments
packadd elyk_colors
packadd autopack
#
# Settings
#
if has("gui_running")
    set guioptions='' 
    set columns=110
    set lines=40
    set guifont=Iosevka_Extended:h10

endif

filetype plugin indent on
set belloff=all 
set laststatus=0 
set scrolloff=0 
set modelines=0
set ruler
set incsearch 
set hlsearch 
set autoindent 
set expandtab 
set tabstop=4 
set shiftwidth=4
set tags=./tags,tags;$HOME
set noswapfile 
set noundofile
set nobackup
set t_Co=256
set background=dark 
color elyk_bright
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:-
# format the ruler to look nice and clean and act as a statusline
set rulerformat=%60(%=%m\ %t\ \ %c,%l%)
# splits force a statusline to show this makes the status line look like the ruler 
# so when we split, each window matches
set statusline=%=%m\ %t\ \ %c,%l\  

if has('win32')
    set viewdir=$HOME/vimfiles/views
else
    set viewdir=$HOME/.vim/views
endif
#
# Commands
#
autocmd BufWinEnter * silent! loadview
#
# Key Mappings
#
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
#
# plugin specific: Toggle Comment
#
nnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>
vnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>
#
# plugin specific: Replace All
#
nnoremap <silent> <leader>r :call replace_all#ReplaceAll()<cr>
vnoremap <silent> <leader>r :<C-U> call replace_all#ReplaceAllVis()<cr>
#
# plugin specific: AutoPack
#
g:autopack_list = [ "https://github.com/sheerun/vim-polyglot" ]
