vim9script noclear

var delimiterMap = {
    "default":   "//",
    "vim":       "#",
    "python":    "#",
    "sh":        "#",
    "gdscript3": "#",
    "ps1":       "#"
}

# dictionary for filetypes and their comment syntax
# if it doesnt exist yet, create it
if exists('g:CustomDelimiters')
    call extend(delimiterMap, g:CustomDelimiters)
endif


# adds or removes a comment string at the beginning of current line unless the line is empty
export def ToggleComment()
    # skip line if empty
    if strlen(getline('.')) <= 0 
        return 
    endif
    # save position
    var save_pos = getpos(".")
    var cstr = ""
    # get the comment string
    if has_key(delimiterMap, &ft) 
        cstr = delimiterMap[&ft]
    else 
        cstr = delimiterMap["default"] 
    endif
    # jump to first character in line
    normal ^
    # check to see if the line has a comment
    var a = col(".") - 1
    if getline(".")[a : a + (strlen(cstr) - 1)] == cstr
        # remove the comment string
        :execute "normal " .. strlen(cstr) .. "x"
        call setpos(".", save_pos)
        :execute "normal " .. strlen(cstr) .. "h"
    else 
        # add a comment string
        :execute "normal i" .. cstr
        call setpos(".", save_pos)
        :execute "normal " .. strlen(cstr) .. "l"
    endif
enddef

