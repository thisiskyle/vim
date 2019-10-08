if has("win32")
    let g:vimhome = '~/vimfiles/'
    set guifont=Consolas:h10
elseif has("unix")
    let g:vimhome = '~/.vim/'
    set guifont=Consolas\ 10
endif
"-----------------------------------------------------------------------------------------------------------
" Plugin
"-----------------------------------------------------------------------------------------------------------
call plug#begin(g:vimhome . 'plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/todo.vim'
Plug 'itchyny/vim-gitbranch', {'branch': 'release'}
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim'
Plug 'katono/rogue.vim'
call plug#end()
"-----------------------------------------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------------------------------------
if has("gui_running")
    set guioptions =''
    set lines=60
    set columns=120
    set guifont=Consolas:h10
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
color gruvbox
hi GitBranch guifg=#fb4934
hi Todo gui=italic guifg=#928374
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

nnoremap <leader>t :TODO<cr>
nnoremap <leader>n :NewTODO TODO<cr>
nnoremap <leader>b :NewTODO BUG<cr>

nnoremap <c-m> :call ToggleComment()<cr>
vnoremap <c-m> :call ToggleComment()<cr>
"-----------------------------------------------------------------------------------------------------------
" Commands
"-----------------------------------------------------------------------------------------------------------
command Config :call Open('config')
command Notes :call Open('notes')
command Ctags :call Ctags()
command CD :call CdToCurrent()
command Commit :call GitCommitAll()
command Status :call GitStatus()
command Num :set number!
command Ruler :set ruler!
"-----------------------------------------------------------------------------------------------------------
" Options
"-----------------------------------------------------------------------------------------------------------
let g:comment_types = {'vim':"\"", 'python':"#", 'default':"//"}
let g:coc_global_extensions = ['coc-omnisharp']
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

function! Open(mode)
    if a:mode == 'config' 
        :execute ":e" . g:vimhome . "config.vim"
    elseif a:mode == 'notes'
        :execute ":e" . "~\\.notes.md"
    endif
endfunction

function! Ctags()
    :execute "!ctags -R * " . getcwd()
endfunction

function! CdToCurrent()
    :cd %:p:h
    :pwd
endfunction

function! GitCommitAll()
    :execute "new | r !git add . & git commit & git push"
endfunction

function! GitStatus()
    :execute "new | r !git status"
endfunction
