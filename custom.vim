
execute pathogen#infect()

"settings
set guioptions -=m
set guioptions -=T
set guioptions -=r
set guioptions -=L
set guifont=Courier\ Prime\ Code:h10
set lines=50
set columns=120
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab
set belloff=all
set noshowmode
set laststatus=2

"keymaps
map <F12> :e ~/vimfiles/custom.vim<CR>
map <F11> :tabedit<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :w<CR>

"colorscheme
colorscheme zenburn
highlight Cursor guifg=black guibg=#e2b900
highlight iCursor guifg=black guibg=#e2b900
hi Search guibg=white guifg=black

"statusline
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = { 
            \ 'enable': { 'tabline': 1 },
            \ 'colorscheme': 'one', 
            \ 'active': { 'left': [[ 'mode', 'paste' ], [ 'gitbranch', 'filename', 'modified' ]] },
            \ 'component_function': { 'gitbranch': 'fugitive#head' },
            \ }


