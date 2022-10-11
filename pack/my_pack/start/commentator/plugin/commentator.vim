vim9script

def Commentator(): void
    var line = getline(".")
    if strlen(line) <= 0 
        return
    endif

    # escape any asterisks in the comment string to play nice with regex
    var cstr: string = substitute(&commentstring, '\*', '\\\*', 'g')
    # split the string in case the comment string has two parts
    var cstrs: list<string> = split(cstr, '%s')

    # if we find the comment string in the line, uncomment the line
    # we are assuming that if the first part of a comment is here, then the whole line is a comment
    if stridx(line, cstrs[0]) != -1
        # replace the first comment str with empty string
        line = substitute(line, cstrs[0], '', '')
        # replace the second comment str with empty string, if there is one
        if len(cstrs) > 1
            line = substitute(line, cstrs[1], '', '')
        endif
    else
        # add comment string to line
        line = substitute(&commentstring, '%s', line, '')
    endif
    # set the line to the new string
    call setline(".", line)

enddef

defcompile

nnoremap <silent> gc :call <SID>Commentator()<cr>
xnoremap <silent> gc :call <SID>Commentator()<cr>
