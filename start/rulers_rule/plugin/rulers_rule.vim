
" format the ruler to look nice and clean and act as a statusline
set rulerformat=%60(%=%m\ %t\ \ %l:%c%)
" makes the status line look like my ruler, so when we split each window matches
set statusline=%=%m\ %t\ %l:%c\  

" since window splits force a status line, this makes splits look nice with the status line
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:- 
