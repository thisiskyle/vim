
" check what OS we are on
if !exists("g:session_path")

    " if we are on unix system
    if has("unix")
        let g:session_path = '~/.vim/sessions/'

        " check if the directory exists, if not make it
        if !isdirectory(g:session_path)
            call mkdir(g:session_path, "p", 0777)
        endif

    " if we are on windows system
    else
        let g:session_path = '~/vimfiles/sessions/'
        " on windows, making the directory from the script is 
        " apparently more difficult. We will just have to make it manually
    endif
endif



" this function makes a session file with the given name
function! session_man#MakeSession(name)
    execute ":mks! " . g:session_path . a:name . ".session"
endfunction



" this function loads the target session file
function! session_man#LoadSession(name)
    execute ":so " . g:session_path . a:name . ".session"
endfunction
