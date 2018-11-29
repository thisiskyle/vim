
source $VIMRUNTIME/defaults.vim


if has("win32")
    call plug#begin('~/vimfiles/bundle')
elseif has("unix")
    call plug#begin('~/.vim/bundle')
endif
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-git'
"Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/sokoban.vim'
call plug#end()


if has("win32")
    map <F11> :e ~/todo.txt<CR>
    map <F12> :e ~/vimfiles/ericson.vim<CR>
elseif has("unix")
    map <F11> :e ~/todo.txt<CR>
    map <F12> :e ~/.vim/ericson.vim<CR>
endif
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
map <F2> :set ruler!<CR>
map <F3> :set number!<CR>
map <F9> :tabedit<CR>
map <F10> :Vex<CR>


if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=50
    set columns=110
    set guifont=Courier\ Prime\ Code\ 10
    set hlsearch
endif
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
set noruler
set rulerformat=%20(%{fugitive#head()}%)
set autochdir
set encoding=utf-8
set fileencoding=utf-8
set tags=tags;/
set bg=dark
set autoindent
filetype plugin indent on 
filetype plugin on
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
colors gruvbox 

command FormatJSON :call FormatJSON()

function! FormatJSON()
:%!python -m json.tool
endfunction
