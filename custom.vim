
"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/vimfiles/bundle')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-git'
Plug 'scrooloose/nerdtree'
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
set guifont=Courier\ Prime\ Code:h10 "set the font
set lines=50 "opening height
set columns=120 "opening width
set nobackup "turn off file backups
set nowritebackup "turn off file backup writing
set noswapfile "turn off swap file creation
set noundofile "turn off undo file creation
set tabstop=4 "tab length in spaces
set shiftwidth=4 "idk what this does
set expandtab "idk what this does either
set belloff=all "turn off the bell
set laststatus=0 "set statusline
set encoding=utf-8 "set encoding to utf-8


""""""""""""""""
" Key Bindings "
""""""""""""""""
map <F12> :e ~/vimfiles/custom.vim<CR>
map <F11> :tabedit<CR>
map <F10> :e ~/vimfiles/todo.txt<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :w<CR>


""""""""""
" Colors "
""""""""""
let g:gruvbox_italic=0 
colors gruvbox 
