set background=dark

hi clear

if exists("syntax_on") | syntax reset | endif

let g:colors_name="simple"

" colors
"fg #d5c4a1
"bg #3c3836
"red #fb4934
"commen #7c6f64t

"                      GUIFG          GUIBG          Decoration
hi Normal              guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi EndofBuffer         guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi NonText             guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Special             guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi SpecialKey          guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Number              guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Character           guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Statement           guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Type                guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Function            guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi PreProc             guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Statementpecial     guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Identifier          guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Constant            guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Boolean             guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi String              guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Delimiter           guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi Title               guifg=#d5c4a1  guibg=#3c3836  gui=NONE

hi Cursor              guifg=#3c3836  guibg=#d5c4a1  gui=NONE
hi Visual              guifg=#3c3836  guibg=#d5c4a1  gui=NONE
hi Search              guifg=#3c3836  guibg=#d5c4a1  gui=NONE
hi VertSplit           guifg=#3c3836  guibg=#d5c4a1  gui=NONE
hi Pmenu               guifg=#3c3836  guibg=#d5c4a1  gui=NONE
 
hi PmenuSel            guifg=#d5c4a1  guibg=#7c6f64  gui=NONE
hi PmenuSbar           guifg=#d5c4a1  guibg=#3c3836  gui=NONE
hi PmenuTumb           guifg=#d5c4a1  guibg=#3c3836  gui=NONE

hi MatchParen          guifg=#fb4934  guibg=NONE     gui=NONE
hi Comment             guifg=#7c6f64  guibg=NONE     gui=NONE
hi Todo                guifg=#7c6f64  guibg=NONE     gui=NONE
hi LineNr              guifg=#7c6f64  guibg=NONE     gui=NONE
