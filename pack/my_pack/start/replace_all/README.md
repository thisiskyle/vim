## Replace All

Function that is basically just a shortcut for ```:%s/word/replace/g```



### Usage

To use, add something like this to your vimrc:

```
nnoremap <silent> <leader>r :call replace_all#ReplaceAll()<cr>
vnoremap <silent> <leader>r :<C-U> call replace_all#ReplaceAllVis()<cr>
```
