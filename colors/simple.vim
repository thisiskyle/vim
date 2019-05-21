set background=dark
if exists("syntax_on") | syntax reset | endif
hi clear

let g:colors_name="simple"

" background       #32302f
" dark background  #282828
" red higlights    #fb4934
" text             #d5c4a1
" text2            #7c6f64
" green            #b8bb26
" yellow           #fabd2f
" blue             #83a598
" orange           #fe8019


"                      GUIFG          GUIBG          Decoration
hi Normal              guifg=#d5c4a1  guibg=#32302f  gui=NONE

hi NonText             guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Special             guifg=#d5c4a1  guibg=NONE     gui=NONE
hi SpecialKey          guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Number              guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Character           guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Statement           guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Type                guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Function            guifg=#d5c4a1  guibg=NONE     gui=NONE
hi PreProc             guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Statementpecial     guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Identifier          guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Constant            guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Boolean             guifg=#d5c4a1  guibg=NONE     gui=NONE
hi String              guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Delimiter           guifg=#d5c4a1  guibg=NONE     gui=NONE
hi Title               guifg=#d5c4a1  guibg=NONE     gui=NONE
hi VertSplit           guifg=#d5c4a1  guibg=NONE     gui=NONE

hi Error               guifg=#fb4934  guibg=NONE     gui=NONE
hi ErrorgMsg           guifg=#fb4934  guibg=NONE     gui=NONE

hi Visual              guifg=#83a598  guibg=NONE     gui=NONE
hi Search              guifg=#83a598  guibg=NONE     gui=NONE
hi IncSearch           guifg=#83a598  guibg=NONE     gui=NONE

hi MatchParen          guifg=#fe8019  guibg=NONE     gui=NONE
hi WarningMsg          guifg=#fe8019  guibg=NONE     gui=NONE

hi Cursor              guifg=#32302f  guibg=#d5c4a1  gui=NONE
hi Pmenu               guifg=#32302f  guibg=#d5c4a1  gui=NONE
 
hi PmenuSel            guifg=#d5c4a1  guibg=#7c6f64  gui=NONE
hi PmenuSbar           guifg=#d5c4a1  guibg=#32302f  gui=NONE
hi PmenuTumb           guifg=#d5c4a1  guibg=#32302f  gui=NONE

hi Comment             guifg=#7c6f64  guibg=NONE     gui=NONE
hi Folded              guifg=#7c6f64  guibg=NONE     gui=NONE
hi EndofBuffer         guifg=#7c6f64  guibg=NONE     gui=NONE
hi Todo                guifg=#7c6f64  guibg=NONE     gui=NONE
hi LineNr              guifg=#7c6f64  guibg=NONE     gui=NONE

hi CursorLine          guifg=#7c6f64  guibg=#282828  gui=NONE
hi CursorLineNR        guifg=#7c6f64  guibg=#282828  gui=NONE

hi RulerGitBranch      guifg=#b8bb26  guibg=NONE     gui=NONE
