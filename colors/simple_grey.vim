hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="simple_grey"

if !exists("g:simple_style")
    let g:simple_style='normal'
endif

let s:gui = {}
let s:gui.grey =    {'normal':'#EEEEEE',}
let s:gui.grey1 =   {'normal':'#CCCCCC',}
let s:gui.grey2 =   {'normal':'#999999',}
let s:gui.grey3 =   {'normal':'#666666',}
let s:gui.grey4 =   {'normal':'#333333',}
let s:gui.grey5 =   {'normal':'#222222',}
let s:gui.grey6 =   {'normal':'#111111',}
let s:gui.black =   {'normal':'#000000',}
let s:gui.white =   {'normal':'#FFFFFF',}
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

call s:hi("Normal", s:gui.grey2, s:gui.grey5, s:gui.none)
call s:hi("NonText", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Special", s:gui.none, s:gui.none, s:gui.none)
call s:hi("SpecialKey", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Character", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Statement", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Function", s:gui.none, s:gui.none, s:gui.none)
call s:hi("PreProc", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Identifier", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Constant", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Boolean", s:gui.none, s:gui.none, s:gui.none)
call s:hi("String", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Delimiter", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Title", s:gui.none, s:gui.none, s:gui.none)
call s:hi("VertSplit", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Type", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Number", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Delimiter", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Comment", s:gui.grey4, s:gui.none, s:gui.none)
call s:hi("Folded", s:gui.grey3, s:gui.none, s:gui.none)
call s:hi("EndOfBuffer", s:gui.grey3, s:gui.none, s:gui.none)
call s:hi("Todo", s:gui.grey3, s:gui.none, s:gui.none)
call s:hi("Linear", s:gui.grey3, s:gui.none, s:gui.none)
call s:hi("CursorLineNR", s:gui.grey3, s:gui.none, s:gui.none)
call s:hi("CursorLine", s:gui.none, s:gui.none, s:gui.none)
call s:hi("CursorColumn", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Error", s:gui.red, s:gui.none, s:gui.none)
call s:hi("ErrorMsg", s:gui.red, s:gui.none, s:gui.none)
call s:hi("WarningMsg", s:gui.yellow, s:gui.none, s:gui.none)
call s:hi("Matchparen", s:gui.orange, s:gui.none, s:gui.none)
call s:hi("IncSearch", s:gui.red, s:gui.none, s:gui.none)
call s:hi("Search", s:gui.red, s:gui.none, s:gui.none)
call s:hi("WildMenu", s:gui.red, s:gui.none, s:gui.none)
call s:hi("Visual", s:gui.orange, s:gui.none, s:gui.none)
call s:hi("Cursor", s:gui.black, s:gui.white,  s:gui.none)
call s:hi("Pmenu", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Pmenusel", s:gui.red, s:gui.none, s:gui.none)
call s:hi("Pmenusbar", s:gui.none, s:gui.none, s:gui.none)
call s:hi("PmenuThumb", s:gui.none, s:gui.none, s:gui.none)
call s:hi("Underlined", s:gui.none, s:gui.none, s:gui.none)
call s:hi("StatusLine", s:gui.none, s:gui.none, s:gui.none)
call s:hi("GitBranch", s:gui.red, s:gui.none, s:gui.none)
