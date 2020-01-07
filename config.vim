if has("win32")
    let g:vimhome = '~/vimfiles/'
    set guifont=Courier_Prime_Code:h11
elseif has("unix")
    let g:vimhome = '~/.vim/'
endif
"-----------------------------------------------------------------------------------------------------------
" Plugins
"-----------------------------------------------------------------------------------------------------------
call plug#begin(g:vimhome . 'vimplug')
"Plug 'sheerun/vim-polyglot'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'vimwiki/vimwiki'
Plug 'itchyny/vim-gitbranch'
Plug 'morhetz/gruvbox'
call plug#end()
"-----------------------------------------------------------------------------------------------------------
" Settings
"-----------------------------------------------------------------------------------------------------------
" general settings
if has("gui_running") | set guioptions ='' | set lines=60 | set columns=120 | endif
set incsearch hlsearch ignorecase smartcase
set nobackup noswapfile noundofile
set autoindent expandtab tabstop=4 shiftwidth=4
set belloff=all
set laststatus=0
set background=dark
set ff=unix
set tags=doc/tags;/
set path=.,**
set rulerformat=%70(%=%t\ %m%r\ %#Label#%{gitbranch#name()}%#Normal#\ \ %l:%c%)
filetype plugin indent on
" crtlp
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
" todo.vim
let g:todo_output_filename = 'doc/todo'
let g:todo_identifier = '@@'
" custom functions 
let g:window_max = 0
let g:session_dir = g:vimhome . "doc/sessions/"
let g:comment_types = {'vim':"\"", 'python':"#", 'default':"//"}
" gruvbox
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 0
let g:gruvbox_bold = 0
color gruvbox
"-----------------------------------------------------------------------------------------------------------
" Key Bindings
"-----------------------------------------------------------------------------------------------------------
" normal mode
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <leader>t :NewTodo<cr>
nnoremap <leader>r :silent call functions#ReplaceAll()<cr>
nnoremap <c-n> :call functions#ToggleComment()<cr>
" visual mode
vnoremap <c-n> :call functions#ToggleComment()<cr>
"-----------------------------------------------------------------------------------------------------------
" Commands 
"-----------------------------------------------------------------------------------------------------------
command Config :execute ":e" . g:vimhome . "config.vim"
command Notes :execute ":e" . g:vimhome . "doc/notes.md"
command Ctags :execute "!ctags -f doc/tags -R * " . getcwd()
command CD :cd %:p:h
command F call functions#ToggleFullscreen()
command -nargs=? SS call functions#SessionSave(<q-args>)
command -nargs=? SL call functions#SessionLoad(<q-args>)
" auto commands
autocmd Vimresized * wincmd =
