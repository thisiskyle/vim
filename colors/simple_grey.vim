hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="Night's Watch"


function! s:hi(group, guifg, guibg, gui, ctermfg, ctermbg, cterm)
    exec "hi " . a:group . " guifg="   . a:guifg
    exec "hi " . a:group . " guibg="   . a:guibg
    exec "hi " . a:group . " gui="     . a:gui
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
    exec "hi " . a:group . " cterm="   . a:cterm
endfunction


" the lower the number the darker the grey
let s:black16   = '#000000'
let s:yellow11  = '#ffff00'
let s:white15   = '#ffffff'
let s:blue26    = '#005fd7'
let s:green28   = '#008700'
let s:orange130 = '#af5f00'
let s:gold142   = '#afaf00'
let s:red167    = '#d75f5f'
let s:grey232   = '#080808'
let s:grey235   = '#262626'
let s:grey239   = '#4e4e4e'
let s:grey243   = '#767676'
let s:grey247   = '#9e9e9e'
let s:grey252   = '#d0d0d0'
let s:grey255   = '#eeeeee'


call s:hi("Normal",       s:grey247, s:grey235, 'NONE', 247,    235,    'NONE')
call s:hi("NonText",      'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Special",      'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("SpecialKey",   'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Character",    'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Statement",    'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Function",     'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("PreProc",      'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Identifier",   'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Constant",     'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Boolean",      'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("String",       'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Delimiter",    'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Title",        'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("VertSplit",    'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Type",         'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Number",       'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Comment",      s:grey239, 'NONE',    'NONE', 239,    'NONE', 'NONE')
call s:hi("Folded",       'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("EndOfBuffer",  'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Todo",         'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Linear",       'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("CursorLineNR", 'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("CursorLine",   'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("CursorColumn", 'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Error",        s:red167,  'NONE',    'NONE', 167,    'NONE', 'NONE')
call s:hi("ErrorMsg",     s:red167,  'NONE',    'NONE', 167,    'NONE', 'NONE')
call s:hi("WarningMsg",   s:gold142, 'NONE',    'NONE', 142,    'NONE', 'NONE')
call s:hi("Matchparen",   'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("IncSearch",    s:red167,  'NONE',    'NONE', 167,    'NONE', 'NONE')
call s:hi("Search",       s:red167,  'NONE',    'NONE', 167,    'NONE', 'NONE')
call s:hi("Wildmenu",     s:red167,  s:black16, 'NONE', 167,    16,     'NONE')
call s:hi("Visual",       s:black16, s:grey247, 'NONE', 16,     247,    'NONE')
call s:hi("Cursor",       s:grey235, s:white15, 'NONE', 235,    15,     'NONE')
call s:hi("Pmenu",        'NONE',    s:black16, 'NONE', 'NONE', 16,     'NONE')
call s:hi("Pmenusel",     s:red167,  s:black16, 'NONE', 167,    16,     'NONE')
call s:hi("Pmenusbar",    'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("PmenuThumb",   'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("Underlined",   'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("StatusLine",   'NONE',    'NONE',    'NONE', 'NONE', 'NONE', 'NONE')
call s:hi("GitBranch",    s:red167,  'NONE',    'NONE', 167,    'NONE', 'NONE')
