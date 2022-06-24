
hi clear

if exists("syntax_on")
    syntax reset
endif

" settings
let g:colors_name="elyk"

" colors
let s:red    = {"gui": "#ff0000", "cterm": "9"  }
let s:black  = {"gui": "#000000", "cterm": "0"  }
let s:grey3  = {"gui": "#080808", "cterm": "232"}
let s:grey7  = {"gui": "#121212", "cterm": "233"}
let s:grey11 = {"gui": "#1c1c1c", "cterm": "234"}
let s:grey15 = {"gui": "#262626", "cterm": "235"}
let s:grey19 = {"gui": "#303030", "cterm": "236"}
let s:grey23 = {"gui": "#3a3a3a", "cterm": "237"}
let s:grey27 = {"gui": "#444444", "cterm": "238"}
let s:grey30 = {"gui": "#4e4e4e", "cterm": "239"}
let s:grey35 = {"gui": "#585858", "cterm": "240"}
let s:grey39 = {"gui": "#626262", "cterm": "241"}
let s:grey42 = {"gui": "#6c6c6c", "cterm": "242"}
let s:grey46 = {"gui": "#767676", "cterm": "243"}
let s:grey50 = {"gui": "#808080", "cterm": "244"}
let s:grey54 = {"gui": "#8a8a8a", "cterm": "245"}
let s:grey58 = {"gui": "#949494", "cterm": "246"}
let s:grey62 = {"gui": "#9e9e9e", "cterm": "247"}
let s:grey66 = {"gui": "#a8a8a8", "cterm": "248"}
let s:grey70 = {"gui": "#b2b2b2", "cterm": "249"}
let s:grey74 = {"gui": "#bcbcbc", "cterm": "250"}
let s:grey78 = {"gui": "#c6c6c6", "cterm": "251"}
let s:grey82 = {"gui": "#d0d0d0", "cterm": "252"}
let s:grey85 = {"gui": "#dadada", "cterm": "253"}
let s:grey89 = {"gui": "#e4e4e4", "cterm": "254"}
let s:grey93 = {"gui": "#eeeeee", "cterm": "255"}
let s:white  = {"gui": "#ffffff", "cterm": "231"}

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
call s:hi("Normal",       {"fg": s:grey62, "bg": s:grey15})
call s:hi("Matchparen",   {"fg": s:white, "gui": "bold"})
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

call s:hi("WarningMsg",   {"fg": s:red})
hi! link ErrorMsg         Error
hi! link MoreMsg          Normal
hi! link ModeMsg          Normal

call s:hi("Search",       {"fg": s:white})
call s:hi("IncSearch",    {"fg": s:grey15, "bg": s:grey62})

call s:hi("Visual",       {"fg": s:grey15, "bg": s:grey70})
hi! link VisualNOS        Normal

call s:hi("Cursor",       {"fg": s:grey3, "bg": s:grey62})
call s:hi("CursorLineNr", {"fg": s:white})
call s:hi("CursorLine",   {"bg": s:grey3})
hi! link lCursor          Normal
hi! link CursorColumn     CursorLine

hi! link LineNr           Comment
hi! link LineNrAbove      Normal
hi! link LineNrBelow      Normal

call s:hi("Pmenu",        {"bg": s:grey3})
call s:hi("PmenuSel",     {"fg": s:white, "bg": s:grey3}) 
hi! link PmenuSbar        Normal
hi! link PmenuThumb       Normal
call s:hi("Wildmenu",     {"fg": s:grey15, "bg": s:grey62})

call s:hi("StatusLine",   {"fg": s:white})
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

call s:hi("SpellBad",     {"gui": "undercurl"})
hi! link SpellCap         Normal
hi! link SpellRare        Normal
hi! link SpellLocal       Normal

" code syntax
call s:hi("Error",        {"fg": s:red})
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
call s:hi("Comment",      {"fg": s:grey30})

" diff
hi! link DiffAdd          Normal
hi! link DiffChange       Normal
hi! link DiffDelete       Normal
hi! link DiffText         Normal