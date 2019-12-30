function! functions#ToggleComment()
    let save_pos = getpos(".")
    if has_key(g:comment_types, &ft)
        let cstr = g:comment_types[&ft]
    else
        let cstr = g:comment_types["default"]
    endif
    normal ^
    " check to see if the line has a comment
    let i = 0
    let check = 0
    while i < strlen(cstr)
        if getline(".")[(col(".") - 1) + i] == cstr[i]
            let check = 1
        else 
            let check = 0
        endif
        let i = i + 1
    endwhile
    if check == 1
        " remove the comment string
        let i = 0
        while i < len(cstr)
            normal x
            let i += 1
        endwhile
        call setpos(".", save_pos)
        let i = 0
        while i < len(cstr)
            normal h
            let i += 1
        endwhile
    else
         "add a comment string
        :execute "normal i" . cstr
        call setpos(".", save_pos)
        let i = 0
        while i < strlen(cstr)
            normal l
            let i += 1
        endwhile
    endif
endfunction

function! functions#ToggleFullscreen()
    if g:window_max == 0
        let g:window_max = 1
        :sim ~x
    else
        let g:window_max = 0
        :sim ~r
    endif
endfunction

function! functions#ReplaceAll()
    let save_pos = getpos(".")
    let word = expand("<cword>")
    let replacement = input("Replace [" . word . "] with: ")
    :execute "%s/" . word . "/" . replacement . "/g"
    call setpos(".", save_pos)
endfunction

function! functions#SessionSave(fname)
    :execute ":mks!" . g:session_dir . a:fname . ".vim"
endfunction

function! functions#SessionLoad(fname)
    :execute ":so" . g:session_dir . a:fname . ".vim"
endfunction
