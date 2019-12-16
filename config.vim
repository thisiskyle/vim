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
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/todo.vim'
Plug 'itchyny/vim-gitbranch'
"colorschemes
Plug 'morhetz/gruvbox'
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
set nobackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab
set smartcase
set autoindent
set belloff=all
set laststatus=0
set tags=doc/tags;/
set background=dark
set rulerformat=%70(%=%f\ %m%r\ %#GitBranch#%{gitbranch#name()}%#Normal#\ \ %l:%c%)
filetype plugin indent on
 "ToggleWindowSize()
let g:window_max = 0
" ToggleComment()
let g:comment_types = {'vim':"\"", 'python':"#", 'default':"//"}
" ctrlp
let g:ctrlp_by_filename = 1
let g:ctrl_working_path_mode = 'rc'
" todo.vim
let g:todo_output_filename = 'doc/todo'
" gruvbox
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 0
let g:gruvbox_bold = 0
" netrw
let g:netrw_banner = 0
" colors
color gruvbox
hi GitBranch guifg=#FF5370
"-----------------------------------------------------------------------------------------------------------
" Key Bindings
"-----------------------------------------------------------------------------------------------------------
inoremap {<cr> {<cr>}<esc>O
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>t :NewTodo<cr>
nnoremap <leader>s :CD<cr>:e **/*
nnoremap <leader>f :call ToggleFullscreen()<cr>
nnoremap <leader>r :silent call ReplaceAll()<cr>
nnoremap <c-n> :call ToggleComment()<cr>
vnoremap <c-n> :call ToggleComment()<cr>
"-----------------------------------------------------------------------------------------------------------
" Commands 
"-----------------------------------------------------------------------------------------------------------
command Config :execute ":e" . g:vimhome . "config.vim"
command Notes  :e ~\\.notes.md
command Ctags  :execute "!ctags -f doc/tags -R * " . getcwd()
command CD     :cd %:p:h

augroup ProjectDrawer
    autocmd!
    autocmd VimEnter * if argc() == 0 | Explore! | endif
augroup END
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

function! ToggleFullscreen()
    if g:window_max == 0
        let g:window_max = 1
        :sim ~x
    else
        let g:window_max = 0
        :sim ~r
    endif
endfunction

function! ReplaceAll()
    let word = expand("<cword>")
    let replacement = input("Replace [" . word . "] with: ")
    :execute "%s/" . word . "/" . replacement . "/g"
endfunction

