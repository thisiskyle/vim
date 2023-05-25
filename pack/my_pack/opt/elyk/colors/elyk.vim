vim9script

# colors
var red = {gui: "#ff0000", cterm: "9"}
var black = {gui: "#000000", cterm: "0"}
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
var white = {gui: "#ffffff", cterm: "231"}
var underline = {gui: {underline: v:true}, cterm: {underline: v:true}}
var undercurl = {gui: {undercurl: v:true}, cterm: {undercurl: v:true}}
var bold = {gui: {bold: v:true}, cterm: {bold: v:true}}


g:colors_name = "elyk"
var hl_rules: list<dict<any>>

# function for adding highlight rules to the highlight set
def HL(names: list<string>, style: dict<any>)

    if (has_key(style, "linksto"))

        for name in names
            hl_rules->add({
                name: name, 
                force: v:true,
                linksto: style.linksto  
            })
        endfor
    else

        var gui_fg = (has_key(style, "fg") ? style.fg.gui : "NONE")
        var gui_bg = (has_key(style, "bg") ? style.bg.gui : "NONE")
        var gui_att = (has_key(style, "att") ? style.att.gui : {})
        var cterm_fg = (has_key(style, "fg") ? style.fg.cterm : "NONE")
        var cterm_bg = (has_key(style, "bg") ? style.bg.cterm : "NONE")
        var cterm_att = (has_key(style, "att") ? style.att.cterm : {})

        for name in names
            hl_rules->add({
                name: name, 
                guifg: gui_fg,
                guibg: gui_bg,
                gui: gui_att,
                ctermfg: cterm_fg,
                ctermbg: cterm_bg,
                cterm: cterm_att
            })
        endfor
    endif
enddef


HL(["Normal"], {fg: black, bg: white})
HL(["Matchparen"], {fg: black, bg: grey78, att: bold})
HL(["Search"], {fg: black, bg: grey78})
HL(["Visual"], {bg: grey89})
HL(["Cursor"], {fg: white, bg: black})
HL(["Pmenu"], {fg: grey50, bg: grey03})
HL(["PmenuSel"], {fg: white, bg: grey03}) 
HL(["Wildmenu"], {fg: white, bg: black})
HL(["Comment"], {fg: grey70})
HL(["Underlined"], {att: underline})
HL(["SpellBad"], {att: undercurl})
HL(["Error"], {fg: red})
HL(["TabLine"], {bg: grey78, att: underline})
HL(["TabLineFill"], {bg: white, att: underline})
HL(["TabLineSel"], {fg: white, bg: black})
HL(["StatusLine"], {fg: black, bg: white, att: underline})
HL(["StatusLineNC"], {fg: grey70, bg: white, att: underline})


HL(["IncSearch"], {linksto: "Cursor"})
HL(["ErrorMsg", "WarningMsg"], {linksto: "Error"})
HL(["CursorLine", "CursorColumn"], {linksto: "Visual"})
HL(["StatusLineTerm"], {linksto: "StatusLine"})
HL(["StatusLineTermNC"], {linksto: "StatusLineNC"})

# link to normal
HL([
    "Terminal",
    "CursorLineNR",
    "DiffAdd",
    "DiffChange",
    "DiffDelete",
    "DiffText",
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
    "PmenuSbar",
    "PmenuThumb",
    "lCursor",
    "LineNrAbove",
    "LineNrBelow",
    "VisualNOS",
    "MoreMsg",
    "ModeMsg" 
], {linksto: "Normal"})

# links to comment
HL([
    "Folded",
    "FoldColumn",
    "Todo",
    "VertSplit",
    "EndOfBuffer",
    "LineNr"
], {linksto: "Comment"})


# Run the highlight set
hlset(hl_rules)
