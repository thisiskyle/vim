
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

"colors
let g:gruvbox_italic=0
colors gruvbox

"statusline
let g:lightline = { 
            \ 'enable': { 'tabline': 1 },
            \
            \ 'colorscheme': 'gruvbox', 
            \
            \ 'active': { 
            \        'left': [[ 'mode', 'paste' ], [ 'gitbranch'], [ 'filepath', 'modified' ]],
            \        'right': [[ 'lineinfo' ], [ 'percent' ], [ 'filetype' ]]
            \ },
            \
            \ 'component_function': { 
            \        'gitbranch': 'fugitive#head',
            \        'filepath': 'GetFilePath',
            \ },
            \ }

function! GetFilePath()
    return expand('%:p')
endfunction

