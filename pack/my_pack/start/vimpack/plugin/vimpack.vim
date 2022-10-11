vim9script noclear

var vimpack_path: string = ""

# set the path to the folder that will hold the packages this will be different based on OS
if !exists("g:vimpack_path")
    if has("unix")
        vimpack_path = "~/.vim/pack/vimpack/opt/"
    else
        vimpack_path = substitute(system('echo %USERPROFILE%'), '[\n ]', '', 'g') .. '\vimfiles\pack\vimpack\opt\'
    endif
else
    vimpack_path = g:vimpack_path
endif


# install all plugins in the list
def Install()
    if exists("g:vimpack_list")
        for i in g:vimpack_list
            execute "silent !git clone --depth=1 " .. i .. " " .. vimpack_path .. split(i, '/')[4]
        endfor
    endif
enddef

# update all plugins in the list
def Update()
    if exists("g:vimpack_list")
        for i in g:vimpack_list
            execute "silent !cd " .. vimpack_path .. split(i, '/')[4] .. " && git pull" 
        endfor
    endif
enddef

# update all plugins in the list
def Clean()
    # temporary list for package names
    var templist = [ ]

    # get directories that exist on the drive
    var directories = map(glob(fnameescape(vimpack_path) .. '/{,.}*/', 1, 1), 'fnamemodify(v:val, ":h:t")')

    # get all the package names and add it to the list
    if exists("g:vimpack_list")
        for i in g:vimpack_list
            var packagename = split(i, '/')[4]
            call add(templist, packagename)
        endfor
    endif

    # for each directory that exists
    for d in directories
        # if the directory is not in the package list
        if index(templist, d) == -1
            if isdirectory(vimpack_path .. d)
                # remove the directory
                if has("unix")
                    execute "silent !rm -rf " .. vimpack_path .. d
                else
                    execute "silent !rmdir /s /q " .. vimpack_path .. d
                endif
            endif
        endif
    endfor
enddef

defcompile


command! VimPackInstall :call <SID>Install()
command! VimPackUpdate  :call <SID>Update()
command! VimPackClean   :call <SID>Clean()
