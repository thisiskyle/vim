
" format the ruler to look nice and clean and act as a statusline
set rulerformat=%60(%=%m\ %t\ \ %c,%l%)

" makes the status line look like the ruler. 
" so when we split, each window matches
set statusline=%=%m\ %t\ \ %c,%l\  

" since window splits force a status line, these
" fillchars make split status lines match the ruler
"
" set these in vimrc to change from default
if !exists("g:ruler_fillchars")
    let g:ruler_fillchars = {}
endif

if !exists("g:ruler_fillchars.statusline")
    let g:ruler_fillchars.statusline = "-"
endif

if !exists("g:ruler_fillchars.statuslinenc")
    let g:ruler_fillchars.statuslinenc = "-"
endif

if !exists("g:ruler_fillchars.vertical")
    let g:ruler_fillchars.vertical = "\\|"
endif

if !exists("g:ruler_fillchars.fold")
    let g:ruler_fillchars.fold = "-"
endif

if !exists("g:ruler_fillchars.diff")
    let g:ruler_fillchars.diff = "-"
endif

" statusline, current window
exec ":set fillchars=stl:" . g:ruler_fillchars.statusline
" statusline, not current window
exec ":set fillchars+=stlnc:" . g:ruler_fillchars.statuslinenc
" vertical split character
exec ":set fillchars+=vert:" . g:ruler_fillchars.vertical
" folds
exec ":set fillchars+=fold:" . g:ruler_fillchars.fold
" delete lines of the diff
exec ":set fillchars+=diff:" . g:ruler_fillchars.diff
