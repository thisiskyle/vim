"=========================================
" autoload/todo.vim
"=========================================


" main function to run todo.vim
fun! todo#Todo()
    let s:output = []

    :echo "Searching files..."

    if (g:todo_recursive == 1)
        let wildcard = "**"
    else
        let wildcard = "*"
    endif

    let files = globpath(g:todo_search_path, wildcard, 0, 1)

    for file in files
        if (s:CheckFileExtension(file) == 1)
            if g:todo_identifier == '*' || g:todo_identifier == '.'
                let regex = s:GetRegexCommentString(file) . '\s\{-}\' . g:todo_identifier . '\(\w\+\)\s*\s*\(.*\)'
            else
                let regex = s:GetRegexCommentString(file) . '\s\{-}'  . g:todo_identifier . '\(\w\+\)\s*\s*\(.*\)'
            endif

            let lines = readfile(file)
            let line_num = 1
            for line in lines
                let matches = matchlist(line, regex)
                if (len(matches) > 0) 
                    let tag = "[" . matches[1] . "]"
                    let fileinfo = " (" . fnamemodify(file, g:todo_filename_modifier) . ":" . line_num . ")"
                    let temp_line = "" . tag . " " . matches[2] . fileinfo 

                    " if there are no duplicates add the new line to the output
                    if s:CheckDuplicates(fileinfo) == 0
                        call add(s:output, temp_line)
                    endif

                endif
                let line_num = line_num + 1
            endfor
        endif 
    endfor
    " @@todo Need to do something about the 'autochdir' setting
    " @@todo add the ability to sort the output ie by filename or tag
    call writefile(s:output, g:todo_output_filename, 'as')
    execute ":sp " . g:todo_output_filename
    execute "resize " . g:todo_split_h  
    :echo "Done!"
endfun


" insert a 'todo' line using given tag
fun! todo#NewTodo(tag)

    if (a:tag == '')
        let l:endspace = ''
    else
        let l:endspace = ' '
    endif

    let l:tag = substitute(a:tag, " ", "-", "g")
    let l:spaces = ''
    let l:char_count = strlen(getline('.'))

    if l:char_count > 0
        normal ^
        let l:indent = col('.')
        normal O
    else
        normal k^
        let l:indent = col('.')
        normal j
    endif

    let l:i = 1
    while l:i < l:indent
        let l:spaces = l:spaces . ' '
        let l:i += 1
    endwhile

    :call setline('.', spaces . s:GetCommentString(bufname('%')) . ' ' . g:todo_identifier . l:tag . l:endspace)
    :startinsert!
endfun


" returns true is file extension is 'supported' in g:todo_file_extensions
fun! s:CheckFileExtension(file)
    for ext in g:todo_file_extensions
        if (fnamemodify(a:file, ":e") == ext)
            return 1
        endif
    endfor
    return 0
endfun


" get the correct comment string based on filetype
fun! s:GetCommentString(file)
    "vim
    if (fnamemodify(a:file, ":e") == 'vim')
        return '"'
    "python
    elseif (fnamemodify(a:file, ":e") == 'py')
        return '#'
    "c style
    else
        return '//'
    endif
endfun

" get the correct comment string based on filetype but for regex
fun! s:GetRegexCommentString(file)
    "vim
    if (fnamemodify(a:file, ":e") == 'vim')
        return '\"'
    "python
    elseif (fnamemodify(a:file, ":e") == 'py')
        return '\#'
    "c style
    else
        return '\/\/'
    endif
endfun

" Check for duplicate lines that are already in todo.txt
fun! s:CheckDuplicates(fileinfo)

    try
        let todo_file = readfile(g:todo_output_filename)
    catch /.*/
        return 0
    endtry

    for todo_line in todo_file
        let todo_line_info = matchstr(todo_line, '\s(.*)')
        if todo_line_info == a:fileinfo
            return 1
        endif
    endfor
    return 0
endfun
