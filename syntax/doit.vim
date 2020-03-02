"=========================================================
" doit.vim syntax file
"=========================================================

syn match doitTag '^\S*\s' 
syn match doitSeparator '|' contained
syn match doitMessage '|.*|'hs=s+2,he=e-2 contains=doitSeparator
syn match doitFileInfo '\S*:\d*$' 

let b:current_syntax = "doit"

hi def link doitTag Statement
hi def link doitMessage Normal
hi def link doitFileInfo Comment
hi def link doitSeparator String
