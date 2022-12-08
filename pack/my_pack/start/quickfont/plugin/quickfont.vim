vim9script


# sets the font_index to a specific value
def QuickFont_Set(n: number): void
    g:quickfont_index = n
    QuickFont_Apply()
enddef

# increments font_index and calls apply
def QuickFont_Next(): void
    g:quickfont_index = (g:quickfont_index + 1) % len(g:quickfont_list) 
    QuickFont_Apply()
enddef

# apply the new font based on the value on font_index
def QuickFont_Apply(): void
    exec "set guifont=" .. g:quickfont_list[g:quickfont_index]
enddef

defcompile

# set the font on start up, if no default is set, the default is zero
if has("g:quickfont_default")
    call QuickFont_Set(g:quickfont_default)
else
    call QuickFont_Set(0)
endif



nnoremap gn :call <SID>QuickFont_Next()<cr>
