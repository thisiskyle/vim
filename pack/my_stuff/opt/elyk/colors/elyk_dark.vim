vim9script

import "../helper.vim" as h

g:colors_name = "elyk_dark"

h.Hi(["Normal"], {fg: h.grey62, bg: h.grey15})
h.Hi(["Matchparen"], {fg: h.white, gui: {bold: v:true}})
h.Hi(["Search"], {fg: h.white})
h.Hi(["IncSearch"], {fg: h.grey15, bg: h.grey62})
h.Hi(["Visual"], {fg: h.grey15, bg: h.grey70})
h.Hi(["Cursor"], {fg: h.grey03, bg: h.grey62})
h.Hi(["CursorLineNr"], {fg: h.white})
h.Hi(["CursorLine"], {bg: h.grey03})
h.Hi(["Pmenu"], {bg: h.grey03})
h.Hi(["PmenuSel"], {fg: h.white, bg: h.grey03}) 
h.Hi(["Wildmenu"], {fg: h.grey15, bg: h.grey62})
h.Hi(["Comment"], {fg: h.grey30})
h.Hi(["StatusLine"], {fg: h.grey62})
h.Hi(["Underlined"], {gui: {underline: v:true}})
h.Hi(["SpellBad"], {gui: {undercurl: v:true}})
h.Hi(["Error"], {fg: h.red})
h.Hi(["CursorColumn"], {linksto: "CursorLine"})
h.Hi(["ErrorMsg", "WarningMsg"], {linksto: "Error"})

# link to Normal
h.Hi([
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
h.Hi([
    "Folded",
    "FoldColumn",
    "StatusLineNC",
    "Todo",
    "VertSplit",
    "EndOfBuffer",
    "LineNr"
], {linksto: "Comment"})


# Run the highlight set
hlset(h.hl_set)
