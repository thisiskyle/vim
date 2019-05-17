"-----------------------------------------------------------------------------------------------------------
" Plugin
"-----------------------------------------------------------------------------------------------------------
if has("win32") | call plug#begin('~/vimfiles/plugged')
elseif has("unix") | call plug#begin('~/.vim/plugged')
endif

Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'thisiskyle/todo.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'vimwiki/vimwiki'

call plug#end()

"-----------------------------------------------------------------------------------------------------------
" Options
"-----------------------------------------------------------------------------------------------------------

" ctrlp
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

" todo.vim
let g:todo_file_extensions = ['vim']

" vim wiki
let g:edi_wiki = {'path': '~\mystuff\IT\wiki\edi', 'path_html': '~\mystuff\IT\edi_documentation' }
let g:default_wiki = {'path': '~\vimfiles\wiki\', 'path_html': '~\vimfiles\wiki\html' }
let g:vimwiki_list = [default_wiki, edi_wiki]


" commenter
let g:comment_types = { }
let g:comment_types['vim'] =    "\""
let g:comment_types['python'] = "#"
let g:comment_types['cpp'] =    "//"
let g:comment_types['cs'] =     "//"
let g:comment_types['h'] =      "//"
let g:comment_types['js'] =     "//"

"-----------------------------------------------------------------------------------------------------------
" Mappings
"-----------------------------------------------------------------------------------------------------------

" insert mode
inoremap {<cr>            {<cr>}<esc>O

" normal mode
nnoremap <c-n>            :w<cr>:bn<cr>
nnoremap <c-b>            :w<cr>:bp<cr>
nnoremap <leader><leader> :call OpenVimrc()<cr>
nnoremap <leader>c        :execute "!ctags -R * " . getcwd()<cr>
nnoremap <leader>n        :e ~/.notes<cr>
nnoremap <leader>cd       :cd %:p:h<cr>:pwd<cr>
nnoremap <c-k>            :call ToggleComment()<cr>
nnoremap <leader>cd       :cd %:p:h<cr>:pwd<cr
nnoremap <leader>j        :%!python -m json.tool<cr

" visual mode
vnoremap <c-k>            :call ToggleComment()<cr>

"-----------------------------------------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------------------------------------

if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=60
    set columns=120
    set lazyredraw
    set cursorline
    if has("win32") | set guifont=Consolas:h10
    elseif has("unix") | set guifont=Consolas\ 10
    endif
else
    syntax off
endif

set nobackup
set nowritebackup
set noswapfile
set noundofile
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set shiftwidth=4
set autoindent
set expandtab
set belloff=all
set laststatus=0
set autoread
set ff=unix
set tags+=./tags;
set rulerformat=%50(%m%r\ %#MatchParen#%{gitbranch#name()}\ %#Normal#%l,%c%)
filetype plugin indent on

color simple

"-----------------------------------------------------------------------------------------------------------
" Functions
"-----------------------------------------------------------------------------------------------------------

" Open the config.vim file the 
function! OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction


" Toggle comments
function! ToggleComment()
    let save_pos = getpos(".")
    let cstr = g:comment_types[&ft] 
    normal ^

    " check to see if the line has a comment
    let i = 0
    let check = 0
    while i < len(cstr)
        if getline('.')[col('.')-(i+1)] == cstr[i]
            let check = 1
        else 
            let check = 0
        endif
        let i += 1
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
        " add a comment string
        :execute "normal i" . cstr
        call setpos(".", save_pos)
        let i = 0
        while i < len(cstr)
            normal l
            let i += 1
        endwhile
    endif
endfunction
