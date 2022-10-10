vim9script

# adds or removes a comment string at the beginning of current line unless the line is empty
def ToggleComment(...args: list<string>): string
    if len(args) == 0
        &operatorfunc = ToggleComment
        return 'g@'
    endif

    :echoerr args[0]

    # skip line if empty
    if strlen(getline('.')) <= 0 
        return ''
    endif
    # save position
    var save_pos = getpos(".")
    var cstr = substitute(&commentstring, '%s', '', '')

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
    return ''

    enddef

# compile the function
defcompile


command! -range -bar -bang ToggleComment call <SID>ToggleComment(<line1>, <line2>, <bang>0)

nnoremap <expr> <Plug>ToggleComment     <SID>ToggleComment()
nnoremap <expr> <Plug>ToggleCommentLine <SID>ToggleComment() .. '_'

if !hasmapto('<Plug>ToggleComment')
    nmap gc  <Plug>ToggleComment
    nmap gcc <Plug>ToggleCommentLine
    xmap gc  <Plug>ToggleComment
    omap gc  <Plug>ToggleComment
endif
