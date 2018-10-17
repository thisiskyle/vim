"""""""""""
" Plugins "
"""""""""""
call plug#begin('~/vimfiles/bundle')
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-git'
Plug 'vim-scripts/sokoban.vim'
Plug 'vim-scripts/Nibble'
"Plug 'mattn/flappyvird-vim'
"Plug 'katono/rogue.vim'
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
call plug#end()

""""""""""""
" Settings "
""""""""""""
if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=50
    set columns=110
endif
set guifont=Courier\ Prime\ Code:h10
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab
set belloff=all
set laststatus=0
set encoding=utf-8
set noshowcmd
set rulerformat=%20(%{fugitive#head()}%)
set autochdir
let g:netrw_dirhistmax = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

filetype plugin indent on 

""""""""""""""""
" Key Bindings "
""""""""""""""""
map <F2> :set ruler!<CR>
map <F9> :tabedit<CR>
map <F10> :call ToggleVExplorer()<CR>
map <F11> :e ~/vimfiles/todo.txt<CR>
map <F12> :e ~/vimfiles/custom.vim<CR>
map <C-n> :tabp<CR>
map <C-m> :tabn<CR>
map <C-s> :w<CR>
nnoremap , :bp<CR>
nnoremap . :bn<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""
" Colors "
""""""""""
let g:gruvbox_italic=0 
colors gruvbox 

"""""""""""""
" Functions "
"""""""""""""
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        let cur_win_num = winnr()
        if expl_win_num != -1
            while expl_win_num != cur_win_num
                exec "wincmd w"
                let cur_win_num = winnr()
            endwhile
            close
        endif
        unlet t:expl_buf_num
    else
         Vexplore
         let t:expl_buf_num = bufnr("%")
    endif
endfunction
