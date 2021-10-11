



function! plug_man#AddPlugin(str)

    if !exists("g:plug_man_list")
        let g:plug_man_list = [ ]
    endif

    call add(g:plug_man_list, a:str)

endfunction


function! plug_man#InstallAll()

    if exists("g:plug_man_list")
        for i in g:plug_man_list
            call plug_man#Install(i)
        endfor
    endif

endfunction


function! plug_man#Install(str)

    if has("unix")
        execute "silent !git clone --depth=1 https://github.com/" . a:str . " ~/.vim/pack/other/start/" . split(a:str, '/')[1]
    else
        execute "silent !git clone --depth=1 https://github.com/" . a:str . " " . shellescape("%HOMEDRIVE%%HOMEPATH%/vimfiles/pack/other/start/", 1) . split(a:str, '/')[1]
    endif

endfunction
