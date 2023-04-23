vim9script

import "../helper.vim" as h
import "../color_palette.vim" as p

g:colors_name = "elyk_dark"

# test
h.HL(["Normal"], {fg: p.grey62, bg: p.grey15})
h.HL(["Matchparen"], {fg: p.white, gui: {bold: v:true}})
h.HL(["Search"], {fg: p.white})
h.HL(["Visual"], {bg: p.grey07})
h.HL(["Cursor"], {fg: p.grey03, bg: p.grey74})
h.HL(["Pmenu"], {bg: p.grey03})
h.HL(["PmenuSel"], {fg: p.white, bg: p.grey03}) 
h.HL(["Wildmenu"], {fg: p.grey15, bg: p.grey62})
h.HL(["Comment"], {fg: p.grey30})
h.HL(["StatusLine"], {fg: p.grey62})
h.HL(["Underlined"], {gui: {underline: v:true}})
h.HL(["SpellBad"], {gui: {undercurl: v:true}})
h.HL(["Error"], {fg: p.red})
h.HL(["CursorLineNR"], {gui: {underline: v:true}})

h.HL([
    "IncSearch"
], {linksto: "Cursor"})

h.HL([
    "ErrorMsg", 
    "WarningMsg"
], {linksto: "Error"})

# link to Normal
h.HL([
    "CursorLine",
    "CursorColumn",
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
], {linksto: "Normal"})

# link to comment
h.HL([
    "Folded",
    "FoldColumn",
    "StatusLineNC",
    "Todo",
    "VertSplit",
    "EndOfBuffer",
    "LineNr"
], {linksto: "Comment"})

# Run the highlight set
h.Set()
