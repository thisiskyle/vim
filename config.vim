source $VIMRUNTIME/defaults.vim

if has("win32") | call plug#begin('~/vimfiles/plugged')
elseif has("unix") | call plug#begin('~/.vim/plugged')
endif

Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/todo.vim'
Plug 'itchyny/vim-gitbranch'

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
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set belloff=all
set laststatus=0
set autoread
set tags+=./tags;
set cursorline
set ff=unix
set rulerformat=%50(%m%r\ %#MatchParen#%{gitbranch#name()}\ %#Normal#%l,%c%)
colors simple 
filetype plugin indent on
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:todo_file_extensions = ['vim']

inoremap {<cr> {<cr>}<esc>O
inoremap ii <esc>

nnoremap <c-n> :w<cr>:bn<cr>
nnoremap <c-b> :w<cr>:bp<cr>
nnoremap <c-k> :call myfunctions#ToggleComment()<cr>

nnoremap <leader><leader> :call myfunctions#OpenVimrc()<cr>
nnoremap <leader>c :execute "!ctags -R * " . getcwd()<cr>
nnoremap <leader>n :e ~/.notes<cr>

nnoremap <leader>gc :call myfunctions#GitCommitAll()<cr>
nnoremap <leader>gp :call myfunctions#GitPush()<cr>

nnoremap <leader>t :NewTODO<cr>
nnoremap <leader>b :NewBUG<cr>
nnoremap <leader>d :TODO<cr>
