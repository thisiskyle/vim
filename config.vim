if has("win32")
    let g:vimhome = '~/vimfiles/'
    set guifont=Courier_Prime_Code:h10
elseif has("unix")
    let g:vimhome = '~/.vim/'
endif
"===============================================================================================================
" plugins
"===============================================================================================================
call plug#begin(g:vimhome . 'plug')
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/itchyny/vim-gitbranch'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://gitlab.com/dbeniamine/todo.txt-vim'
call plug#end()
"===============================================================================================================
" variables
"===============================================================================================================
" crtlp
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
" doit
let g:doit_identifier = '@@'
" my functions
let g:window_max = 0
let g:session_dir = g:vimhome . "tmp/sessions"
let g:comment_types = { 'vim':"\"", 'python':"#", 'cs':"//", 'cpp':"//", 'js':"//", 'default':""}
let s:toppad = 20 
let s:leftpad = 45 
let s:startup_text = 
            \[
            \'     #',
            \'    ###    Hey, listen! ',
            \'   #####',
            \'  #     #        `o´',
            \' ###   ###',
            \'##### #####',
            \]
" gruvbox
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_italic = 0
let g:gruvbox_bold = 0
"===============================================================================================================
" settings
"===============================================================================================================
if has("gui_running") | set guioptions ='' | set lines=60 | set columns=120 | endif
exec "set backupdir=" . g:vimhome . 'tmp/backup/'
exec "set undodir=" . g:vimhome . 'tmp/undo/'
exec "set directory=" . g:vimhome . 'tmp/swap/'
exec "set viewdir=" . g:vimhome . 'tmp/view/'
set incsearch hlsearch ignorecase smartcase
set wrap autoindent expandtab tabstop=4 shiftwidth=4
set belloff=all
set laststatus=0
set background=dark
set tags=doc/tags;/
set cursorline
set rulerformat=%60(%=%m\ %#Label#%{gitbranch#name()}%#Normal#\ %l:%c%)
filetype plugin indent on
color gruvbox
"===============================================================================================================
" key bindings
"===============================================================================================================
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-n> :call ToggleComment()<cr>
vnoremap <c-n> :call ToggleComment()<cr>
nnoremap <leader>r :silent call ReplaceAll()<cr>
nnoremap <leader>t :NewTodo todo<cr>
"===============================================================================================================
" commands 
"===============================================================================================================
command Config :execute ":e" . g:vimhome . "config.vim"
command Notes :execute ":e" . "~/notes.md"
command Ctags :execute "!ctags -f tags -R * " . getcwd()
command CD :cd %:p:h
command F call ToggleFullscreen()
command -nargs=? SS call SessionSave(<q-args>)
command -nargs=? SL call SessionLoad(<q-args>)
"auto commands
autocmd Vimresized * wincmd =
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
autocmd VimEnter * call StartUp()
"===============================================================================================================
" functions 
"===============================================================================================================

" adds a comment string at the beginning of current line
" unless the line is empty
function! ToggleComment()
    " skip line if empty
    if strlen(getline('.')) <= 0
        return
    endif
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

" maximizes the window if you are running gvim
function! ToggleFullscreen()
    if has("gui_running")
        if g:window_max == 0
            let g:window_max = 1
            :sim ~x
        else
            let g:window_max = 0
            :sim ~r
        endif
    endif
endfunction

" shortcut for :%s/<word>/<replacement>/g/
function! ReplaceAll()
    let save_pos = getpos(".")
    let word = expand("<cword>")
    :execute "%s/" . word . "/" . input("Replace [" . word . "] with: ") . "/g"
    call setpos(".", save_pos)
endfunction

" save the current session
function! SessionSave(fname)
    :execute ":mks!" . g:session_dir . a:fname . ".vim"
endfunction

" load a session
function! SessionLoad(fname)
    :execute ":so" . g:session_dir . a:fname . ".vim"
endfunction

function! StartUp()
    " Don't run if: we have commandline arguments, we don't have an empty
    " buffer, if we've not invoked as vim or gvim, or if we'e start in insert mode
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif
    enew
    setlocal 
            \ bufhidden=wipe 
            \ buftype=nofile 
            \ nobuflisted
            \ nocursorcolumn 
            \ nocursorline 
            \ nolist 
            \ nonumber 
            \ noswapfile 
            \ norelativenumber

    let i = 0
    while i < s:toppad
        call append('$', '')
        let i += 1
    endwhile

    syntax match Triforce '#'
    syntax match Navi 'o'
    syntax match Wings '[`´]'
    hi default link Triforce GruvboxYellow
    hi default link Navi GruvboxBlue
    hi default link Wings Normal

    for l in s:startup_text
        let c = 0
        let s = ''
        while c < s:leftpad
            let s = s . ' '
            let c += 1
        endwhile
        call append('$', s . l)
    endfor
    setlocal nomodifiable nomodified
endfunction
