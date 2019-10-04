source $VIMRUNTIME/defaults.vim
if has("win32") | source ~/vimfiles/config.vim
elseif has("unix") | source ~/.vim/config.vim
endif
