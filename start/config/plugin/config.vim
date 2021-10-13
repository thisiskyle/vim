
"----------------[ Settings ]
if has("gui_running")
    set guioptions ='' 
    set columns=110
    set lines=50
    set guifont=Cascadia_Code:h10
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
set background=dark 
set t_Co=256
color grayish

"----------------[ Key Mapping ]
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"----------------[ Toggle Comments Settings ]
nnoremap <c-n> :call toggle_comments#ToggleComment()<cr>
vnoremap <c-n> :call toggle_comments#ToggleComment()<cr>

"----------------[ Replace All Settings ]
nnoremap <leader>r :silent call replace_all#ReplaceAll()<cr>
vnoremap <leader>r :<C-U>silent call replace_all#ReplaceAllVis()<cr>

"----------------[ Packman Settings ]
command PackmanInstall call packman#InstallAll()
let g:packman_list = [ "sheerun/vim-polyglot" ]

