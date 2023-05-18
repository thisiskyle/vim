vim9script noclear

var vimpack_root: string = ""

# set the path to the folder that will hold the packages this will be different based on OS
if !exists("g:vimpack_root_path")
    if has("unix")
        vimpack_root = "~/.vim/pack/vimpack/"
    else
        vimpack_root = substitute(system('echo %USERPROFILE%'), '[\n ]', '', 'g') .. '\vimfiles\pack\vimpack\'
    endif
else
    vimpack_root = g:vimpack_root_path
endif


# function for the Install command
def Install()
    if exists("g:vimpack_list")
        for i in g:vimpack_list
            execute "silent !git clone --depth=1 " .. i.url .. " " .. vimpack_root .. i.load_method .. "/" .. split(i.url, '/')[4]
        endfor
    endif
    
enddef


# update all plugins in the list
def Update()
    if exists("g:vimpack_list")
        for i in g:vimpack_list
            execute "silent !cd " .. vimpack_root .. i.load_method .. "/" .. split(i.url, '/')[4] .. " && git pull" 
        endfor
    endif
enddef

# removes all plugins in the list
def Clean()
    # temporary list for package names
    var templist = [ ]

    # get all the package names and add it to the list
    if exists("g:vimpack_list")
        for i in g:vimpack_list
            var packagename = split(i.url, '/')[4]
            call add(templist, packagename)
        endfor
    endif

    RemoveDirectories(templist, "start")
    RemoveDirectories(templist, "opt")


enddef

# delete the directories containing the plugin
def RemoveDirectories(packages: list<string>, load_method: string)

    # get directories that exist on the drive
    var directories = map(glob(fnameescape(vimpack_root .. load_method .. "/") .. '/{,.}*/', 1, 1), 'fnamemodify(v:val, ":h:t")')

    # for each directory that exists
    for d in directories
        # if the directory is not in the package list
        if index(packages, d) == -1
            if isdirectory(vimpack_root .. load_method .. "/" .. d)
                # remove the directory
                if has("unix")
                    execute "silent !rm -rf " .. vimpack_root .. load_method .. "/" .. d
                else
                    execute "silent !rmdir /s /q " .. vimpack_root .. load_method .. "\\" .. d
                endif
            endif
        endif
    endfor
enddef


defcompile


command! VimPackInstall :call <SID>Install()
command! VimPackUpdate  :call <SID>Update()
command! VimPackClean   :call <SID>Clean()
