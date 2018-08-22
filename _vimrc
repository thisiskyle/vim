
execute pathogen#infect()

set background=dark
set guioptions -=m
set guioptions -=T
set guioptions -=r
set guioptions -=L
set guifont=Courier\ Prime\ Code:h11
set number
set lines=50
set columns=100
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab

colorscheme material
highlight Cursor guifg=black guibg=#e2b900
highlight iCursor guifg=black guibg=#e2b900

map <F12> :e $MYVIMRC<CR>
map <C-n> :NERDTreeToggle<CR>
