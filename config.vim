source $VIMRUNTIME/defaults.vim



" plugins ----------------------------------------------------------------
if has("win32") | call plug#begin('~/vimfiles/bundle')
elseif has("unix") | call plug#begin('~/.vim/bundle')
endif
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
call plug#end()





" settings ---------------------------------------------------------------
if has("gui_running")
    set guioptions -=m "turn off the menu
    set guioptions -=T "turn off the toolbar
    set guioptions -=r "turn off the right hand toolbar
    set guioptions -=L "turn off the left toolbar
    set lines=60 
    set columns=115
    if has("win32") | set guifont=Courier\ Prime\ Code:h10
    elseif has("unix") | set guifont=Courier\ Prime\ Code\ 10
    endif
endif

set bg=dark
set lazyredraw
set incsearch
set nohlsearch
set nobackup
set nowritebackup
set noswapfile
set noundofile
set tabstop=4
set autoindent
set shiftwidth=4
set expandtab
set belloff=all
set laststatus=0
set noshowcmd
set autochdir
set autoread
set ignorecase
set tags+=./docs/tags;
set smartcase
if exists('+fixeol') | set nofixeol | endif
filetype on
filetype plugin on
filetype indent on

" vim wiki 
let wiki1 = {'path':'~\vimfiles\wiki\default', 'path_html':'~\vimfiles\wiki\default\html'}
let wiki2 = {'path':'~\wiki\work', 'path_html':'~\wiki\work\html'}
let g:vimwiki_list = [wiki1, wiki2]

" ctrlp
let g:ctrlp_extensions = [ 'tag' ]
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1




" mappings  ---------------------------------------------------------------
inoremap {<CR> {<CR>}<ESC>O

nnoremap <C-b> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <M-k> ddkP
nnoremap <M-j> ddp
nnoremap j gj
nnoremap k gk
nnoremap <C-i> :ToggleComment<CR>
nnoremap <leader><leader> :OpenVimrc<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>2 :set ruler!<CR>




" style  ------------------------------------------------------------
set rulerformat=%40(%m\ %{fugitive#head()}\ \ %l,%c%)
set guicursor+=n-v-c:blinkon0

let g:gruvbox_italic = '0'
let g:gruvbox_bold = '0'
let g:gruvbox_contrast_dark = 'soft'
colors simple 





" custom commands --------------------------------------------------------

" @TODO: create a function for calling ctags and creating a docs/ folder if one does not exist
command RunCtags :call RunCtags()
function! RunCtags()
    if !isdirectory("./docs")
        call mkdir("./docs", "p")
    endif
    !ctags -R *
endfunction


command FormatJSON :call FormatJSON()
function! FormatJSON()
    :%!python -m json.tool
endfunction


command OpenVimrc :call OpenVimrc()
function! OpenVimrc()
    if has("unix") | :e ~/.vim/config.vim
    elseif has("win32") | :e ~/vimfiles/config.vim
    endif
endfunction


command ToggleSyntaxHL :call ToggleSyntaxHL()
function! ToggleSyntaxHL()
    if exists("g:syntax_on") | syntax off
    else | syntax enable
    endif 
endfunction

command ToggleComment :call ToggleComment()
function! ToggleComment()
    let save_pos = getpos(".")
    normal ^
    "vim file
    if (&ft=='vim')
        if getline('.')[col('.')-1] == "\""
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i"
            call setpos(".", save_pos)
            normal l
        endif
    "python
    elseif (&ft=='py')
        if getline('.')[col('.')-1] == "#"
            normal x
            call setpos(".", save_pos)
            normal h
        else
            normal i#
            call setpos(".", save_pos)
            normal l
        endif
    "html & xml
    elseif (&ft=='xml')
        if getline('.')[col('.')-1] == "<" && getline('.')[col('.')] == "!"
            normal 4x$2h3x
            call setpos(".", save_pos)
            normal 4h
        else
            normal i<!--
            normal $a-->
            call setpos(".", save_pos)
            normal 4l
        endif
    "c style
    else
        if getline('.')[col('.')-1] == "/"
            normal xx
            call setpos(".", save_pos)
            normal hh
        else
            normal i//
            call setpos(".", save_pos)
            normal ll
        endif
    endif
endfunction
