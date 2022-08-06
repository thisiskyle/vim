vim9script

hi clear

if exists("syntax_on")
    syntax reset
endif

if !exists("g:elyk_style")
    g:elyk_style = "dark"
endif

# settings
g:colors_name = "elyk"

# colors
var red =    {"gui": "#ff0000", "cterm": "9"}
var black =  {"gui": "#000000", "cterm": "0"}
var grey3 =  {"gui": "#080808", "cterm": "232"}
var grey7 =  {"gui": "#121212", "cterm": "233"}
var grey11 = {"gui": "#1c1c1c", "cterm": "234"}
var grey15 = {"gui": "#262626", "cterm": "235"}
var grey19 = {"gui": "#303030", "cterm": "236"}
var grey23 = {"gui": "#3a3a3a", "cterm": "237"}
var grey27 = {"gui": "#444444", "cterm": "238"}
var grey30 = {"gui": "#4e4e4e", "cterm": "239"}
var grey35 = {"gui": "#585858", "cterm": "240"}
var grey39 = {"gui": "#626262", "cterm": "241"}
var grey42 = {"gui": "#6c6c6c", "cterm": "242"}
var grey46 = {"gui": "#767676", "cterm": "243"}
var grey50 = {"gui": "#808080", "cterm": "244"}
var grey54 = {"gui": "#8a8a8a", "cterm": "245"}
var grey58 = {"gui": "#949494", "cterm": "246"}
var grey62 = {"gui": "#9e9e9e", "cterm": "247"}
var grey66 = {"gui": "#a8a8a8", "cterm": "248"}
var grey70 = {"gui": "#b2b2b2", "cterm": "249"}
var grey74 = {"gui": "#bcbcbc", "cterm": "250"}
var grey78 = {"gui": "#c6c6c6", "cterm": "251"}
var grey82 = {"gui": "#d0d0d0", "cterm": "252"}
var grey85 = {"gui": "#dadada", "cterm": "253"}
var grey89 = {"gui": "#e4e4e4", "cterm": "254"}
var grey93 = {"gui": "#eeeeee", "cterm": "255"}
var white  = {"gui": "#ffffff", "cterm": "231"}

# main function for applying highlight groups
def Hi(group: string, style: dict<any>)
    execute "hi " .. group
        \ .. " guifg="   .. (has_key(style, "fg")    ? style.fg.gui   : "NONE")
        \ .. " guibg="   .. (has_key(style, "bg")    ? style.bg.gui   : "NONE")
        \ .. " gui="     .. (has_key(style, "gui")   ? style.gui      : "NONE")
        \ .. " ctermfg=" .. (has_key(style, "fg")    ? style.fg.cterm : "NONE")
        \ .. " ctermbg=" .. (has_key(style, "bg")    ? style.bg.cterm : "NONE")
        \ .. " cterm="   .. (has_key(style, "cterm") ? style.cterm    : "NONE")
    enddef

if (g:elyk_style == "dark")

    Hi("Normal",       {"fg": grey62, "bg": grey15})
    Hi("Matchparen",   {"fg": white, "gui": "bold"})
    Hi("Search",       {"fg": white})
    Hi("IncSearch",    {"fg": grey15, "bg": grey62})
    Hi("Visual",       {"fg": grey15, "bg": grey70})
    Hi("Cursor",       {"fg": grey3, "bg": grey62})
    Hi("CursorLineNr", {"fg": white})
    Hi("CursorLine",   {"bg": grey3})
    Hi("Pmenu",        {"bg": grey3})
    Hi("PmenuSel",     {"fg": white, "bg": grey3}) 
    Hi("Wildmenu",     {"fg": grey15, "bg": grey62})
    Hi("Underlined",   {"gui": "underline"})
    Hi("SpellBad",     {"gui": "undercurl"})
    Hi("Error",        {"fg": red})
    Hi("Comment",      {"fg": grey30})
    Hi("StatusLine",   {"fg": grey62})

