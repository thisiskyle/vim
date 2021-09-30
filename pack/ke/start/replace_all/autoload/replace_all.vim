




" This function is a shortcut for :%s/<word>/<replacement>/g/
function! replace_all#ReplaceAll()
    let str = expand("<cword>")
    let save_pos = getpos(".")
    :execute "%s/" . str . "/" . input("Replace [" . str . "] with: ") . "/g"
    call setpos(".", save_pos)
endfunction


" replaces all the instances of the selected area
function! replace_all#ReplaceAllVis()
    call replace_all#ReplaceAll(s:GetVisualSelection())
endfunction



" returns the selected text from visual mode
function! s:GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction
