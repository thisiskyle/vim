vim9script

#
#  Package Loading
#
packadd replace_all
packadd toggle_comments
packadd elyk
packadd autopack
packadd vim-polyglot

#
#  Settings
#
if has("gui_running")
    set guioptions='' 
    set columns=110
    set lines=40
    set guifont=Iosevka:h11
endif

filetype plugin indent on
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
set noundofile
set nobackup
set cursorline
set t_Co=256
set background=dark 
set ruler
set rulerformat=%60(%=%m\ %t\ \ %l,%c%) 
# splits forces a statusline to show even if its turned off.
# these settings below make the statusline look like the ruler. 
# so when we split, each window matches
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:-
set statusline=%=%m\ %t\ \ %l,%c\ 

#
# Colorscheme
#
color elyk

#
#  Key Mappings
#
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>
vnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>
nnoremap <silent> <leader>r :call replace_all#ReplaceAll()<cr>
vnoremap <silent> <leader>r :<C-U> call replace_all#ReplaceAllVis()<cr>
nnoremap <silent> <leader>h :call SynGroup()<cr>

#
#  Plugin Specific Settings 
#
g:autopack_list = [ "https://github.com/sheerun/vim-polyglot" ]

#
#  Helper Functions
#

# Get the highlight of the word under the cursor
# This is helpful for debugging colorschemes and what not
def g:SynGroup(): void
    var s = synID(line('.'), col('.'), 1)
    echo synIDattr(s, 'name') .. ' -> ' .. synIDattr(synIDtrans(s), 'name')
enddef

defcompile
