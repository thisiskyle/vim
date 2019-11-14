if has("win32")
    let g:vimhome = '~/vimfiles/'
    set guifont=Courier\ Prime\ Code:h10,Courier\ New:h10,Consolas:h10
elseif has("unix")
    let g:vimhome = '~/.vim/'
    set guifont=Courier\ Prime\ Code\ 10,Courier\ New\ 10,Consolas\ 10
endif
"-----------------------------------------------------------------------------------------------------------
" Plugin
"-----------------------------------------------------------------------------------------------------------
call plug#begin(g:vimhome . 'plugged')
"utility
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/todo.vim'
Plug 'itchyny/vim-gitbranch'
"colorschemes
Plug 'sainnhe/gruvbox-material'
Plug 'hzchirs/vim-material'
"games
Plug 'katono/rogue.vim'
call plug#end()
"-----------------------------------------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------------------------------------
if has("gui_running")
    set guioptions =''
    set lines=60
    set columns=120
endif
set incsearch
set ignorecase
set updatetime=300
set nobackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set autoindent
set belloff=all
set laststatus=0
set enc=utf8
set tags=doc/tags;/
set rulerformat=%60(%=%m%r\ %f\ %#GitBranch#%{gitbranch#name()}%#Normal#\ %l:%c%)
filetype plugin indent on
"-----------------------------------------------------------------------------------------------------------
" Colors
"-----------------------------------------------------------------------------------------------------------
set background=dark
color vim-material
hi GitBranch guifg=#FF5370
hi Comment gui=NONE
hi Cursor guifg=#263238
hi Todo guibg=NONE
"-----------------------------------------------------------------------------------------------------------
" Key Bindings
"-----------------------------------------------------------------------------------------------------------
inoremap {<cr> {<cr>}<esc>O

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-n> :w<cr>:bn<cr>
nnoremap <c-b> :w<cr>:bp<cr>
nnoremap <leader>t :NewTodo todo<cr>
nnoremap <leader>n :NewTodo<cr>
nnoremap <c-m> :call ToggleComment()<cr>
vnoremap <c-m> :call ToggleComment()<cr>
"-----------------------------------------------------------------------------------------------------------
" Commands
"-----------------------------------------------------------------------------------------------------------
command Config :execute ":e" . g:vimhome . "config.vim"
command Notes  :e ~\\.notes.md
command Ctags  :execute "!ctags -f doc/tags -R * " . getcwd()
command CD     :cd %:p:h
"-----------------------------------------------------------------------------------------------------------
" Options
"-----------------------------------------------------------------------------------------------------------
" toggle comments
let g:comment_types = {'vim':"\"", 'python':"#", 'default':"//"}
" ctrlp
let g:ctrlp_by_filename = 1
let g:ctrl_working_path_mode = 'rc'
" todo
let g:todo_output_filename = 'doc/todo'
"-----------------------------------------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------------------------------------
function! ToggleComment()
    let save_pos = getpos(".")
    if has_key(g:comment_types, &ft)
        let cstr = g:comment_types[&ft]
    else
        let cstr = g:comment_types["default"]
    endif
    normal ^
    " check to see if the line has a comment
    let i = 0
    let check = 0
    while i < strlen(cstr)
        if getline(".")[(col(".") - 1) + i] == cstr[i]
            let check = 1
        else 
            let check = 0
        endif
        let i = i + 1
    endwhile
    if check == 1
        " remove the comment string
        let i = 0
        while i < len(cstr)
            normal x
            let i += 1
        endwhile
        call setpos(".", save_pos)
        let i = 0
        while i < len(cstr)
            normal h
            let i += 1
        endwhile
    else
         "add a comment string
        :execute "normal i" . cstr
        call setpos(".", save_pos)
        let i = 0
        while i < strlen(cstr)
            normal l
            let i += 1
        endwhile
    endif
endfunction
