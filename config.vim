if has("win32")
    let g:vimhome = '~/vimfiles/'
    set guifont=Courier_Prime_Code:h10
elseif has("unix")
    let g:vimhome = '~/.vim/'
endif
"===============================================================================================================
" plugins
"===============================================================================================================
call plug#begin(g:vimhome . 'plug')
" utility
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/itchyny/vim-gitbranch'
" colors
Plug 'https://github.com/lifepillar/vim-gruvbox8'
call plug#end()
"===============================================================================================================
" plugin variables
"===============================================================================================================
" my functions
let g:comment_types = { 'default':"//" }
let g:comment_types.vim = "\""
let g:comment_types.python = "#"
let g:comment_types.sh = "#"
" gruvbox8
let g:gruvbox_italics = 0
let g:gruvbox_bold = 0
let g:gruvbox_italicize_strings = 0
" simple
let g:simple_style = "gruvbox"
"===============================================================================================================
" vim settings
"===============================================================================================================
if has("gui_running")
    set guioptions ='' lines=55 columns=120
endif
set nobackup noswapfile noundofile
set incsearch hlsearch ignorecase smartcase wrap autoindent expandtab tabstop=4 shiftwidth=4
set belloff=all laststatus=0 background=dark t_Co=256 
set scrolloff=0
set tags=tags;/
set path+=**/*
set rulerformat=%60(%=%m\ %#Identifier#%t\ %#Search#%{gitbranch#name()}%#Normal#\ %l:%c%)
filetype plugin indent on
color simple
"===============================================================================================================
" key bindings
"===============================================================================================================
inoremap {<c-m> {<cr>}<esc>O
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> :call ToggleComment()<cr>
vnoremap <c-n> :call ToggleComment()<cr>
nnoremap <leader>r :silent call ReplaceAll()<cr>
nnoremap <leader>t :Todo<cr>
"===============================================================================================================
" commands 
"===============================================================================================================
command Config :execute ":e" . g:vimhome . "config.vim"
command Notes :execute ":e ~/todo.txt" 
command Ctags :execute "!ctags -f tags -R * " . getcwd()
command CD :cd %:p:h
command Todo noautocmd vimgrep /\s@\(TODO\)\s/j **/* | cw
"===============================================================================================================
" functions 
"===============================================================================================================
" adds a comment string at the beginning of current line unless the line is empty
function! ToggleComment()
    " skip line if empty
    if strlen(getline('.')) <= 0 
        return 
    endif
    " save position
    let save_pos = getpos(".")
    " get the comment string
    if has_key(g:comment_types, &ft) 
        let cstr = g:comment_types[&ft]
    else 
        let cstr = g:comment_types["default"] 
    endif
    " jump to first character in line
    normal ^
    " check to see if the line has a comment
    if getline(".")[(col(".") - 1):(strlen(cstr) - 1)] == cstr
        " remove the comment string
        :execute "normal " . strlen(cstr) . "x"
        call setpos(".", save_pos)
        :execute "normal " . strlen(cstr) . "h"
    else 
        " add a comment string
        :execute "normal i" . cstr
        call setpos(".", save_pos)
        :execute "normal " . strlen(cstr) . "l"
    endif
endfunction

" shortcut for :%s/<word>/<replacement>/g/
function! ReplaceAll()
    let save_pos = getpos(".")
    let word = expand("<cword>")
    :execute "%s/" . word . "/" . input("Replace [" . word . "] with: ") . "/g"
    call setpos(".", save_pos)
endfunction
