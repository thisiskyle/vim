vim9script

# This function is a shortcut for :%s/<word>/<replacement>/g/
def Replace(str: string): void
    var save_pos = getpos(".")
    var replace_str = input("Replace [" .. str .. "] with: ")
    if replace_str == ""
      return
    endif
    :execute ":%s/" .. str .. "/" .. replace_str .. "/g"
    call setpos(".", save_pos)
    enddef

# returns the selected text from visual mode
def GetVisualSelection(): string
    var [lnum1, col1] = getpos("'<")[1 : 2]
    var [lnum2, col2] = getpos("'>")[1 : 2]
    var lines = getline(lnum1, lnum2)
    lines[-1] = lines[-1][ : col2 - (&selection == 'inclusive' ? 1 : 2)]
    lines[0] = lines[0][col1 - 1 : ]
    return join(lines, "\n")
    enddef


defcompile

nnoremap <silent> <Plug>Replace    :<C-U>call <SID>Replace(expand('<cword>'))<cr>
xnoremap <silent> <Plug>ReplaceVis :<C-U>call <SID>Replace(<SID>GetVisualSelection())<cr>

if !hasmapto('<Plug>Replace')
    nmap gr <Plug>Replace
    xmap gr <Plug>ReplaceVis
endif
