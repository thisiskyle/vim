source $VIMRUNTIME/defaults.vim

if has("win32") | call plug#begin('~/vimfiles/plugged')
elseif has("unix") | call plug#begin('~/.vim/plugged')
endif

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/do.vim'

call plug#end()


if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=60
    set columns=120
    set lazyredraw
    if has("win32") | set guifont=Consolas:h10
    elseif has("unix") | set guifont=Consolas\ 10
    endif
endif

set nobackup
set nowritebackup
set noswapfile
set noundofile

set ignorecase smartcase
set nohlsearch

set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

filetype plugin indent on

set belloff=all
set laststatus=0
set autochdir
set autoread
set tags+=./tags;

set rulerformat=%40(%m\ %{fugitive#head()}\ \ %l,%c%)
set cursorline
colors simple 

let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'

let g:do_file_extensions = ['vim']

nnoremap <c-n> :w<cr>:bn<cr>
nnoremap <c-k> :call functions#ToggleComment()<cr>
nnoremap <leader><leader> :call functions#OpenVimrc()<cr>
nnoremap <leader>t :DOtodo<cr>
nnoremap <leader>d :DO<cr>
nnoremap <leader>c :execute "!ctags -R * " . getcwd()<cr>
nnoremap <leader>n:e ~/.notes.txt<cr>
