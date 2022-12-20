vim9script

# variable to store the highlight set
var hl_set: list<dict<any>>

# function for adding highlight rules to the highlight set
export def HL(names: list<string>, style: dict<any>)

    if (has_key(style, "linksto"))

        for name in names
            hl_set->add({
                name: name, 
                force: v:true,
                linksto: style.linksto  
            })
        endfor
    else

        var gui_fg = (has_key(style, "fg") ? style.fg.gui : "NONE")
        var gui_bg = (has_key(style, "bg") ? style.bg.gui : "NONE")
        var gui_ = (has_key(style, "gui") ? style.gui : {})
        var cterm_fg = (has_key(style, "fg") ? style.fg.cterm : "NONE")
        var cterm_bg = (has_key(style, "bg") ? style.bg.cterm : "NONE")
        var cterm_ = (has_key(style, "cterm") ? style.cterm : {})

        for name in names
            hl_set->add({
                name: name, 
                guifg: gui_fg,
                guibg: gui_bg,
                gui: gui_,
                ctermfg: cterm_fg,
                ctermbg: cterm_bg,
                cterm: cterm_
            })
        endfor
    endif
enddef

# run the highlight set
export def Set()
    hlset(hl_set)
enddef




