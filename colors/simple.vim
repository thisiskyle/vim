if exists("syntax_on") | syntax reset | endif

hi clear

let g:colors_name="simple"

" background       #32302f
" dark background  #282828
" main text        #d5c4a1
" alt text         #7c6f64
" red              #fb4934
" green            #b8bb26
" yellow           #fabd2f
" blue             #83a598
" orange           #fe8019


"                      GUIFG          GUIBG          Decoration
hi Normal              guifg=#ffffff  guibg=#282828  gui=NONE
hi NonText             guifg=#ffffff  guibg=NONE     gui=NONE
hi Special             guifg=#ffffff  guibg=NONE     gui=NONE
hi SpecialKey          guifg=#ffffff  guibg=NONE     gui=NONE
hi Number              guifg=#ffffff  guibg=NONE     gui=NONE
hi Character           guifg=#ffffff  guibg=NONE     gui=NONE
hi Statement           guifg=#ffffff  guibg=NONE     gui=NONE
hi Type                guifg=#ffffff  guibg=NONE     gui=NONE
hi Function            guifg=#ffffff  guibg=NONE     gui=NONE
hi PreProc             guifg=#ffffff  guibg=NONE     gui=NONE
hi Statementpecial     guifg=#ffffff  guibg=NONE     gui=NONE
hi Identifier          guifg=#ffffff  guibg=NONE     gui=NONE
hi Constant            guifg=#ffffff  guibg=NONE     gui=NONE
hi Boolean             guifg=#ffffff  guibg=NONE     gui=NONE
hi String              guifg=#ffffff  guibg=NONE     gui=NONE
hi Delimiter           guifg=#ffffff  guibg=NONE     gui=NONE
hi Title               guifg=#ffffff  guibg=NONE     gui=NONE
hi VertSplit           guifg=#ffffff  guibg=NONE     gui=NONE
hi Error               guifg=#fb4934  guibg=NONE     gui=NONE
hi ErrorgMsg           guifg=#fb4934  guibg=NONE     gui=NONE
hi warningmsg          guifg=#fe8019  guibg=NONE     gui=NONE
hi matchparen          guifg=#fb4934  guibg=NONE     gui=NONE
hi RulerGitBranch      guifg=#fb4934  guibg=NONE     gui=NONE
hi IncSearch           guifg=#b8bb26  guibg=NONE     gui=NONE
hi Search              guifg=#b8bb26  guibg=NONE     gui=NONE
hi Visual              guifg=#282828  guibg=#ffffff  gui=NONE
hi cursor              guifg=#32302f  guibg=#ffffff  gui=NONE
hi pmenu               guifg=#32302f  guibg=#ffffff  gui=NONE
hi pmenusel            guifg=#b8bb26  guibg=#ffffff  gui=NONE
hi pmenusbar           guifg=NONE     guibg=NONE     gui=NONE
hi pmenutumb           guifg=NONE     guibg=NONE     gui=NONE
hi comment             guifg=#7c6f64  guibg=NONE     gui=italic
hi folded              guifg=#7c6f64  guibg=NONE     gui=NONE
hi endofbuffer         guifg=#7c6f64  guibg=NONE     gui=NONE
hi todo                guifg=#7c6f64  guibg=NONE     gui=NONE
hi linenr              guifg=#7c6f64  guibg=NONE     gui=NONE
hi CursorLineNR        guifg=#7c6f64  guibg=#32302f  gui=NONE
hi CursorLine          guifg=NONE     guibg=#32302f  gui=NONE

