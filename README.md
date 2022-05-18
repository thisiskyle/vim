## A Simple Vim Pack

This is my vim setup. It uses vim's native package manager and doesn't use a .vimrc

You can use ```:h packages``` in vim to read more about the native package manager.


---
### What's Included

These are just some simple plugins I made to learn vimscript and make my life a little easier. 
Most of these features are done better with other plugins but I felt the full plugins 
were always overkill. So I came up with these.

* [config][1] - This contains all the general settings you would normally find in a ```.vimrc```
* [elyk][2] - colorscheme
* [packer][3] - WIP, simple plugin installer
* [replace_all][4] - shortcut for simple string replacement in the current buffer
* [rulers_rule][5] - formats the ruler (and statusline for splits)
* [toggle_comments][6] - toggles comments, filetypes are limited but more can easily be added

[1]: https://github.com/thisiskyle/ke-vim-pack/tree/master/start/config
[2]: https://github.com/thisiskyle/ke-vim-pack/tree/master/start/elyk
[3]: https://github.com/thisiskyle/ke-vim-pack/tree/master/start/packer
[4]: https://github.com/thisiskyle/ke-vim-pack/tree/master/start/replace_all
[5]: https://github.com/thisiskyle/ke-vim-pack/tree/master/start/rulers_rule
[6]: https://github.com/thisiskyle/ke-vim-pack/tree/master/start/toggle_comments

You can use ```config.vim``` as a reference to see how I use these plugins.


---
### Start Installation

By default this package installs using the ```~/.vim/pack/ke-vim-pack/start``` folder.
This will load everything in ```start``` when you start vim. 


* Clone the package 

        git clone https://github.com/thisiskyle/ke-vim-pack.git ~/.vim/pack/ke-vim-pack




---
### Opt Installation

If you don't want everything, for example, you may want to skip ```config``` if you have compatibility issues with your .vimrc,
you can use this installation method.


* Clone the package 

        git clone https://github.com/thisiskyle/ke-vim-pack.git ~/.vim/pack/ke-vim-pack


* Change the start folder: ```~/.vim/pack/ke-vim-pack/start``` to ```~/.vim/pack/ke-vim-pack/opt```


* In your .vimrc add desired packages individually like this

        packadd config
        packadd replace_all
        packadd rulers_rule
