hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="simple_gruv"

if !exists("g:simple_style")
    let g:simple_style='normal'
endif

let s:gui = {}
let s:gui.fg =      {'normal':'#bdae93',}
let s:gui.fg1 =     {'normal':'#ebdbb2',}
let s:gui.bg =      {'normal':'#282828',}
let s:gui.bg1 =     {'normal':'#32302f',}
let s:gui.bg2 =     {'normal':'#3c3836',}
let s:gui.bg3 =     {'normal':'#1d2021',}
let s:gui.comment = {'normal':'#504945',}
let s:gui.red =     {'normal':'#FB4934',}
let s:gui.green =   {'normal':'#B8BB26',}
let s:gui.yellow =  {'normal':'#FABD2F',}
let s:gui.blue =    {'normal':'#83A598',}
let s:gui.orange =  {'normal':'#FE8019',}
let s:gui.none =    {'normal':'NONE',   }

function! s:hi(group, guifg, guibg, guistyle)
    exec "hi " . a:group . " guifg=" . a:guifg[g:simple_style]
    exec "hi " . a:group . " guibg=" . a:guibg[g:simple_style]
    exec "hi " . a:group . " gui=" . a:guistyle[g:simple_style]
endfunction

call s:hi("Normal",       s:gui.fg1,     s:gui.bg1,  s:gui.none)
call s:hi("NonText",      s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Special",      s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("SpecialKey",   s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Character",    s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Statement",    s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Function",     s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("PreProc",      s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Identifier",   s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Constant",     s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Boolean",      s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("String",       s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Delimiter",    s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Title",        s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("VertSplit",    s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Type",         s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Number",       s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Delimiter",    s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Comment",      s:gui.comment, s:gui.none, s:gui.none)
call s:hi("Folded",       s:gui.comment, s:gui.none, s:gui.none)
call s:hi("EndOfBuffer",  s:gui.comment, s:gui.none, s:gui.none)
call s:hi("Todo",         s:gui.comment, s:gui.none, s:gui.none)
call s:hi("Linear",       s:gui.comment, s:gui.none, s:gui.none)
call s:hi("CursorLineNR", s:gui.comment, s:gui.none, s:gui.none)
call s:hi("CursorLine",   s:gui.none,    s:gui.bg3,  s:gui.none)
call s:hi("CursorColumn", s:gui.none,    s:gui.bg3,  s:gui.none)
call s:hi("Error",        s:gui.red,     s:gui.none, s:gui.none)
call s:hi("ErrorMsg",     s:gui.red,     s:gui.none, s:gui.none)
call s:hi("WarningMsg",   s:gui.yellow,  s:gui.none, s:gui.none)
call s:hi("Matchparen",   s:gui.orange,  s:gui.none, s:gui.none)
call s:hi("IncSearch",    s:gui.red,     s:gui.none, s:gui.none)
call s:hi("Search",       s:gui.red,     s:gui.none, s:gui.none)
call s:hi("WildMenu",     s:gui.red,     s:gui.bg3,  s:gui.none)
call s:hi("Visual",       s:gui.orange,  s:gui.none, s:gui.none)
call s:hi("Cursor",       s:gui.bg1,     s:gui.fg,   s:gui.none)
call s:hi("Pmenu",        s:gui.fg1,     s:gui.bg3,  s:gui.none)
call s:hi("Pmenusel",     s:gui.red,     s:gui.bg3,  s:gui.none)
call s:hi("Pmenusbar",    s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("PmenuThumb",   s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("Underlined",   s:gui.fg1,     s:gui.none, s:gui.none)
call s:hi("StatusLine",   s:gui.none,    s:gui.bg3,  s:gui.none)
