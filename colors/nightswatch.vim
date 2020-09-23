
hi clear

if exists("syntax_on")
    syntax reset
endif

" main function for applying highlight groups
function! s:hi(group, guifg, guibg, gui, ctermfg, ctermbg, cterm)
    exec "hi " . a:group . " guifg="   . a:guifg
    exec "hi " . a:group . " guibg="   . a:guibg
    exec "hi " . a:group . " gui="     . a:gui
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
    exec "hi " . a:group . " cterm="   . a:cterm
endfunction


" settings
let g:colors_name="Night's Watch"
let g:nightswatch_italics = 0


" base colors
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
let s:grey234   = '#1c1c1c'
let s:grey235   = '#262626'
let s:grey239   = '#4e4e4e'
let s:grey243   = '#767676'
let s:grey247   = '#9e9e9e'
let s:grey252   = '#d0d0d0'
let s:grey255   = '#eeeeee'
let s:none      = 'NONE'
let s:italic    = 'italic'


" HI Group, GUIFG, GUIBG, GUI, TERMFG, TERMBG, TERM
call s:hi("Normal", s:grey247, s:grey235, s:none, 247, 235, s:none)
call s:hi("NonText", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Special", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("SpecialKey", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Character", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Statement", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Function", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("PreProc", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Identifier", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Constant", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Boolean", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("String", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Delimiter", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Title", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Type", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Number", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("LineNr", s:grey239, s:none, s:none, 239, s:none, s:none)
call s:hi("Comment", s:grey239, s:none, s:none, 239, s:none, s:none)
call s:hi("VertSplit", s:grey239, s:none, s:none, 239, s:none, s:none)
call s:hi("Todo", s:grey239, s:none, s:none, 239, s:none, s:none)
call s:hi("Folded", s:grey239, s:none, s:none, 239, s:none, s:none)
call s:hi("EndOfBuffer",  s:grey239, s:none, s:none, 239, s:none, s:none)
call s:hi("Linear", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("CursorLine", s:none, s:none, s:none, s:none, 234, s:none)
call s:hi("CursorLineNr", s:grey247, s:none, s:none, 247, s:none, s:none)
call s:hi("CursorColumn", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Error", s:red167, s:none, s:none, 167, s:none, s:none)
call s:hi("ErrorMsg", s:red167, s:none, s:none, 167, s:none, s:none)
call s:hi("WarningMsg", s:gold142, s:none, s:none, 142, s:none, s:none)
call s:hi("Matchparen", s:orange130, s:none, s:none, 130, s:none, s:none)
call s:hi("IncSearch", s:red167, s:none, s:none, 167, s:none, s:none)
call s:hi("Search", s:red167, s:none, s:none, 167, s:none, s:none)
call s:hi("Visual", s:grey235, s:grey247, s:none, 16, 247, s:none)
call s:hi("Cursor", s:grey235, s:white15, s:none, 235, 15, s:none)
call s:hi("Pmenu", s:none, s:grey232, s:none, s:none, 232, s:none)
call s:hi("Pmenusel", s:red167, s:grey232, s:none, 167, 232, s:none)
call s:hi("Pmenusbar", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("PmenuThumb", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("Underlined", s:none, s:none, 'underline', s:none, s:none, 'underline')
call s:hi("Wildmenu", s:red167, s:none, s:none, 167, s:none, s:none)
call s:hi("StatusLine", s:grey255, s:grey235, s:none, 255, 235, s:none)
call s:hi("StatusLineNC", s:grey239, s:grey235, s:none, 239, 235, s:none)

" user defined highlight groups
call s:hi("RulerBranch", s:red167, s:none, s:none, 167, s:none, s:none)
call s:hi("RulerFile", s:none, s:none, s:none, s:none, s:none, s:none)
call s:hi("StatusBranch", s:red167, s:grey235, s:none, 167, 235, s:none)
call s:hi("StatusNormal", s:grey247, s:grey235, s:none, 247, 235, s:none)

" settings based highlight groups
if has("gui_running") && g:nightswatch_italics == 1
    call s:hi("Comment", s:grey239, s:none, s:italic, 239, s:none, s:italic)
    call s:hi("Todo", s:grey239, s:none, s:italic, 239, s:none, s:italic)
endif
