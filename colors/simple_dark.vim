hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="simple_dark"

if !exists("g:simple_style")
    let g:simple_style="normal"
endif

let s:gui = {}
let s:gui.gray =    {'normal':''}
let s:gui.gray1 =   {'normal':''}
let s:gui.gray2 =   {'normal':''}
let s:gui.gray3 =   {'normal':''}
let s:gui.white =   {'normal':''}
let s:gui.black =   {'normal':''}
let s:gui.red =     {'normal':'#FB4934',}
let s:gui.green =   {'normal':'#B8BB26',}
let s:gui.yellow =  {'normal':'#FABD2F',}
let s:gui.blue =    {'normal':'#83A598',}
let s:gui.orange =  {'normal':'#FE8019',}
let s:gui.none =    {'normal':'NONE'}

function! s:hi(group, guifg, guibg, guistyle)
    exec "hi " . a:group . " guifg=" . a:guifg[g:simple_style]
    exec "hi " . a:group . " guibg=" . a:guibg[g:simple_style]
    exec "hi " . a:group . " gui=" . a:guistyle[g:simple_style]
endfunction

call s:hi("Normal",       s:gui.gray,   s:gui.bg,   s:gui.none)
call s:hi("NonText",      s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Special",      s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("SpecialKey",   s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Character",    s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Statement",    s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Function",     s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("PreProc",      s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Identifier",   s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Constant",     s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Boolean",      s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("String",       s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Delimiter",    s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Title",        s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("VertSplit",    s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Type",         s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Number",       s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Comment",      s:gui.gray2,  s:gui.none, s:gui.none)
call s:hi("Delimiter",    s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Folded",       s:gui.gray2,  s:gui.none, s:gui.none)
call s:hi("EndOfBuffer",  s:gui.gray2,  s:gui.none, s:gui.none)
call s:hi("Todo",         s:gui.gray2,  s:gui.none, s:gui.none)
call s:hi("Linear",       s:gui.gray2,  s:gui.none, s:gui.none)
call s:hi("CursorLineNR", s:gui.gray2,  s:gui.none, s:gui.none)
call s:hi("CursorLine",   s:gui.none,   s:gui.bg3,  s:gui.none)
call s:hi("CursorColumn", s:gui.none,   s:gui.bg3,  s:gui.none)
call s:hi("Error",        s:gui.red,    s:gui.none, s:gui.none)
call s:hi("ErrorMsg",     s:gui.red,    s:gui.none, s:gui.none)
call s:hi("WarningMsg",   s:gui.yellow, s:gui.none, s:gui.none)
call s:hi("Matchparen",   s:gui.yellow, s:gui.none, s:gui.none)
call s:hi("IncSearch",    s:gui.red,    s:gui.none, s:gui.none)
call s:hi("Search",       s:gui.red,    s:gui.none, s:gui.none)
call s:hi("Visual",       s:gui.orange, s:gui.none, s:gui.none)
call s:hi("Cursor",       s:gui.bg,     s:gui.gray, s:gui.none)
call s:hi("Pmenu",        s:gui.gray,   s:gui.bg3,  s:gui.none)
call s:hi("Pmenusel",     s:gui.red,    s:gui.bg3,  s:gui.none)
call s:hi("Pmenusbar",    s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("PmenuThumb",   s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("Underlined",   s:gui.gray,   s:gui.none, s:gui.none)
call s:hi("WildMenu",     s:gui.red,    s:gui.bg3,  s:gui.none)
call s:hi("StatusLine",   s:gui.none,   s:gui.bg3,  s:gui.none)
call s:hi("Function",     s:gui.gray,   s:gui.bg,   s:gui.none)
