vim9script

# colors
export var red   =  {gui: "#ff0000", cterm: "9"}
export var black =  {gui: "#000000", cterm: "0"}
export var grey03 = {gui: "#080808", cterm: "232"}
export var grey07 = {gui: "#121212", cterm: "233"}
export var grey11 = {gui: "#1c1c1c", cterm: "234"}
export var grey15 = {gui: "#262626", cterm: "235"}
export var grey19 = {gui: "#303030", cterm: "236"}
export var grey23 = {gui: "#3a3a3a", cterm: "237"}
export var grey27 = {gui: "#444444", cterm: "238"}
export var grey30 = {gui: "#4e4e4e", cterm: "239"}
export var grey35 = {gui: "#585858", cterm: "240"}
export var grey39 = {gui: "#626262", cterm: "241"}
export var grey42 = {gui: "#6c6c6c", cterm: "242"}
export var grey46 = {gui: "#767676", cterm: "243"}
export var grey50 = {gui: "#808080", cterm: "244"}
export var grey54 = {gui: "#8a8a8a", cterm: "245"}
export var grey58 = {gui: "#949494", cterm: "246"}
export var grey62 = {gui: "#9e9e9e", cterm: "247"}
export var grey66 = {gui: "#a8a8a8", cterm: "248"}
export var grey70 = {gui: "#b2b2b2", cterm: "249"}
export var grey74 = {gui: "#bcbcbc", cterm: "250"}
export var grey78 = {gui: "#c6c6c6", cterm: "251"}
export var grey82 = {gui: "#d0d0d0", cterm: "252"}
export var grey85 = {gui: "#dadada", cterm: "253"}
export var grey89 = {gui: "#e4e4e4", cterm: "254"}
export var grey93 = {gui: "#eeeeee", cterm: "255"}
export var white  = {gui: "#ffffff", cterm: "231"}

# store the highlight set
export var hl_set: list<dict<any>>

# main function for applying highlight groups
export def Hi(names: list<string>, style: dict<any>)

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
