vim9script

#
# plugin for quickly cycling through a list of fonts
# pretty pointless, I know...
# to use this pointless plugin just add a list of fonts into your vimrc like this:
#
#     g:fontbro_list = [ "fixedsys", "consolas:h11" ]
#
# you can use <leader>f to cycle through fonts
# by default fontbro will apply the first font in the list
# if a font isnt installed you should see an error or vim will use the default font
#

var index = 0

# increments font_index and calls apply
def Fontbro_Next(): void

    if !exists("g:fontbro_list")
        return
    endif

    index = (index + 1) % len(g:fontbro_list) 
    Fontbro_Apply()

enddef

# apply the new font based on the value on font_index
def Fontbro_Apply(): void

    if !exists("g:fontbro_list")
        return
    endif
    
    exec "set guifont=" .. g:fontbro_list[index]

enddef


defcompile

Fontbro_Apply()

# keybinds
nnoremap <leader>f :call <SID>Fontbro_Next()<cr>
