
"adds all files and commits
function! myfunctions#GitCommitAll()
    :!git add . && git commit
endfunction

function! myfunctions#GitPush()
    :!git push
endfunction


" Open the config.vim file the 
function! myfunctions#OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction


" Toggle comments for current line
function! myfunctions#ToggleComment()
    let save_pos = getpos(".")
    normal ^
    "vim file
    if (&ft=='vim')
        if getline('.')[col('.')-1] == "\""
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i"
            call setpos(".", save_pos)
            normal l
        endif
    "python
    elseif (&ft=='python')
        if getline('.')[col('.')-1] == "#"
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i#
            call setpos(".", save_pos)
            normal l
        endif
    "html & xml
    elseif (&ft=='xml' || &ft=='html' || &ft=='htm')
        if getline('.')[col('.')-1] == "<" && getline('.')[col('.')] == "!"
            normal 4x$2h3x
            call setpos(".", save_pos)
            normal 4h
        else
            normal i<!--
            normal $a-->
            call setpos(".", save_pos)
            normal 4l
        endif
    "c style
    else
        if getline('.')[col('.')-1] == "/"
            normal xx
            call setpos(".", save_pos)
            normal hh
        else
            normal i//
            call setpos(".", save_pos)
            normal ll
        endif
    endif
endfunction
