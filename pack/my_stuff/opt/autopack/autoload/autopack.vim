
" set the path to the folder that will hold the packages
" this will be different based on OS
if !exists("g:autopack_path")
    if has("unix")
        let g:autopack_path = "~/.vim/pack/autopack/opt/"
    else
        let g:autopack_path = substitute(system('echo %USERPROFILE%'), '\n', '', 'g') . '\vimfiles\pack\autopack\opt\'
    endif
endif


" install all plugins in the list
function! autopack#InstallAll()
    if exists("g:autopack_list")
        for i in g:autopack_list
            execute "silent !git clone --depth=1 " . i . " " . g:autopack_path . split(i, '/')[4]
        endfor
    endif
endfunction

" update all plugins in the list
function! autopack#UpdateAll()
    if exists("g:autopack_list")
        for i in g:autopack_list
            execute "silent !cd " . g:autopack_path . split(i, '/')[4] . " && git pull" 
        endfor
    endif
endfunction

" update all plugins in the list
function! autopack#Cleanup()
    " temporary list for package names
    let templist = [ ]

    " get directories that exist on the drive
    let directories = map(glob(fnameescape(g:autopack_path).'/{,.}*/', 1, 1), 'fnamemodify(v:val, ":h:t")')

    " get all the package names and add it to the list
    if exists("g:autopack_list")
        for i in g:autopack_list
            let packagename = split(i, '/')[4]
            call add(templist, packagename)
        endfor
    endif

    " for each directory that exists
    for d in directories
        " if the directory is not in the package list
        if index(templist, d) == -1
            if isdirectory(g:autopack_path . d)
                "remove the directory
                if has("unix")
                    execute "silent !rm -rf " . g:autopack_path . d
                else
                    execute "silent !rmdir /s /q " . g:autopack_path . d
                endif
            endif
        endif
    endfor
endfunction
