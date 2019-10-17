
hi clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name="simple"

" gruvbox stuff
" background       #32302f
" dark background  #282828
" main text        #d5c4a1
" alt text         #7c6f64
" red              #fb4934
" green            #b8bb26
" yellow           #fabd2f
" blue             #83a598
" orange           #fe8019

let s:gui = {}

if !exists('g:simple_style')
    let g:simple_style='default'
endif

let s:gui.bg      = { 'default':'#263238', 'gruvbox':'#32302f'}
let s:gui.fg      = { 'default':'#ECEFF1', 'gruvbox':'#32302f'}
let s:gui.comment = { 'default':'#5D818E', 'gruvbox':''}
let s:gui.none    = { 'default':'NONE',    'gruvbox':'NONE'}

function! s:hi(group, guifg, guibg, guistyle)
    exec "hi " . a:group . " guifg=" . a:guifg[g:simple_style]
    exec "hi " . a:group . " guibg=" . a:guibg[g:simple_style]
    exec "hi " . a:group . " gui=" . a:guistyle[g:simple_style]
endfunction


call s:hi("Normal",        s:gui.fg,      s:gui.bg,        s:gui.none)
call s:hi("NonText",       s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Special",       s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("SpecialKey",    s:gui.fg,      s:gui.none,      s:gui.none)
call s:hi("Number",        s:gui.comment, s:gui.none,      s:gui.none)
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
call s:hi("Comment",       s:gui.comment, s:gui.none,      s:gui.none)


"hi Error               guifg=#fb4934  guibg=NONE     gui=NONE
"hi ErrorgMsg           guifg=#fb4934  guibg=NONE     gui=NONE
"hi warningmsg          guifg=#fe8019  guibg=NONE     gui=NONE
"hi matchparen          guifg=#fb4934  guibg=NONE     gui=NONE
"hi RulerGitBranch      guifg=#fb4934  guibg=NONE     gui=NONE
"hi IncSearch           guifg=#b8bb26  guibg=NONE     gui=NONE
"hi Search              guifg=#b8bb26  guibg=NONE     gui=NONE
"hi Visual              guifg=#282828  guibg=#ffffff  gui=NONE
"hi cursor              guifg=#32302f  guibg=#ffffff  gui=NONE
"hi pmenu               guifg=#32302f  guibg=#ffffff  gui=NONE
"hi pmenusel            guifg=#b8bb26  guibg=#ffffff  gui=NONE
"hi pmenusbar           guifg=NONE     guibg=NONE     gui=NONE
"hi pmenutumb           guifg=NONE     guibg=NONE     gui=NONE
"hi comment             guifg=#7c6f64  guibg=NONE     gui=italic
"hi folded              guifg=#7c6f64  guibg=NONE     gui=NONE
"hi endofbuffer         guifg=#7c6f64  guibg=NONE     gui=NONE
"hi todo                guifg=#7c6f64  guibg=NONE     gui=NONE
"hi linenr              guifg=#7c6f64  guibg=NONE     gui=NONE
"hi CursorLineNR        guifg=#7c6f64  guibg=#32302f  gui=NONE
"hi CursorLine          guifg=NONE     guibg=#32302f  gui=NONE

