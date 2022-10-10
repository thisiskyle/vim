vim9script

import "../helper.vim" as h

g:colors_name = "elyk"


h.Hi(["Normal"], {fg: h.black, bg: h.white})
h.Hi(["Matchparen"], {fg: h.black, bg: h.grey85, gui: {bold: v:true}})
h.Hi(["Search"], {fg: h.black, bg: h.grey78})
h.Hi(["IncSearch"], {fg: h.white, bg: h.black})
h.Hi(["Visual"], {fg: h.black, bg: h.grey70})
h.Hi(["Cursor"], {fg: h.white, bg: h.black})
h.Hi(["CursorLineNr"], {fg: h.white})
h.Hi(["CursorLine"], {bg: h.grey93})
h.Hi(["Pmenu"], {fg: h.grey50, bg: h.grey03})
h.Hi(["PmenuSel"], {fg: h.white, bg: h.grey03}) 
h.Hi(["Wildmenu"], {fg: h.white, bg: h.black})
h.Hi(["Comment"], {fg: h.grey70})
h.Hi(["StatusLine"], {fg: h.black})
h.Hi(["Underlined"], {gui: {underline: v:true}})
h.Hi(["SpellBad"], {gui: {undercurl: v:true}})
h.Hi(["Error"], {fg: h.red})
h.Hi(["CursorColumn"], {linksto: "CursorLine"})
h.Hi(["ErrorMsg", "WarningMsg"], {linksto: "Error"})

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
