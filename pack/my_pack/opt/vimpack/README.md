## VimPack

Super simple and super incomplete package manager. Really is more of just a wrapper for 
cloning git repos from a list.


### Setup

Set ```g:vimpack_list```

```
let g:vimpack_list = [ "https://github.com/sheerun/vim-polyglot" ]
```

Optional: Set ```g:vimpack_path``` the default location is used in the example below
This is where plugins are cloned to

```
let g:vimpack_path = "~/.vim/pack/vimpack/start/"
```


### Commands

VimPackInstall

VimPackUpdate

VimPackClean


