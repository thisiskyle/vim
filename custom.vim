
" Plugins "
"""""""""""
call plug#begin('~/vimfiles/bundle')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git'
Plug 'w0rp/ale'
"Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim'

"-- Games
Plug 'vim-scripts/sokoban.vim'
call plug#end()


" Settings "
""""""""""""
if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=50
    set columns=110
endif
set guifont=Courier\ Prime\ Code:h10
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab
set belloff=all
set laststatus=0
set noshowcmd
set rulerformat=%20(%{fugitive#head()}%)
set autochdir
set encoding=utf-8
set tags=tags;/
filetype plugin indent on 
filetype plugin on
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Key Bindings "
""""""""""""""""
nnoremap <C-h> :tabp<CR>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
nnoremap <C-l> :tabn<CR>
map <F2> :set ruler!<CR>
map <F3> :ALEToggle<CR>
map <F9> :tabedit<CR>
map <F11> :e ~/vimfiles/todo.txt<CR>
map <F10> :Vex<CR>
map <F12> :e ~/vimfiles/custom.vim<CR>


" Commands "
""""""""""""
command FormatJSON :call FormatJSON()


" Colors "
""""""""""
let g:gruvbox_italic=0 
colors gruvbox 


" Functions "
"""""""""""""
function! FormatJSON()
:%!python -m json.tool
endfunction
