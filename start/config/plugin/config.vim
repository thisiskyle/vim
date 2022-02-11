
"----------------[ Settings ]
if has("gui_running")
    set guioptions ='' 
    set columns=110
    set lines=50
    set guifont=Iosevka_Extended:h12,Consolas:h12
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

"----------------[ Commands ]
if has('win32')
    command Config :e $HOME/vimfiles/pack/ke-vim-pack/start/config/plugin/config.vim
else
    command Config :e $HOME/.vim/pack/ke-vim-pack/start/config/plugin/config.vim
endif

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
let g:packer_list = [ 
    \ "https://github.com/sheerun/vim-polyglot",
    \ "https://github.com/skywind3000/vim-quickui",
    \]

