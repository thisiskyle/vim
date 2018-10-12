
"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/vimfiles/bundle')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-git'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()


""""""""""""
" Settings "
""""""""""""
if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
endif
set guifont=Courier\ Prime\ Code:h10
set lines=50
set columns=110
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab
set belloff=all
set laststatus=0
set encoding=utf-8
set noshowcmd
set noruler
set rulerformat=%20(%{fugitive#head()}\ %l\/%{line('$')}%)
filetype plugin indent on 
let g:netrw_dirhistmax = 0
set autochdir


""""""""""""""""
" Key Bindings "
""""""""""""""""
map <F2> :set ruler!<CR>
map <F3> :tabedit<CR>
map <F5> :bp<CR>
map <F6> :bn<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
map <F11> :e ~/vimfiles/todo.txt<CR>
map <F12> :e ~/vimfiles/custom.vim<CR>
map <C-s> :w<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""
" Colors "
""""""""""
let g:gruvbox_italic=0 
colors gruvbox 
