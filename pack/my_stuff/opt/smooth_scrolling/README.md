##  Smooth Scrolling

Allows for smooth scrolling in vim


### Usage

Just call the function Smooth_Scroll(direction: string, scrollTime: float, lines: number)

direction: string - "u" for scroll up, "d" for scroll down
scrollTime: float - the time, in seconds, it will take to scroll. This may vary based on computer performance.
lines: number - the number of lines to scroll


### Examples
```
nnoremap <silent> <leader>u :call smooth_scrolling#Smooth_Scroll("u", 0.1, 20)<cr>
nnoremap <silent> <leader>d :call smooth_scrolling#Smooth_Scroll("d", 0.1, 20)<cr>
nnoremap <silent> <leader>b :call smooth_scrolling#Smooth_Scroll("u", 0.1, 50)<cr>
nnoremap <silent> <leader>f :call smooth_scrolling#Smooth_Scroll("d", 0.1, 50)<cr>
```
