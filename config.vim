source $VIMRUNTIME/defaults.vim

if has("win32") | call plug#begin('~/vimfiles/bundle')
elseif has("unix") | call plug#begin('~/.vim/bundle')
endif
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'sheerun/vim-polyglot'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/sokoban.vim'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'OmniSharp/omnisharp-vim'
call plug#end()

if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=55 
    set columns=105
    if has("win32") | set guifont=Courier\ Prime\ Code:h10
    elseif has("unix") | set guifont=Courier\ Prime\ Code\ 10
    endif
endif

nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
map <C-m> :tabedit<CR>
map <leader>1 :set number!<CR>
map <leader>2 :set ruler!<CR>
map <leader>v :OpenVimrc<CR>

set bg=dark
set incsearch
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set autoindent
set shiftwidth=4
set expandtab
set belloff=all
set laststatus=0
set noshowcmd
set autochdir
set encoding=utf-8
set fileencoding=utf-8
set autoread
set rulerformat=%30(%m\ %{fugitive#head()}\ \ %l%)

let wiki1 = {'path':'~\vimfiles\wiki\default', 'path_html':'~\vimfiles\wiki\default\html'}
let wiki2 = {'path':'~\wiki\work', 'path_html':'~\wiki\work\html'}
let g:vimwiki_list = [wiki1, wiki2]
let g:gruvbox_italic = '0'
let g:gruvbox_bold = '0'
let g:gruvbox_contrast_dark = 'soft'

colors gruvbox 

command FormatJSON :call FormatJSON()
command OpenVimrc :call OpenVimrc()

function! FormatJSON()
    :%!python -m json.tool
endfunction

function! OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction
