



function! packman#AddPlugin(str)

    if !exists("g:packman_list")
        let g:packman_list = [ ]
    endif

    call add(g:packman_list, a:str)

endfunction


function! packman#InstallAll()

    if exists("g:packman_list")
        for i in g:packman_list
            call packman#Install(i)
        endfor
    endif

endfunction


function! packman#Install(str)

    if has("unix")
        execute "silent !git clone --depth=1 https://github.com/" . a:str . " ~/.vim/pack/other/start/" . split(a:str, '/')[1]
    else
        execute "silent !git clone --depth=1 https://github.com/" . a:str . " " . shellescape("%HOMEDRIVE%%HOMEPATH%/vimfiles/pack/other/start/", 1) . split(a:str, '/')[1]
    endif

endfunction
