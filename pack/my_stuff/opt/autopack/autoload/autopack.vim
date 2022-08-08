vim9script noclear

var autopack_path: string = ""

# set the path to the folder that will hold the packages this will be different based on OS
if !exists("g:autopack_path")
    if has("unix")
        autopack_path = "~/.vim/pack/autopack/opt/"
    else
        autopack_path = substitute(system('echo %USERPROFILE%'), '\n', '', 'g') .. '\vimfiles\pack\autopack\opt\'
    endif
else
    autopack_path = g:autopack_path
endif


# install all plugins in the list
export def InstallAll()
    if exists("g:autopack_list")
        for i in g:autopack_list
            execute "silent !git clone --depth=1 " .. i .. " " .. autopack_path .. split(i, '/')[4]
        endfor
    endif
enddef

# update all plugins in the list
export def UpdateAll()
    if exists("g:autopack_list")
        for i in g:autopack_list
            execute "silent !cd " .. autopack_path .. split(i, '/')[4] .. " && git pull" 
        endfor
    endif
enddef

# update all plugins in the list
export def Cleanup()
    # temporary list for package names
    var templist = [ ]

    # get directories that exist on the drive
    # TODO/bugfix: this doesn work in vim9script
    var directories = map(glob(fnameescape(autopack_path).'/{,.}*/', 1, 1), 'fnamemodify(v:val, ":h:t")')

    # get all the package names and add it to the list
    if exists("g:autopack_list")
        for i in g:autopack_list
            var packagename = split(i, '/')[4]
            call add(templist, packagename)
        endfor
    endif

    # for each directory that exists
    for d in directories
        # if the directory is not in the package list
        if index(templist, d) == -1
            if isdirectory(autopack_path .. d)
                #remove the directory
                if has("unix")
                    execute "silent !rm -rf " .. autopack_path .. d
                else
                    execute "silent !rmdir /s /q " .. autopack_path .. d
                endif
            endif
        endif
    endfor
enddef
