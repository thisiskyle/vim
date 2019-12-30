"=========================================
" plugin/todo.vim
"=========================================
" Variables 
"=========================================
if !exists('g:todo_output_filename')
    let g:todo_output_filename = 'todo' 
endif

if !exists('g:todo_split_h')
    let g:todo_split_h = 15 
endif

if !exists('g:todo_search_path')
    let g:todo_search_path = "./"
endif

" Change the identifier character. Default is '@'
if !exists('g:todo_identifier')
    let g:todo_identifier = "@"
endif

" This will change how accurate the filepath is in todo.txt. See :h filename-modifiers
if !exists('g:todo_filename_modifier')
    let g:todo_filename_modifier = ":p:."
endif


if !exists('g:todo_recursive')
    let g:todo_recursive = 1
endif

let s:default_extensions = ["cs", "js", "cpp", "py", "vim"]

if !exists('g:todo_file_extensions')
    let g:todo_file_extensions = s:default_extensions
else
    let g:todo_file_extensions += s:default_extensions
endif
"=========================================
" Settings 
"=========================================
set isfname-=:
"=========================================
" Commands 
"=========================================
command Todo :call todo#Todo()
command -nargs=? NewTodo call todo#NewTodo(<q-args>)
