## VimPack

Super simple and super incomplete package manager. Really is more of just a wrapper for cloning git repos from a list.


### Setup

First set ```g:vimpack_list``` with a list of your packages

```
g:vimpack_list = [ 
    {url: "https://github.com/cool/plugin", load_method: "opt" }
    {url: "https://github.com/another/plugin", load_method: "start" }
]
```


Optional: Set ```g:vimpack_root_path``` the default location is used in the example below. This is where plugins are cloned to

```
g:vimpack_root_path = "~/.vim/pack/vimpack/"
```


### Commands

VimPackInstall

VimPackUpdate

VimPackClean


