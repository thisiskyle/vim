if has("win32")
    let g:vimhome = '~/vimfiles/'
    set guifont=Courier\ Prime\ Code:h10,Courier\ New:h10,Consolas:h10
elseif has("unix")
    let g:vimhome = '~/.vim/'
    set guifont=Courier\ Prime\ Code\ 10,Courier\ New\ 10,Consolas\ 10
endif
"-----------------------------------------------------------------------------------------------------------
" Plugin
"-----------------------------------------------------------------------------------------------------------
call plug#begin(g:vimhome . 'plugged')
"utility
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/todo.vim'
Plug 'itchyny/vim-gitbranch', {'branch': 'release'}
"colorschemes
Plug 'morhetz/gruvbox'
Plug 'hzchirs/vim-material'
Plug 'sainnhe/gruvbox-material'
"games
Plug 'katono/rogue.vim'
call plug#end()
"-----------------------------------------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------------------------------------
if has("gui_running")
    set guioptions =''
    set lines=60
    set columns=120
endif
set incsearch
set ignorecase
set updatetime=300
set nobackup
set noswapfile
set noundofile
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set autoindent
set belloff=all
set laststatus=0
set tags=tags;/
set rulerformat=%30(%m%r\ %#GitBranch#%{gitbranch#name()}\ %#Normal#%l,%c%)
filetype plugin indent on
"-----------------------------------------------------------------------------------------------------------
" Colors
"-----------------------------------------------------------------------------------------------------------
set background=dark
color vim-material
hi GitBranch guifg=#fb4934
hi Comment gui=NONE
hi Todo gui=NONE guifg=#5D818E guibg=NONE
"-----------------------------------------------------------------------------------------------------------
" Key Bindings
"-----------------------------------------------------------------------------------------------------------
inoremap {<cr> {<cr>}<esc>O

nnoremap <c-n> :w<cr>:bn<cr>
nnoremap <c-b> :w<cr>:bp<cr>

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>d :TODO<cr>
nnoremap <leader>t :NewTODO TODO<cr>
nnoremap <leader>b :NewTODO BUG<cr>

nnoremap <c-m> :call ToggleComment()<cr>
vnoremap <c-m> :call ToggleComment()<cr>
"-----------------------------------------------------------------------------------------------------------
" Commands
"-----------------------------------------------------------------------------------------------------------
command Config :execute ":e" . g:vimhome . "config.vim"
command Notes  :e ~\\.notes.md
command Ctags  :execute "!ctags -R *" . getcwd()
command CD     :cd %:p:h
command Commit :!git add . & git commit & git push
command Status :new | r !git status
command Diff   :new | r !git diff
command Num    :set number!
command Ruler  :set ruler!
"-----------------------------------------------------------------------------------------------------------
" Options
"-----------------------------------------------------------------------------------------------------------
let g:comment_types = {'vim':"\"", 'python':"#", 'default':"//"}

let g:ctrlp_by_filename = 1
let g:ctrl_working_path_mode = 'rc'
"-----------------------------------------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------------------------------------
function! ToggleComment()
    let save_pos = getpos(".")
    if has_key(g:comment_types, &ft)
        let cstr = g:comment_types[&ft]
    else
        let cstr = g:comment_types["default"]
    endif
    normal ^
    " check to see if the line has a comment
    let i = 0
    let check = 0
    while i < strlen(cstr)
        if getline(".")[(col(".") - 1) + i] == cstr[i]
            let check = 1
        else 
            let check = 0
        endif
        let i = i + 1
    endwhile
    if check == 1
        " remove the comment string
        let i = 0
        while i < len(cstr)
            normal x
            let i += 1
        endwhile
        call setpos(".", save_pos)
        let i = 0
        while i < len(cstr)
            normal h
            let i += 1
        endwhile
    else
         "add a comment string
        :execute "normal i" . cstr
        call setpos(".", save_pos)
        let i = 0
        while i < strlen(cstr)
            normal l
            let i += 1
        endwhile
    endif
endfunction
