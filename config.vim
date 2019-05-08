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

set ignorecase smartcase
set nohlsearch

set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

filetype plugin indent on

set belloff=all
set laststatus=0
set autoread
set tags+=./tags;

set rulerformat=%50(%m%r\ %#MatchParen#%{gitbranch#name()}\ %#Normal#%l,%c%)

set cursorline
colors simple 
set ff=unix

let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'

let g:todo_file_extensions = ['vim']

inoremap {<cr> {<cr>}<esc>O
nnoremap <c-n> :w<cr>:bn<cr>
nnoremap <c-k> :call ToggleComment()<cr>
nnoremap <leader><leader> :call OpenVimrc()<cr>
nnoremap <leader>t :NewTODO<cr>
nnoremap <leader>b :NewBUG<cr>
nnoremap <leader>d :TODO<cr>
nnoremap <leader>c :execute "!ctags -R * " . getcwd()<cr>
nnoremap <leader>n :e ~/.notes<cr>



" Open the config.vim file the 
function! OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction


" Toggle comments for current line
function! ToggleComment()
    let save_pos = getpos(".")
    normal ^
    "vim file
    if (&ft=='vim')
        if getline('.')[col('.')-1] == "\""
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i"
            call setpos(".", save_pos)
            normal l
        endif
    "python
    elseif (&ft=='python')
        if getline('.')[col('.')-1] == "#"
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i#
            call setpos(".", save_pos)
            normal l
        endif
    "html & xml
    elseif (&ft=='xml' || &ft=='html' || &ft=='htm')
        if getline('.')[col('.')-1] == "<" && getline('.')[col('.')] == "!"
            normal 4x$2h3x
            call setpos(".", save_pos)
            normal 4h
        else
            normal i<!--
            normal $a-->
            call setpos(".", save_pos)
            normal 4l
        endif
    "c style
    else
        if getline('.')[col('.')-1] == "/"
            normal xx
            call setpos(".", save_pos)
            normal hh
        else
            normal i//
            call setpos(".", save_pos)
            normal ll
        endif
    endif
endfunction
