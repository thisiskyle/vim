
hi clear
if exists("syntax_on")
    syntax reset
endif


let g:colors_name="simple"


let s:gui = {}

if !exists('g:simple_style')
    let g:simple_style='default'
endif



let s:gui.bg      = { 'default':'#263238', 'gruvbox':'#32302F'}
let s:gui.fg      = { 'default':'#ECEFF1', 'gruvbox':'#D5C4A1'}
let s:gui.comment = { 'default':'#5D818E', 'gruvbox':'#7C6F64'}
let s:gui.none    = { 'default':'NONE',    'gruvbox':'NONE'}
let s:gui.red     = { 'default':'NONE',    'gruvbox':'#FB4934'}
let s:gui.green   = { 'default':'NONE',    'gruvbox':'#B8BB26'}
let s:gui.yellow  = { 'default':'NONE',    'gruvbox':'#FABD2F'}
let s:gui.blue    = { 'default':'NONE',    'gruvbox':'#83A598'}
let s:gui.orange  = { 'default':'NONE',    'gruvbox':'#FE8019'}



function! s:hi(group, guifg, guibg, guistyle)
    exec "hi " . a:group . " guifg=" . a:guifg[g:simple_style]
    exec "hi " . a:group . " guibg=" . a:guibg[g:simple_style]
    exec "hi " . a:group . " gui=" . a:guistyle[g:simple_style]
endfunction



call s:hi("Normal",        s:gui.fg,      s:gui.bg,        s:gui.none)
call s:hi("NonText",       s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Special",       s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("SpecialKey",    s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Character",     s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Statement",     s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Function",      s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("PreProc",       s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Identifier",    s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Constant",      s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Boolean",       s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("String",        s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Delimiter",     s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Title",         s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("VertSplit",     s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Type",          s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Number",        s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Comment",       s:gui.comment, s:gui.none,      s:gui.none)
call s:hi("Folded",        s:gui.comment, s:gui.none,      s:gui.none)
call s:hi("EndOfBuffer",   s:gui.comment, s:gui.none,      s:gui.none)
call s:hi("Todo",          s:gui.comment, s:gui.none,      s:gui.none)
call s:hi("Linear",        s:gui.comment, s:gui.none,      s:gui.none)
call s:hi("CursorLineNR",  s:gui.comment, s:gui.none,      s:gui.none)
call s:hi("CursorLine",    s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Error",         s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("ErrorMsg",      s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("WarningMsg",    s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Matchparen",    s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("IncSearch",     s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Search",        s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Visual",        s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Cursor",        s:gui.bg,      s:gui.fg,        s:gui.none)
call s:hi("Pmenu",         s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Pmenusel",      s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Pmenusbar",     s:gui.none,    s:gui.none,      s:gui.none)
call s:hi("Pmenutumb",     s:gui.none,    s:gui.none,      s:gui.none)
