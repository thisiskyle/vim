# My Simple Vim Pack

This is my vim setup.

## What's Included

These are just some simple plugins I made to learn vimscript and make my life a little easier. 
Most of these features are done better with other plugins but I felt the full plugins 
were always overkill. So I came up with these.

* config - This contains all the general settings you would normally find in a ```.vimrc```
* grayish - My minimal colorscheme
* plug_man - simple plugin installer
* replace_all - shortcut for simple string replacement in the current buffer
* rulers_rule - formats the ruler to act as a statusline
* toggle_comments - toggles comments, filetypes are limited but more can easily be added


## Installation

* Clone the package 

        git clone https://github.com/thisiskyle/ke-vim-pack.git ~/.vim/pack/ke-vim-pack

* In your .vimrc, add packages individually like this

        packadd config
        packadd replace_all
        packadd rulers_rule


You may want to skip ```packadd config``` if you have compatibility issues with your .vimrc


