
""""""""""""""""""""""""""""""""""" pathogen

" install plugins with pathogen
execute pathogen#infect()

""""""""""""""""""""""""""""""""""" settings

if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
endif

set guifont=Courier\ Prime\ Code:h10 "set the font
set lines=50      "opening height
set columns=120   "opening width
set nobackup      "turn off file backups
set nowritebackup "turn off file backup writing
set noswapfile    "turn off swap file creation
set noundofile    "turn off undo file creation
set tabstop=4     "tab length in spaces
set shiftwidth=4  "idk what this does
set expandtab     "idk what this does either
set belloff=all   "turn off the bell
set noshowmode    "turn off the mode text in command area
set laststatus=2  "show status line always

""""""""""""""""""""""""""""""""""" key bindings

map <F12> :e ~/vimfiles/custom.vim<CR>
map <F11> :tabedit<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :w<CR>


""""""""""""""""""""""""""""""""""" colors

let g:gruvbox_italic=0 
colors gruvbox 

"""""""""""""""""""""""""""""""""" statusline stuff

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
