
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


"----------------[ Ruler Formatting ]---------------------

" format the ruler to look nice
set rulerformat=%60(%=%m\ %t\ %l:%c%)

" makes the status line look like my ruler, so when we split each window matches
set statusline=%=%m\ %t\ %l:%c\  

" since window splits force a status line, this makes splits look nice with the status line
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:- 


"----------------[ General Key Bindings ]---------------------

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


"----------------[ Toggle Comments Plugin ]---------------------

nnoremap <c-n> :call toggle_comments#ToggleComment()<cr>
vnoremap <c-n> :call toggle_comments#ToggleComment()<cr>

let g:comment_delimiters = {}
let g:comment_delimiters.default ="//"
let g:comment_delimiters.vim = "\""
let g:comment_delimiters.python = "#"
let g:comment_delimiters.sh = "#"
let g:comment_delimiters.gdscript3 = "#"


"----------------[ Replace All Plugin ]---------------------

nnoremap <leader>r :silent call replace_all#ReplaceAll()<cr>
vnoremap <leader>r :<C-U>silent call replace_all#ReplaceAllVis()<cr>


"----------------[ Session Manager Plugin ]---------------------

command -nargs=1 Mks call session_man#MakeSession(<f-args>)
command -nargs=1 Lds call session_man#LoadSession(<f-args>)





