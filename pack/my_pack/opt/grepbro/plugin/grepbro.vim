vim9script

def GrepBro(str: string): void
    :execute ":vimgrep \"" .. str .. "\" ./**/* | copen"
enddef

# returns the selected text from visual mode
def GrepBroVisualSelection(): string
    var [lnum1, col1] = getpos("'<")[1 : 2]
    var [lnum2, col2] = getpos("'>")[1 : 2]
    var lines = getline(lnum1, lnum2)
    lines[-1] = lines[-1][ : col2 - (&selection == 'inclusive' ? 1 : 2)]
    lines[0] = lines[0][col1 - 1 : ]
    return join(lines, "\n")
enddef

defcompile

nnoremap <leader>g :<C-U>call <SID>GrepBro(expand('<cword>'))<cr>
xnoremap <leader>g :<C-U>call <SID>GrepBro(<SID>GrepBroVisualSelection())<cr>
