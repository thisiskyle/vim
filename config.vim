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
"Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/todo.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'morhetz/gruvbox'
call plug#end()
"-----------------------------------------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------------------------------------
if has("gui_running") | set guioptions ='' | set lines=60 | set columns=120 | endif
set incsearch hlsearch ignorecase smartcase
set nobackup noswapfile noundofile
set autoindent expandtab
set tabstop=4 shiftwidth=4
set belloff=all
set laststatus=0
set tags=doc/tags;/
set rulerformat=%70(%=%t\ %m%r\ %{gitbranch#name()}\ \ %l:%c%)
color gruvbox
filetype plugin indent on
let g:session_dir = g:vimhome . "doc/sessions/"
let g:comment_types = {'vim':"\"", 'python':"#", 'default':"//"}
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:todo_output_filename = 'doc/todo'
let g:todo_identifier = '@@'
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 0
let g:gruvbox_bold = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
"-----------------------------------------------------------------------------------------------------------
" Key Bindings
"-----------------------------------------------------------------------------------------------------------
inoremap {<cr> {<cr>}<esc>O

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>t :NewTodo<cr>
nnoremap <leader>r :silent call ReplaceAll()<cr>
nnoremap <c-m> :call ToggleComment()<cr>

vnoremap <c-m> :call ToggleComment()<cr>
"-----------------------------------------------------------------------------------------------------------
" Commands 
"-----------------------------------------------------------------------------------------------------------
command Config :execute ":e" . g:vimhome . "config.vim"
command Notes :execute ":e" . g:vimhome . "doc/notes.md"
command Ctgs :execute "!ctags -f doc/tags -R * " . getcwd()
command CD :cd %:p:h
command FS :call ToggleFullscreen()
command -nargs=? SS call SessionSave(<q-args>)
command -nargs=? SL call SessionLoad(<q-args>)
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

let g:window_max = 0
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
    let save_pos = getpos(".")
    let word = expand("<cword>")
    let replacement = input("Replace [" . word . "] with: ")
    :execute "%s/" . word . "/" . replacement . "/g"
    call setpos(".", save_pos)
endfunction

function! SessionSave(fname)
    :execute ":mks!" . g:session_dir . a:fname . ".vim"
endfunction

function! SessionLoad(fname)
    :execute ":so" . g:session_dir . a:fname . ".vim"
endfunction
