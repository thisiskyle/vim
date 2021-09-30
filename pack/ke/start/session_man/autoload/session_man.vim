"---------------------[ Session Manager ]---------------------

" check what OS we are on
if has("unix")
    let s:vimhome = '~/.vim/'
else
    let s:vimhome = '~/vimfiles/'
endif

function! session_man#MakeSession(name)
    execute ":mks! " . s:vimhome . "tmp/" . a:name . ".session"
endfunction

function! session_man#LoadSession(name)
    execute ":so " . s:vimhome . "tmp/" . a:name . ".session"
    :color nightswatch
endfunction
