"---------------------[ Session Manager ]---------------------

" check what OS we are on


if !exists("g:session_path")
    if has("unix")
        let g:session_path = '~/.vim/'
    else
        let g:session_path = '~/vimfiles/'
    endif
endif



function! session_man#MakeSession(name)
    execute ":mks! " . g:session_path . a:name . ".session"
endfunction

function! session_man#LoadSession(name)
    execute ":so " . g:session_path . a:name . ".session"
endfunction
