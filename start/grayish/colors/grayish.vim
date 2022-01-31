
hi clear

if exists("syntax_on")
    syntax reset
endif

" main function for applying highlight groups
function! s:hi(group, style)
    execute "hi" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
        \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" settings
let g:colors_name="grayish"

let s:yellow  = { "gui": "#fabd2f", "cterm": "214" }
let s:blue    = { "gui": "#83a598", "cterm": "109" }
let s:purple  = { "gui": "#d3869b", "cterm": "175" }
let s:green   = { "gui": "#b8bb26", "cterm": "142" }
let s:orange  = { "gui": "#af5f00", "cterm": "130" }
let s:gold    = { "gui": "#afaf00", "cterm": "142" }
let s:red     = { "gui": "#d75f5f", "cterm": "167" }
let s:tan     = { "gui": "#ebdbb2", "cterm": "223" }
" the lower the number the darker the grey
let s:black   = { "gui": "#000000", "cterm": "0"   }
let s:grey1   = { "gui": "#080808", "cterm": "232" }
let s:grey2   = { "gui": "#1c1c1c", "cterm": "234" }
let s:grey3   = { "gui": "#262626", "cterm": "235" }
let s:grey4   = { "gui": "#4e4e4e", "cterm": "239" }
let s:grey5   = { "gui": "#767676", "cterm": "243" }
let s:grey6   = { "gui": "#9e9e9e", "cterm": "247" }
let s:grey7   = { "gui": "#d0d0d0", "cterm": "252" }
let s:grey8   = { "gui": "#eeeeee", "cterm": "255" }
let s:white   = { "gui": "#ffffff", "cterm": "231" }


call s:hi("Normal",       {"fg": s:grey6, "bg": s:grey2})
call s:hi("CursorLine",   {"bg": s:grey2})
call s:hi("Error",        {"fg": s:red})
call s:hi("WarningMsg",   {"fg": s:orange})
call s:hi("Matchparen",   {"fg": s:orange, "gui": "bold"})
call s:hi("IncSearch",    {"fg": s:red})
call s:hi("Search",       {"fg": s:yellow})
call s:hi("Visual",       {"fg": s:grey2, "bg": s:grey6})
call s:hi("Comment",      {"fg": s:grey4})
call s:hi("Cursor",       {"fg": s:grey3, "bg": s:white})
call s:hi("CursorLineNr", {"fg": s:white})
call s:hi("Pmenu",        {"bg": s:grey1})
call s:hi("Pmenusel",     {"fg": s:yellow, "bg": s:grey1}) 
call s:hi("Wildmenu",     {"fg": s:red})
call s:hi("StatusLine",   {"fg": s:grey8})
call s:hi("Underlined",   {"gui": "underline"})
call s:hi("Function",     {"fg": s:grey7, "gui": "bold"})

hi! link NonText       Normal
hi! link Special       Normal
hi! link SpecialKey    Normal
hi! link Character     Normal
hi! link Statement     Normal
hi! link PreProc       Normal
hi! link Identifier    Normal
hi! link Constant      Normal
hi! link Boolean       Normal
hi! link Delimiter     Normal
hi! link Title         Normal
hi! link Type          Normal
hi! link Number        Normal
hi! link Pmenusbar     Normal
hi! link PmenuThumb    Normal
hi! link Linear        Normal
hi! link String        Normal

hi! link LineNr        Comment
hi! link Comment       Comment
hi! link VertSplit     Comment
hi! link Todo          Comment
hi! link Folded        Comment
hi! link FoldColumn    Comment
hi! link EndOfBuffer   Comment
hi! link StatusLineNC  Comment

hi! link CursorColumn  CursorLine

hi! link ErrorMsg      Error


" settings based highlight groups
if has("gui_running") && exists("g:grayish_italics") && g:grayish_italics == 1
    call s:hi("Comment", {"fg": s:grey4, "bg": s:grey2, "gui": "italic"})
    call s:hi("Todo",    {"fg": s:grey4, "bg": s:grey2, "gui": "italic"})
endif
