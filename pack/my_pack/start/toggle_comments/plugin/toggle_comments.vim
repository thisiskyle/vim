vim9script

def ToggleComment(): void
    var line = getline(".")

    if strlen(line) <= 0 
        return
    endif

    var cstr: list<string> = split(&commentstring, '%s')

    if stridx(line, cstr[0]) != -1 
        line = substitute(line, cstr[0], '', '')
        if len(cstr) > 1
            line = substitute(line, cstr[1], '', '')
        endif
        call setline(".", line)
    else 
        call setline(".", substitute(&commentstring, '%s', line, ''))
    endif

enddef
defcompile


nnoremap <silent> gc :call <SID>ToggleComment()<cr>
xnoremap <silent> gc :call <SID>ToggleComment()<cr>
