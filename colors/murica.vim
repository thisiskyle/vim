set background=dark

hi clear

if exists("syntax_on") | syntax reset | endif

let g:colors_name="murica"

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

hi WarningMsg          guifg=#fb4934  guibg=NONE     gui=NONE
hi ErrorgMsg           guifg=#fb4934  guibg=NONE     gui=NONE

hi Cursor              guifg=#32302f  guibg=#d5c4a1  gui=NONE
hi Visual              guifg=#32302f  guibg=#d5c4a1  gui=NONE
hi Search              guifg=#32302f  guibg=#d5c4a1  gui=NONE
hi Pmenu               guifg=#32302f  guibg=#d5c4a1  gui=NONE
 
hi PmenuSel            guifg=#d5c4a1  guibg=#7c6f64  gui=NONE
hi PmenuSbar           guifg=#d5c4a1  guibg=#32302f  gui=NONE
hi PmenuTumb           guifg=#d5c4a1  guibg=#32302f  gui=NONE

hi Comment             guifg=#7c6f64  guibg=NONE     gui=NONE
hi Folded              guifg=#7c6f64  guibg=NONE     gui=NONE
hi EndofBuffer         guifg=#7c6f64  guibg=NONE     gui=NONE
hi Todo                guifg=#7c6f64  guibg=NONE     gui=NONE
hi LineNr              guifg=#7c6f64  guibg=NONE     gui=NONE

hi MatchParen          guifg=#fb4934  guibg=NONE     gui=NONE

hi CursorLine          guifg=NONE     guibg=#282828  gui=NONE
hi CursorLineNR        guifg=#7c6f64  guibg=#282828  gui=NONE
