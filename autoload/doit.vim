"=========================================
" autoload/doit.vim
"=========================================

let s:output = []

" main function to run doit.vim
fun! doit#Doit()
    if len(s:output) == 0

        if (g:doit_recursive == 1)
            let wildcard = "**"
        else
            let wildcard = "*"
        endif

        let files = globpath(g:doit_search_path, wildcard, 0, 1)

        for file in files
            if (s:CheckFileExtension(file) == 1)
                :echo "Searching " . file
                call SearchFile(file)
                :redraw
            endif 
        endfor
    endif
    call NewBuffer()
    :echo "Done!"
endfun

" @@todo this is a nice test
fun! doit#DoitFresh()
    call ClearCache()
    call doit#Doit()
endfun



" insert a 'todo' line using given tag
fun! doit#NewTodo(tag)

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

    :call setline('.', spaces . s:GetCommentString(bufname('%')) . ' ' . g:doit_identifier . l:tag . l:endspace)
    :startinsert!
endfun


" returns true is file extension is 'supported' in g:doit_file_extensions
fun! s:CheckFileExtension(file)
    for ext in g:doit_file_extensions
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
        let todo_file = readfile(g:doit_output_filename)
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

fun! NewBuffer()
    new
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

    for l in s:output
        call append('$', l)
    endfor
    normal ggdd
    execute "resize " . g:doit_split_h  
    setlocal nomodifiable nomodified
endfun

fun! SearchFile(file)
    if g:doit_identifier == '*' || g:doit_identifier == '.'
        let regex = s:GetRegexCommentString(a:file) . '\s\{-}\' . g:doit_identifier . '\(\w\+\)\s*\s*\(.*\)'
    else
        let regex = s:GetRegexCommentString(a:file) . '\s\{-}'  . g:doit_identifier . '\(\w\+\)\s*\s*\(.*\)'
    endif

    try
        let lines = readfile(a:file)
        let line_num = 1
        for line in lines
            let matches = matchlist(line, regex)
            if (len(matches) > 0) 
                let tag = "[" . matches[1] . "]"
                let fileinfo = " (" . fnamemodify(a:file, g:doit_filename_modifier) . ":" . line_num . ")"
                let temp_line = "" . tag . " " . matches[2] . fileinfo 

                " if there are no duplicates add the new line to the output
                if s:CheckDuplicates(fileinfo) == 0
                    call add(s:output, temp_line)
                endif
            endif
            let line_num = line_num + 1
        endfor
    catch
    endtry
endfun

fun! ClearCache()
    let s:output = []
endfun