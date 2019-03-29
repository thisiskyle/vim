"=======================================================
" source files
"=======================================================
source $VIMRUNTIME/defaults.vim
"=======================================================
" plugins
"=======================================================
if has("win32") | call plug#begin('~/vimfiles/plugged')
elseif has("unix") | call plug#begin('~/.vim/plugged')
endif

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/do.vim'

call plug#end()
"=======================================================
" settings
"=======================================================
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

set incsearch 
set ignorecase
set nohlsearch
set smartcase

set tabstop=4
set autoindent
set shiftwidth=4
set expandtab
set tags+=./tags;

filetype plugin indent on

set belloff=all
set laststatus=0
set noshowcmd
set autochdir
set autoread
set isfname-=:

let wiki1 = {'path':'~\vimfiles\wiki', 'path_html':'~\vimfiles\wiki\html'}
let wiki2 = {'path':'~\mystuff\IT\wiki', 'path_html':'~\mystuff\IT\wiki\html'}
let g:vimwiki_list = [wiki1, wiki2]

let g:ctrlp_extensions = [ 'tag' ]
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25 
let g:netrw_dirhistmax = 0
"=======================================================
" mappings
"=======================================================
inoremap {<cr> {<cr>}<esc>O

nnoremap <c-b> :w<cr>:bp<cr>
nnoremap <c-n> :w<cr>:bn<cr>
nnoremap <c-k> :call functions#ToggleComment()<cr>

nnoremap <m-k> ddkP
nnoremap <m-j> ddp

nnoremap <leader><leader> :call functions#OpenVimrc()<cr>
nnoremap <leader>C :execute "!ctags -R * " . getcwd()<cr>
nnoremap <leader>D :DO<cr>
nnoremap <leader>E :Vex<cr>
nnoremap <leader>N :set number!<cr>
"=======================================================
" style
"=======================================================
set rulerformat=%40(%m\ %{fugitive#head()}\ \ %l,%c%)
set guicursor+=n-v-c:blinkon0
let g:gruvbox_italic = '0'
let g:gruvbox_bold = '0'
let g:gruvbox_contrast_dark = 'soft'
set cursorline
colors simple 