elseif (g:elyk_style == "bright")

    Hi("Normal",       {"fg": black, "bg": white})
    Hi("Matchparen",   {"fg": black, "bg": grey85, "gui": "bold"})
    Hi("Search",       {"fg": black, "bg": grey78})
    Hi("IncSearch",    {"fg": white, "bg": black})
    Hi("Visual",       {"fg": black, "bg": grey70})
    Hi("Cursor",       {"fg": white, "bg": black})
    Hi("CursorLineNr", {"fg": white})
    Hi("CursorLine",   {"bg": grey3})
    Hi("Pmenu",        {"fg": grey50, "bg": grey3})
    Hi("PmenuSel",     {"fg": white, "bg": grey3}) 
    Hi("Wildmenu",     {"fg": white, "bg": black})
    Hi("Underlined",   {"gui": "underline"})
    Hi("SpellBad",     {"gui": "undercurl"})
    Hi("Error",        {"fg": red})
    Hi("Comment",      {"fg": grey70})
    Hi("StatusLine",   {"fg": black})

elseif (g:elyk_style == "light")

    Hi("Normal",       {"fg": black, "bg": grey70})
    Hi("Matchparen",   {"fg": black, "bg": grey85, "gui": "bold"})
    Hi("Search",       {"fg": black, "bg": grey82})
    Hi("IncSearch",    {"fg": white, "bg": black})
    Hi("Visual",       {"fg": black, "bg": grey85})
    Hi("Cursor",       {"fg": white, "bg": black})
    Hi("CursorLineNr", {"fg": white})
    Hi("CursorLine",   {"bg": grey3})
    Hi("Pmenu",        {"fg": grey50, "bg": grey3})
    Hi("PmenuSel",     {"fg": white, "bg": grey3}) 
    Hi("Wildmenu",     {"fg": white, "bg": black})
    Hi("Underlined",   {"gui": "underline"})
    Hi("SpellBad",     {"gui": "undercurl"})
    Hi("Error",        {"fg": red})
    Hi("Comment",      {"fg": grey93})
    Hi("StatusLine",   {"fg": black})

endif


hi! link DiffAdd          Normal
hi! link DiffChange       Normal
hi! link DiffDelete       Normal
hi! link DiffText         Normal
hi! link TabLine          Normal
hi! link TabLineSel       Normal
hi! link TabLineFill      Normal
hi! link ToolbarLine      Normal
hi! link ToolbarButton    Normal
hi! link Directory        Normal
hi! link ColorColumn      Normal
hi! link QuickFixLine     Normal
hi! link SpecialKey       Normal
hi! link NonText          Normal
hi! link Question         Normal
hi! link SignColumn       Normal
hi! link Title            Normal
hi! link Function         Normal
hi! link String           Normal
hi! link Character        Normal
hi! link Statement        Normal
hi! link PreProc          Normal
hi! link Identifier       Normal
hi! link Constant         Normal
hi! link Boolean          Normal
hi! link Delimiter        Normal
hi! link Type             Normal
hi! link Number           Normal
hi! link Linear           Normal
hi! link Special          Normal
hi! link Conceal          Normal
hi! link Ignore           Normal
hi! link Float            Normal
hi! link Conditional      Normal
hi! link Repeat           Normal
hi! link Label            Normal
hi! link Operator         Normal
hi! link Keyword          Normal
hi! link Exception        Normal
hi! link Include          Normal
hi! link Define           Normal
hi! link Macro            Normal
hi! link PreCondit        Normal
hi! link StorageClass     Normal
hi! link Structure        Normal
hi! link Typedef          Normal
hi! link Tag              Normal
hi! link SpecialChar      Normal
hi! link SpecialComment   Normal
hi! link Debug            Normal 
hi! link SpellCap         Normal
hi! link SpellRare        Normal
hi! link SpellLocal       Normal
hi! link StatusLineTerm   Normal
hi! link StatusLineTermNC Normal
hi! link PmenuSbar        Normal
hi! link PmenuThumb       Normal
hi! link lCursor          Normal
hi! link LineNrAbove      Normal
hi! link LineNrBelow      Normal
hi! link VisualNOS        Normal
hi! link MoreMsg          Normal
hi! link ModeMsg          Normal
hi! link Folded           Comment
hi! link FoldColumn       Comment
hi! link StatusLineNC     Comment
hi! link Todo             Comment
hi! link VertSplit        Comment
hi! link EndOfBuffer      Comment
hi! link LineNr           Comment
hi! link CursorColumn     CursorLine
hi! link ErrorMsg         Error
hi! link WarningMsg       Error
