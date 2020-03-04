"=========================================================
" doit.vim syntax file
"=========================================================

syn match doitTag '#\S\+' contained
syn match doitContext '+\S\+' contained 
syn match doitStatus '^\S\+' contained
syn match doitFileInfo '\S*:\d*$' contained
syn match doitSeparator '|' contained
syn match doitMessage '.*' contains=doitSeparator,doitTag,doitContext,doitStatus,doitFileInfo

let b:current_syntax = "doit"

hi def link doitTag Special
hi def link doitContext Constant
hi def link doitStatus Statement
hi def link doitFileInfo Underlined
hi def link doitSeparator Comment
