# Kyle's Vim Pack

This pack utilizes vim8's built in package manager and requires not vimrc at all. 
All my changes that you would normally find in a .vimrc are located in the ```pack/ke-vim-pack/config/plugin/config.vim```
All the other plugins are basically just little helper functions that I use to make some tasks easier.



## Full Installation


Windows

```
git clone https://github.com/thisiskyle/ke-vim-pack.git ~/vimfiles/pack/ke-vim-pack
```


Linux

```
git clone https://github.com/thisiskyle/ke-vim-pack.git ~/.vim/pack/ke-vim-pack
```


## Opt-Installation

If you think my setup sucks but want to try some of the plugins that come with, you can do that too.
Vim's package manager allows you to use ```:packadd``` to load plugins when you want, instead of on start
Simply follow the full install instructions but change the folder from ```pack/ke-vim-pack/start``` to ```pack/ke-vim-pack/opt```


In your vimrc, you can add specific packages like this

```
packadd config
packadd nightswatch
packadd rulers_rule
```


