"
" Settings
"
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
set t_Co=256
set background=dark 
color elyk_bright

if has('win32')
    set viewdir=$HOME/vimfiles/views
else
    set viewdir=$HOME/.vim/views
endif

"
" Commands
"
if has('win32')
    command Config :e $HOME/vimfiles/pack/ke-vim-pack/start/config/plugin/config.vim
else
    command Config :e $HOME/.vim/pack/ke-vim-pack/start/config/plugin/config.vim
endif

autocmd BufWinEnter * silent loadview

"
" Key Mappings
"
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"
" plugin settings: Toggle Comment
"
nnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>
vnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>

"
" plugin settings: Replace All
"
nnoremap <silent> <leader>r :call replace_all#ReplaceAll()<cr>
vnoremap <silent> <leader>r :<C-U> call replace_all#ReplaceAllVis()<cr>

"
" plugin settings: Packer
"
let g:packer_list = [ 
    \ "https://github.com/sheerun/vim-polyglot",
    \]

"
" Package Loading
"
packadd rulers_rule
packadd toggle_comments
packadd elyk_colors
packadd autopack
packadd replace_all
packadd vim-polyglot
