vim9script noclear

var packbro_root: string = ""

# set the path to the folder that will hold the packages this will be different based on OS
if !exists("g:packbro_root_path")
    if has("unix")
        packbro_root = "~/.vim/pack/packbro/"
    else
        packbro_root = substitute(system('echo %USERPROFILE%'), '[\n ]', '', 'g') .. '\vimfiles\pack\packbro\'
    endif
else
    packbro_root = g:packbro_root_path
endif


# function for the Install command
def Install()
    if exists("g:packbro_list")
        for i in g:packbro_list
            execute "silent !git clone --depth=1 " .. i.url .. " " .. packbro_root .. i.load_method .. "/" .. i.name
        endfor
    endif
    
enddef


# update all plugins in the list
def Update()
    if exists("g:packbro_list")
        for i in g:packbro_list
            execute "silent !cd " .. packbro_root .. i.load_method .. "/" .. i.name .. " && git pull" 
        endfor
    endif
enddef

# removes all plugins in the list
def Clean()
    # temporary list for package names
    var templist = [ ]

    # get all the package names and add it to the list
    if exists("g:packbro_list")
        for i in g:packbro_list
            var packagename = i.name
            call add(templist, packagename)
        endfor
    endif

    RemoveDirectories(templist, "start")
    RemoveDirectories(templist, "opt")


enddef

# delete the directories containing the plugin
def RemoveDirectories(packages: list<string>, load_method: string)

    # get directories that exist on the drive
    var directories = map(glob(fnameescape(packbro_root .. load_method .. "/") .. '/{,.}*/', 1, 1), 'fnamemodify(v:val, ":h:t")')

    # for each directory that exists
    for d in directories
        # if the directory is not in the package list
        if index(packages, d) == -1
            if isdirectory(packbro_root .. load_method .. "/" .. d)
                # remove the directory
                if has("unix")
                    execute "silent !rm -rf " .. packbro_root .. load_method .. "/" .. d
                else
                    execute "silent !rmdir /s /q " .. packbro_root .. load_method .. "\\" .. d
                endif
            endif
        endif
    endfor
enddef


defcompile


command! PackBroInstall :call <SID>Install()
command! PackBroUpdate  :call <SID>Update()
command! PackBroClean   :call <SID>Clean()
