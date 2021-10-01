
" dictionary for filetypes and they comment syntax
" if it doesnt exist yet, create it
if !exists("g:comment_delimiters")
    let g:comment_delimiters = {}
endif


let g:comment_delimiters.default ="//"
let g:comment_delimiters.vim = "\""
let g:comment_delimiters.python = "#"
let g:comment_delimiters.sh = "#"
let g:comment_delimiters.gdscript3 = "#"


" add key value pairs for filetypes and comment syntax

" adds a comment string at the beginning of current line unless the line is empty
function! toggle_comments#ToggleComment()
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



