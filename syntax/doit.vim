"=========================================================
" doit.vim syntax file
"=========================================================

syn match doitTag '#\S\+' contained
syn match doitEpic '+\S\+' contained 
syn match doitStatus '^\S\+ |' contains=doitSeparator
syn match doitFileInfo '\S*:\d*$' contained
syn match doitSeparator '|' contained
syn match doitMessage '.*' contains=doitSeparator,doitTag,doitEpic,doitStatus,doitFileInfo

let b:current_syntax = "doit"

hi def link doitTag WarningMsg
hi def link doitEpic Error
hi def link doitStatus Visual
hi def link doitFileInfo Comment
hi def link doitSeparator Comment
