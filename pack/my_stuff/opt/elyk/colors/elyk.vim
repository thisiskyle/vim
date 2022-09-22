vim9script

if !exists("g:elyk_style")
    g:elyk_style = "dark"
endif

g:colors_name = "elyk"
var hl_set: list<dict<any>>



# colors
var red   =  {gui: "#ff0000", cterm: "9"}
var black =  {gui: "#000000", cterm: "0"}
var grey03 = {gui: "#080808", cterm: "232"}
var grey07 = {gui: "#121212", cterm: "233"}
var grey11 = {gui: "#1c1c1c", cterm: "234"}
var grey15 = {gui: "#262626", cterm: "235"}
var grey19 = {gui: "#303030", cterm: "236"}
var grey23 = {gui: "#3a3a3a", cterm: "237"}
var grey27 = {gui: "#444444", cterm: "238"}
var grey30 = {gui: "#4e4e4e", cterm: "239"}
var grey35 = {gui: "#585858", cterm: "240"}
var grey39 = {gui: "#626262", cterm: "241"}
var grey42 = {gui: "#6c6c6c", cterm: "242"}
var grey46 = {gui: "#767676", cterm: "243"}
var grey50 = {gui: "#808080", cterm: "244"}
var grey54 = {gui: "#8a8a8a", cterm: "245"}
var grey58 = {gui: "#949494", cterm: "246"}
var grey62 = {gui: "#9e9e9e", cterm: "247"}
var grey66 = {gui: "#a8a8a8", cterm: "248"}
var grey70 = {gui: "#b2b2b2", cterm: "249"}
var grey74 = {gui: "#bcbcbc", cterm: "250"}
var grey78 = {gui: "#c6c6c6", cterm: "251"}
var grey82 = {gui: "#d0d0d0", cterm: "252"}
var grey85 = {gui: "#dadada", cterm: "253"}
var grey89 = {gui: "#e4e4e4", cterm: "254"}
var grey93 = {gui: "#eeeeee", cterm: "255"}
var white  = {gui: "#ffffff", cterm: "231"}

# main function for applying highlight groups
def Hi(names: list<string>, style: dict<any>)

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

if (g:elyk_style == "dark")

    Hi(["Normal"], {fg: grey62, bg: grey15})
    Hi(["Matchparen"], {fg: white, gui: {bold: v:true}})
    Hi(["Search"], {fg: white})
    Hi(["IncSearch"], {fg: grey15, bg: grey62})
    Hi(["Visual"], {fg: grey15, bg: grey70})
    Hi(["Cursor"], {fg: grey03, bg: grey62})
    Hi(["CursorLineNr"], {fg: white})
    Hi(["CursorLine"], {bg: grey03})
    Hi(["Pmenu"], {bg: grey03})
    Hi(["PmenuSel"], {fg: white, bg: grey03}) 
    Hi(["Wildmenu"], {fg: grey15, bg: grey62})
    Hi(["Comment"], {fg: grey30})
    Hi(["StatusLine"], {fg: grey62})

elseif (g:elyk_style == "bright")

    Hi(["Normal"], {fg: black, bg: white})
    Hi(["Matchparen"], {fg: black, bg: grey85, gui: {bold: v:true}})
    Hi(["Search"], {fg: black, bg: grey78})
    Hi(["IncSearch"], {fg: white, bg: black})
    Hi(["Visual"], {fg: black, bg: grey70})
    Hi(["Cursor"], {fg: white, bg: black})
    Hi(["CursorLineNr"], {fg: white})
    Hi(["CursorLine"], {bg: grey93})
    Hi(["Pmenu"], {fg: grey50, bg: grey03})
    Hi(["PmenuSel"], {fg: white, bg: grey03}) 
    Hi(["Wildmenu"], {fg: white, bg: black})
    Hi(["Comment"], {fg: grey70})
    Hi(["StatusLine"], {fg: black})

elseif (g:elyk_style == "light")

    Hi(["Normal"], {fg: black, bg: grey70})
    Hi(["Matchparen"], {fg: black, bg: grey85, gui: {bold: v:true}})
    Hi(["Search"], {fg: black, bg: grey82})
    Hi(["IncSearch"], {fg: white, bg: black})
    Hi(["Visual"], {fg: black, bg: grey85})
    Hi(["Cursor"], {fg: white, bg: black})
    Hi(["CursorLineNr"], {fg: white})
    Hi(["CursorLine"], {bg: grey03})
    Hi(["Pmenu"], {fg: grey50, bg: grey03})
    Hi(["PmenuSel"], {fg: white, bg: grey03}) 
    Hi(["Wildmenu"], {fg: white, bg: black})
    Hi(["Comment"], {fg: grey93})
    Hi(["StatusLine"], {fg: black})

endif


Hi(["Underlined"], {gui: {underline: v:true}})
Hi(["SpellBad"], {gui: {undercurl: v:true}})
Hi(["Error"], {fg: red})
Hi(["CursorColumn"], {linksto: "CursorLine"})
Hi(["ErrorMsg", "WarningMsg"], {linksto: "Error"})

var link_normal = [
    "DiffAdd",
    "DiffChange",
    "DiffDelete",
    "DiffText",
    "TabLine",
    "TabLineSel",
    "TabLineFill",
    "ToolbarLine",
    "ToolbarButton",
    "Directory",
    "ColorColumn",
    "QuickFixLine",
    "SpecialKey",
    "NonText",
    "Question",
    "SignColumn",
    "Title",
    "Function",
    "String",
    "Character",
    "Statement",
    "PreProc",
    "Identifier",
    "Constant",
    "Boolean",
    "Delimiter",
    "Type",
    "Number",
    "Linear",
    "Special",
    "Conceal",
    "Ignore",
    "Float",
    "Conditional",
    "Repeat",
    "Label",
    "Operator",
    "Keyword",
    "Exception",
    "Include",
    "Define",
    "Macro",
    "PreCondit",
    "StorageClass",
    "Structure",
    "Typedef",
    "Tag",
    "SpecialChar",
    "SpecialComment",
    "Debug",
    "SpellCap",
    "SpellRare",
    "SpellLocal",
    "StatusLineTerm",
    "StatusLineTermNC",
    "PmenuSbar",
    "PmenuThumb",
    "lCursor",
    "LineNrAbove",
    "LineNrBelow",
    "VisualNOS",
    "MoreMsg",
    "ModeMsg"
]

var link_comment = [
    "Folded",
    "FoldColumn",
    "StatusLineNC",
    "Todo",
    "VertSplit",
    "EndOfBuffer",
    "LineNr"
]

Hi(link_normal, {linksto: "Normal"})
Hi(link_comment, {linksto: "Comment"})

# Run the highlight set
hlset(hl_set)
