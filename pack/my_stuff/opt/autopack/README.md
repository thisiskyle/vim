## AutoPack

Super simple and super incomplete package manager. Really is more of just a wrapper for 
cloning git repos from a list.


### Setup

Set ```g:autopack_list```

```
let g:autopack_list = [ "https://github.com/sheerun/vim-polyglot" ]
```

Optional: Set ```g:autopack_path``` the default location is used in the example below
This is where plugins are cloned to

```
let g:autopack_path = "~/.vim/pack/autopack/start/"
```


### Commands

AutoPackInstall

AutoPackUpdate

AutoPackClean


