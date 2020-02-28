"=========================================================
" doit.vim syntax file
"=========================================================
syn match doitTag '^\S*\s'
syn match doitMessage '.*' contained
syn match doitFileInfo '\s\a*:\d*$'
syn match doitSeperator '\s|\s'

syn region doitMessageBlock start="|" end="|" transparent contains=doitMessage

let b:current_syntax = "doit"

hi def link doitTag Constant
hi def link doitMessage Normal
hi def link doitFileInfo Comment
hi def link doitSeperator String
