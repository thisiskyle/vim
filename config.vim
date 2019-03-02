source $VIMRUNTIME/defaults.vim

" plugins ----------------------------------------------------------------
if has("win32") | call plug#begin('~/vimfiles/bundle')
elseif has("unix") | call plug#begin('~/.vim/bundle')
endif
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
"Plug 'sheerun/vim-polyglot'
call plug#end()

" settings ---------------------------------------------------------------
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
set bg=dark
set lazyredraw
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
set autoread
set ignorecase
set smartcase
set guicursor+=n-v-c:blinkon0
if exists('+fixeol') | set nofixeol | endif
set rulerformat=%40(%m\ %{fugitive#head()}\ \ %l,%c%)

" mappings  ---------------------------------------------------------------
inoremap {<CR> {<CR>}<ESC>O
inoremap /*<CR> /*<CR>*/<ESC>O
inoremap <C-s> <ESC>:wa<CR>
inoremap jj <ESC>
nnoremap <C-h> :tabp<CR>
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-s> :wa<CR>
nnoremap <leader>0 :OpenVimrc<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>2 :set ruler!<CR>
nnoremap <leader>9 :tabedit<CR>

" vim wiki  ---------------------------------------------------------------
let wiki1 = {'path':'~\vimfiles\wiki\default', 'path_html':'~\vimfiles\wiki\default\html'}
let wiki2 = {'path':'~\wiki\work', 'path_html':'~\wiki\work\html'}
let g:vimwiki_list = [wiki1, wiki2]

" colors  -----------------------------------------------------------------
let g:gruvbox_italic = '0'
let g:gruvbox_bold = '0'
let g:gruvbox_contrast_dark = 'soft'
colors simple 

" custom commands ---------------------------------------------------------
command FormatJSON :call FormatJSON()
function! FormatJSON()
    :%!python -m json.tool
endfunction

command OpenVimrc :call OpenVimrc()
function! OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction

command ToggleSyntaxHL :call ToggleSyntaxHL()
function! ToggleSyntaxHL()
    if exists("g:syntax_on") | syntax off
    else | syntax enable
    endif 
endfunction
