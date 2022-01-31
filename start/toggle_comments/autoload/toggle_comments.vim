
let s:delimiterMap = {
    \ "default":   "//",
    \ "vim":       "\"",
    \ "python":    "#",
    \ "sh":        "#",
    \ "gdscript3": "#",
    \ "ps1":       "#"
    \ }

" dictionary for filetypes and their comment syntax
" if it doesnt exist yet, create it
if exists('g:CustomDelimiters')
    call extend(s:delimiterMap, g:CustomDelimiters)
endif


" adds or removes a comment string at the beginning of current line unless the line is empty
function! toggle_comments#ToggleComment()
    " skip line if empty
    if strlen(getline('.')) <= 0 
        return 
    endif
    " save position
    let save_pos = getpos(".")
    " get the comment string
    if has_key(s:delimiterMap, &ft) 
        let cstr = s:delimiterMap[&ft]
    else 
        let cstr = s:delimiterMap["default"] 
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

