
source $VIMRUNTIME/defaults.vim

"---------------------------
"          plugins
"---------------------------
if has("gui_running")
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
    Plug 'vimwiki/vimwiki'
    Plug 'vim-scripts/sokoban.vim'
    call plug#end()
endif


"---------------------------
"        keybindings
"---------------------------
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
map <F2> :set ruler!<CR>
map <F3> :set number!<CR>
map <F9> :tabedit<CR>
map <F10> :Vex<CR>
map <F11> :e ~/todo.wiki<CR>
if has("win32")
    map <F12> :e ~/vimfiles/vimrc.vim<CR>
elseif has("unix")
    map <F12> :e ~/.vim/vimrc.vim<CR>
endif


"---------------------------
"         settings
"---------------------------
if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=50
    set columns=110
    set nohlsearch
    let g:gruvbox_contrast_dark = 'soft'
    colors gruvbox 
    if has("win32")
        set guifont=Courier\ Prime\ Code:h10
    elseif has("unix")
        set guifont=Courier\ Prime\ Code\ 10
    endif
endif

set nobackup
set nowritebackup
set noswapfile
set textwidth=80
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
set fileencoding=utf-8
set tags=tags;/
set bg=dark
set autoindent

let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 10
let g:vimwiki_list = [{'path':'~/vimfiles/wiki', 'path_html':'~/vimfiles/wiki/html/'}]

filetype plugin indent on 
filetype plugin on


"---------------------------
"        commands
"---------------------------
command FormatJSON :call FormatJSON()
function! FormatJSON()
:%!python -m json.tool
endfunction
