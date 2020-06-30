hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="simple_mat"

if !exists("g:simple_style")
    let g:simple_style="normal"
endif

let s:gui = {}
let s:gui.fg =      {'normal':'#ECEFF1',}
let s:gui.bg =      {'normal':'#263238',}
let s:gui.bg2 =     {'normal':'#263238',}
let s:gui.bg3 =     {'normal':'#455a64',}
let s:gui.comment = {'normal':'#5D818E',}
let s:gui.red =     {'normal':'#ef5350',}
let s:gui.green =   {'normal':'#43a047',}
let s:gui.yellow =  {'normal':'#fdd835',}
let s:gui.blue =    {'normal':'#2196f3',}
let s:gui.orange =  {'normal':'#ef6c00',}
let s:gui.none =    {'normal':'NONE',   }

function! s:hi(group, guifg, guibg, guistyle)
    exec "hi " . a:group . " guifg=" . a:guifg[g:simple_style]
    exec "hi " . a:group . " guibg=" . a:guibg[g:simple_style]
    exec "hi " . a:group . " gui=" . a:guistyle[g:simple_style]
endfunction

call s:hi("Normal",       s:gui.fg,      s:gui.bg,   s:gui.none)
call s:hi("NonText",      s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Special",      s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("SpecialKey",   s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Character",    s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Statement",    s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Function",     s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("PreProc",      s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Identifier",   s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Constant",     s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Boolean",      s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("String",       s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Delimiter",    s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Title",        s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("VertSplit",    s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Type",         s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Number",       s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Comment",      s:gui.comment, s:gui.none, s:gui.none)
call s:hi("Delimiter",    s:gui.fg,      s:gui.none, s:gui.none)
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
call s:hi("Matchparen",   s:gui.yellow,  s:gui.none, s:gui.none)
call s:hi("IncSearch",    s:gui.red,     s:gui.none, s:gui.none)
call s:hi("Search",       s:gui.red,     s:gui.none, s:gui.none)
call s:hi("Visual",       s:gui.orange,  s:gui.none, s:gui.none)
call s:hi("Cursor",       s:gui.bg,      s:gui.fg,   s:gui.none)
call s:hi("Pmenu",        s:gui.fg,      s:gui.bg3,  s:gui.none)
call s:hi("Pmenusel",     s:gui.red,     s:gui.bg3,  s:gui.none)
call s:hi("Pmenusbar",    s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("PmenuThumb",   s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("Underlined",   s:gui.fg,      s:gui.none, s:gui.none)
call s:hi("WildMenu",     s:gui.red,     s:gui.bg3,  s:gui.none)
call s:hi("StatusLine",   s:gui.none,    s:gui.bg3,  s:gui.none)
call s:hi("Function",     s:gui.fg,      s:gui.bg,   s:gui.none)
