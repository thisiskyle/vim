
hi clear

if exists("syntax_on")
    syntax reset
endif

" settings
let g:colors_name="grayish"

" colors
let s:yellow  = {"gui": "#fabd2f", "cterm": "214"}
let s:blue    = {"gui": "#83a598", "cterm": "109"}
let s:purple  = {"gui": "#d3869b", "cterm": "175"}
let s:green   = {"gui": "#b8bb26", "cterm": "142"}
let s:orange  = {"gui": "#af5f00", "cterm": "130"}
let s:gold    = {"gui": "#afaf00", "cterm": "142"}
let s:red     = {"gui": "#d75f5f", "cterm": "167"}
let s:tan     = {"gui": "#ebdbb2", "cterm": "223"}
" the lower the number the darker the grey
let s:black   = {"gui": "#000000", "cterm": "0"  }
let s:grey1   = {"gui": "#080808", "cterm": "232"}
let s:grey2   = {"gui": "#1c1c1c", "cterm": "234"}
let s:grey3   = {"gui": "#262626", "cterm": "235"}
let s:grey4   = {"gui": "#4e4e4e", "cterm": "239"}
let s:grey5   = {"gui": "#767676", "cterm": "243"}
let s:grey6   = {"gui": "#9e9e9e", "cterm": "247"}
let s:grey7   = {"gui": "#d0d0d0", "cterm": "252"}
let s:grey8   = {"gui": "#eeeeee", "cterm": "255"}
let s:white   = {"gui": "#ffffff", "cterm": "231"}

" main function for applying highlight groups
function! s:hi(group, style)
    execute "hi" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction


" vim editor
call s:hi("Normal",       {"fg": s:grey6, "bg": s:grey2})
call s:hi("Matchparen",   {"fg": s:orange, "gui": "bold"})
hi! link EndOfBuffer      Comment
hi! link Directory        Normal
hi! link ColorColumn      Normal
hi! link QuickFixLine     Normal
hi! link SpecialKey       Normal
hi! link NonText          Normal
hi! link Question         Normal
hi! link VertSplit        Comment
hi! link SignColumn       Normal
hi! link Title            Normal

call s:hi("WarningMsg",   {"fg": s:orange})
hi! link ErrorMsg         Error
hi! link MoreMsg          Normal
hi! link ModeMsg          Normal

call s:hi("Search",       {"fg": s:yellow})
call s:hi("IncSearch",    {"fg": s:red})

call s:hi("Visual",       {"fg": s:grey2, "bg": s:grey6})
hi! link VisualNOS        Normal

call s:hi("Cursor",       {"fg": s:grey3, "bg": s:white})
call s:hi("CursorLineNr", {"fg": s:white})
call s:hi("CursorLine",   {"bg": s:grey2})
hi! link lCursor          Normal
hi! link CursorColumn     CursorLine

hi! link LineNr           Comment
hi! link LineNrAbove      Normal
hi! link LineNrBelow      Normal

call s:hi("Pmenu",        {"bg": s:grey1})
call s:hi("PmenuSel",     {"fg": s:yellow, "bg": s:grey1}) 
hi! link PmenuSbar        Normal
hi! link PmenuThumb       Normal
call s:hi("WildMenu",     {"fg": s:red})

call s:hi("StatusLine",   {"fg": s:grey8})
hi! link StatusLineNC     Comment
hi! link StatusLineTerm   Normal
hi! link StatusLineTermNC Normal

call s:hi("Underlined",   {"gui": "underline"})

hi! link Folded           Comment
hi! link FoldColumn       Comment

hi! link TabLine          Normal
hi! link TabLineSel       Normal
hi! link TabLineFill      Normal

hi! link ToolbarLine      Normal
hi! link ToolbarButton    Normal

hi! link SpellBad         Normal
hi! link SpellCap         Normal
hi! link SpellRare        Normal
hi! link SpellLocal       Normal

" code syntax
call s:hi("Comment",      {"fg": s:grey4})
call s:hi("Error",        {"fg": s:red, "gui": "undercurl"})
call s:hi("Function",     {"fg": s:grey7, "gui": "bold"})
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
hi! link Todo             Comment
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

" diff
hi! link DiffAdd          Normal
hi! link DiffChange       Normal
hi! link DiffDelete       Normal
hi! link DiffText         Normal
