vim9script

def Commentator(): void
    var line = getline(".")
    if strlen(line) <= 0 
        return
    endif

    var cstrs: list<string> = split(&commentstring, '%s')

    # if we find the comment string in the line, uncomment the line
    # we are assuming that if the first part of a comment is here, then the whole line is a comment
    if stridx(line, cstrs[0]) != -1
        # clean up the string for regex
        cstrs[0] = substitute(cstrs[0], '\/', '\\\/', 'g')
        cstrs[0] = substitute(cstrs[0], '\*', '\\\*', 'g')
        line = substitute(line, cstrs[0], '', '')

        # replace the second comment str with empty string, if there is one
        if len(cstrs) > 1
            # clean up the string for regex
            cstrs[1] = substitute(cstrs[1], '\/', '\\\/', 'g')
            cstrs[1] = substitute(cstrs[1], '\*', '\\\*', 'g')
            line = substitute(line, cstrs[1], '', '')
        endif
        # set the line to the new string
        call setline(".", line)
    else
        if len(cstrs) > 1
            call setline(".", cstrs[0] .. line .. cstrs[1])
        else
            call setline(".", cstrs[0] .. line)
        endif
    endif

enddef

defcompile

nnoremap <silent> gc :call <SID>Commentator()<cr>
xnoremap <silent> gc :call <SID>Commentator()<cr>
