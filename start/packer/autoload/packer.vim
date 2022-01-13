
" set the path to the folder that will hold the packages
" this will be different based on OS
if has("unix")
    let s:packerpath = "~/.vim/pack/packer/start/"
else
    let s:packerpath = shellescape("%HOMEDRIVE%%HOMEPATH%/vimfiles/pack/packer/start/", 1)
endif


" install all plugins in the list
function! packer#InstallAll()
    if exists("g:packer_list")
        for i in g:packer_list
            execute "silent !git clone --depth=1 " . i . " " . s:packerpath . split(i, '/')[4]
        endfor
    endif
endfunction

" update all plugins in the list
function! packer#UpdateAll()
    if exists("g:packer_list")
        for i in g:packer_list
            execute "silent !cd " . s:packerpath . split(i, '/')[4] . " && git pull" 
        endfor
    endif
endfunction

