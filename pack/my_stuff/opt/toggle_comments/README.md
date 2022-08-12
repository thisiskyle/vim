# Toggle Comments

A very basic function for toggling comments on and off



## Usage

To use, add something like this to your vimrc:

nnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>
vnoremap <silent> <c-n> :call toggle_comments#ToggleComment()<cr>


## Settings 

Use the dictionary ```g:togglecomment_custom_delimiters``` to set your own comment delimiters in your vimrc.  
There are some filetypes set by default, but only a few. Many filetypes are missing. Missing filetypes use "//" by default.

Example:

```
g:togglecomment_custom_delimiters = {
    "c": "//",
    "cpp": "//",
    "vim": "#",
    "python": "#",
    "sh": "#",
}
```

