
"----------------[ General Settings ]---------------------

if has("gui_running")
    set guioptions ='' 
    set columns=120
    set lines=40
endif

filetype plugin indent on

set incsearch 
set hlsearch 
set autoindent 
set expandtab 
set tabstop=4 
set shiftwidth=4
set belloff=all 
set laststatus=0 
set scrolloff=0 
set modelines=0
set tags=./tags,tags;$HOME
set noswapfile 
set nobackup
set ruler

"----------------[ Color Settings ]---------------------

set background=dark 
set t_Co=256

color nightswatch

"----------------[ General Key Bindings ]---------------------

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"----------------[ Toggle Comments Plugin ]---------------------

nnoremap <c-n> :call toggle_comments#ToggleComment()<cr>
vnoremap <c-n> :call toggle_comments#ToggleComment()<cr>

"----------------[ Replace All Plugin ]---------------------

nnoremap <leader>r :silent call replace_all#ReplaceAll()<cr>
vnoremap <leader>r :<C-U>silent call replace_all#ReplaceAllVis()<cr>

"----------------[ Session Manager Plugin ]---------------------

command -nargs=1 Mks call session_man#MakeSession(<f-args>)
command -nargs=1 Lds call session_man#LoadSession(<f-args>)





