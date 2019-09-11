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
Plug 'itchyny/vim-gitbranch'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
call plug#end()
"-----------------------------------------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------------------------------------
if has("gui_running")
    set guioptions =''
    set lines=60
    set columns=160
endif
set incsearch
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
set ff=unix
set tags=tags;/
set rulerformat=%50(%m%r\ %#GitBranch#%{gitbranch#name()}\ %#Normal#%l,%c%)
filetype plugin indent on
"-----------------------------------------------------------------------------------------------------------
" Colors
"-----------------------------------------------------------------------------------------------------------
color gruvbox
hi GitBranch guifg=#fb4934
hi Todo gui=italic guifg=#928374
"-----------------------------------------------------------------------------------------------------------
" Options
"-----------------------------------------------------------------------------------------------------------
" todo.vim
let g:todo_file_extensions = ['vim']
" Toggle Comments
let g:comment_types = {'vim':"\"", 'python':"#", 'default':"//",}
" vimwiki
let g:default = {'path': '~\vimwiki', 'syntax': 'markdown', 'ext': '.md'}
let g:match3 = {'path': 'S:\dev\match3\docs', 'syntax': 'markdown', 'ext': '.md'}
let g:krumit = {'path': 'C:\Users\kylee\OneDrive\Desktop\krumit_notes', 'syntax': 'markdown', 'ext': '.md'}
let g:vimwiki_list = [g:default, g:match3]
"-----------------------------------------------------------------------------------------------------------
" Mappings
"-----------------------------------------------------------------------------------------------------------
" insert mode
inoremap {<cr>            {<cr>}<esc>O
" normal mode
nnoremap <c-n>            :w<cr>:bn<cr>
nnoremap <c-b>            :w<cr>:bp<cr>
nnoremap <c-k>            :call ToggleComment()<cr>
nnoremap <leader><leader> :execute ":e" . g:vimhome . "config.vim"<cr>
nnoremap <leader>ct       :execute "!ctags -R * " . getcwd()<cr>
nnoremap <leader>cd       :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>n        :e ~/.notes<cr>
" visual mode
vnoremap <c-k>            :call ToggleComment()<cr>
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
