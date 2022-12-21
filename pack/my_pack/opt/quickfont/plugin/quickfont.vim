vim9script

#
# plugin for quickly cycling through a list of fonts
# pretty pointless, I know...
# to use this pointless plugin just add a list of fonts into your vimrc like this:
#
#     g:quickfont_list = [ "fixedsys", "consolas:h11" ]
#
# you can use <leader>f to cycle through fonts
# by default quickfont will apply the first font in the list
# if a font isnt installed you should see an error or vim will use the default font
#

var quickfont_index = 0

# increments font_index and calls apply
def QuickFont_Next(): void

    if !has("g:quickfont_list")
        return
    endif

    quickfont_index = (quickfont_index + 1) % len(g:quickfont_list) 
    QuickFont_Apply()

enddef

# apply the new font based on the value on font_index
def QuickFont_Apply(): void

    if !has("g:quickfont_list")
        return
    endif
    
    exec "set guifont=" .. g:quickfont_list[quickfont_index]

enddef


defcompile

QuickFont_Apply()

# keybinds
nnoremap <leader>f :call <SID>QuickFont_Next()<cr>
