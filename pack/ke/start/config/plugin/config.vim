if has("unix")
    let g:vimhome = '~/.vim/'
else
    let g:vimhome = '~/vimfiles/'
endif

" ---------------------[ Plugin ]---------------------



" ---------------------[ settings ]---------------------

if has("gui_running")
    set guioptions ='' 
    set lines=40 
    set columns=120
endif

exec "set viewdir=" . g:vimhome . "tmp//"

filetype plugin indent on
set incsearch 
set hlsearch 
set autoindent 
set expandtab 
set tabstop=4 
set shiftwidth=4
set tags=./tags,tags;$HOME
set noswapfile 
set nobackup 
set belloff=all 
set laststatus=0 
set background=dark 
set scrolloff=0 
set t_Co=256

color nightswatch

" ---------------------[ Ruler Formatting ]---------------------

set rulerformat=%60(%=%m\ %#RulerBranch#%t%#Normal#\ %l:%c%)

" makes the status line look like my ruler
set statusline=%=%#StatusNormal#%m\ %t%#StatusNormal#\ %l:%c\  

" since window splits force a status line, this makes splits look nice 
set fillchars=stl:-,stlnc:-,vert:\|,fold:-,diff:- 


" ---------------------[ General Key Bindings ]---------------------

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l


" ---------------------[ General Commands ]---------------------

command Config :execute ":e" . g:vimhome . "config.vim"
command Todo noautocmd vimgrep /TODO\c/j **/* | copen

" ---------------------[ Auto Commands ]---------------------

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" --------------------[ Toggle Comment Plugin ]---------------------

nnoremap <c-n> :call ToggleComment()<cr>
vnoremap <c-n> :call ToggleComment()<cr>

let g:comment_delimiters = {}
let g:comment_delimiters.default ="//"
let g:comment_delimiters.vim = "\""
let g:comment_delimiters.python = "#"
let g:comment_delimiters.sh = "#"
let g:comment_delimiters.gdscript3 = "#"


" adds a comment string at the beginning of current line unless the line is empty
function! ToggleComment()
    " skip line if empty
    if strlen(getline('.')) <= 0 
        return 
    endif
    " save position
    let save_pos = getpos(".")
    " get the comment string
    if has_key(g:comment_delimiters, &ft) 
        let cstr = g:comment_delimiters[&ft]
    else 
        let cstr = g:comment_delimiters["default"] 
    endif
    " jump to first character in line
    normal ^
    " check to see if the line has a comment
    let a = col(".") - 1
    if getline(".")[a : a + (strlen(cstr) - 1)] == cstr
        " remove the comment string
        :execute "normal " . strlen(cstr) . "x"
        call setpos(".", save_pos)
        :execute "normal " . strlen(cstr) . "h"
    else 
        " add a comment string
        :execute "normal i" . cstr
        call setpos(".", save_pos)
        :execute "normal " . strlen(cstr) . "l"
    endif
endfunction


" ---------------------[ Replace All Plugin ]---------------------
" This plugin is a shortcut for :%s/<word>/<replacement>/g/

nnoremap <leader>r :silent call ReplaceAll(expand("<cword>"))<cr>
vnoremap <leader>r :<C-U>silent call ReplaceAll(GetVisualSelection())<cr>

function! ReplaceAll(str)
    let save_pos = getpos(".")
    :execute "%s/" . a:str . "/" . input("Replace [" . a:str . "] with: ") . "/g"
    call setpos(".", save_pos)
endfunction

" returns the selected text from visual mode
function! GetVisualSelection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction


" --------------------[ Session Loading ]---------------------

command -nargs=1 Mks call MakeSession(<f-args>)
command -nargs=1 Lds call LoadSession(<f-args>)

function! MakeSession(name)
    execute ":mks! " . s:vimhome . "tmp/" . a:name . ".session"
endfunction

function! LoadSession(name)
    execute ":so " . s:vimhome . "tmp/" . a:name . ".session"
    :color nightswatch
endfunction
