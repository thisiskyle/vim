"=========================================
" plugin/doit.vim
"=========================================
" Variables 
"=========================================
if !exists('g:doit_output_filename')
    let g:doit_output_filename = 'todo' 
endif

if !exists('g:doit_split_h')
    let g:doit_split_h = 15 
endif

if !exists('g:doit_search_path')
    let g:doit_search_path = "./"
endif

" Change the identifier character. Default is '@'
if !exists('g:doit_identifier')
    let g:doit_identifier = "@"
endif

" This will change how accurate the filepath is in todo.txt. See :h filename-modifiers
if !exists('g:doit_filename_modifier')
    let g:doit_filename_modifier = ":p:."
endif


if !exists('g:doit_recursive')
    let g:doit_recursive = 1
endif

let s:default_extensions = ["cs", "js", "cpp", "py", "vim"]

if !exists('g:doit_file_extensions')
    let g:doit_file_extensions = s:default_extensions
else
    let g:doit_file_extensions += s:default_extensions
endif
"=========================================
" Settings 
"=========================================
set isfname-=:
"=========================================
" Commands 
"=========================================
command Doit :call doit#Doit()
command DoitFresh :call doit#DoitFresh()
command -nargs=? NewTodo call doit#NewTodo(<q-args>)

nnoremap <c-m> :call doit#OpenSelectedFile()<cr>
