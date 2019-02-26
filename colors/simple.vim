set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="simple"

function! s:HL(group, fg, bg)
  if !empty(a:fg)
      exec 'hi ' . a:group . ' guifg=' . a:fg
  endif
  if !empty(a:bg)
    exec 'hi ' . a:group . ' guibg=' . a:bg
  endif
endfun

"                      FG          BG
call s:HL('Normal', '#d5c4a1', '#3c3836')
call s:HL('Cursor', '#3c3836', '#d5c4a1')
call s:HL('MatchParen', '#d5c4a1', '#7c6f64')
call s:HL('Comment', '#7c6f64', 'NONE')
call s:HL('Todo', '#7c6f64', 'NONE')
call s:HL('LineNr', '#7c6f64', 'NONE')
call s:HL('Visual', '#3c3836', '#d5c4a1')
call s:HL('Search', '#3c3836', '#d5c4a1')
call s:HL('VertSplit', '#3c3836', '#d5c4a1')
call s:HL('EndOfBuffer', '#d5c4a1', 'NONE')

" clear -------------
hi clear Number
hi clear Character
hi clear Statement
hi clear Type
hi clear Function
hi clear PreProc
hi clear Special
hi clear Identifier
hi clear Constant
hi clear Boolean
hi clear String
hi clear Delimiter
hi clear Title
