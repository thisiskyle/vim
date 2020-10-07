if has("unix")
    let g:vimhome = '~/.vim/'
else
    let g:vimhome = '~/vimfiles/'
endif
"===============================================================================================================
" plugins
"===============================================================================================================
call plug#begin(g:vimhome . 'plug')
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/itchyny/vim-gitbranch'
call plug#end()
"===============================================================================================================
" settings
"===============================================================================================================
if has("gui_running")
    set guioptions ='' 
    set lines=40 
    set columns=120
endif
exec "set viewdir=" . g:vimhome . "views//"
filetype plugin indent on
set incsearch 
set hlsearch 
set autoindent 
set expandtab 
set tabstop=4 
set shiftwidth=4
set tags=tags;/
set noswapfile 
set nobackup 
set belloff=all 
set laststatus=0 
set background=dark 
set scrolloff=0 
set t_Co=256
set rulerformat=%60(%=%m\ %#RulerFile#%t\ %#RulerBranch#%{gitbranch#name()}%#Normal#\ %l:%c%)
" makes the status line look like my ruler
set statusline=%=%#StatusNormal#%m\ %t\ %#StatusBranch#%{gitbranch#name()}%#StatusNormal#\ %l:%c\  
" since window splits force a status line, this makes splits look nice 
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:- 

let g:comment_delimiters = { 'default':"//" }
let g:comment_delimiters.vim = "\""
let g:comment_delimiters.python = "#"
let g:comment_delimiters.sh = "#"
let g:comment_delimiters.gdscript3 = "#"

color nightswatch
"===============================================================================================================
" key bindings
"===============================================================================================================
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> :call ToggleComment()<cr>
nnoremap <leader>r :silent call ReplaceAll(expand("<cword>"))<cr>
vnoremap <leader>r :<C-U>silent call ReplaceAll(GetVisualSelection())<cr>
vnoremap <c-n> :call ToggleComment()<cr>
"===============================================================================================================
" commands 
"===============================================================================================================
command Config :execute ":e" . g:vimhome . "config.vim"
command CD :cd %:p:h
command Todo noautocmd vimgrep /TODO\c/j **/* | copen
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
    if has_key(g:comment_delimiters, &ft) 
        let cstr = g:comment_delimiters[&ft]
    else 
        let cstr = g:comment_delimiters["default"] 
    endif
    " jump to first character in line
    normal ^
    " check to see if the line has a comment
    let a = col(".") - 1
    if getline(".")[a : a + (strlen(cstr) - 1)] == cstr
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
function! ReplaceAll(str)
    let save_pos = getpos(".")
    :execute "%s/" . a:str . "/" . input("Replace [" . a:str . "] with: ") . "/g"
    call setpos(".", save_pos)
endfunction

" returns the selected text from visual mode
function! GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
