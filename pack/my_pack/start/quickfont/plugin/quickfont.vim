vim9script

var quickfont_index = 0

# sets the font_index to a specific value
def QuickFont_Set(n: number): void
    quickfont_index = n
    QuickFont_Apply()
enddef

# increments font_index and calls apply
def QuickFont_Next(): void
    quickfont_index = (quickfont_index + 1) % len(g:quickfont_list) 
    QuickFont_Apply()
enddef

# apply the new font based on the value on font_index
def QuickFont_Apply(): void
    exec "set guifont=" .. g:quickfont_list[quickfont_index]
enddef

defcompile

QuickFont_Set(0)

# keybinds
nnoremap <leader>f :call <SID>QuickFont_Next()<cr>
