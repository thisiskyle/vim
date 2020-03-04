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
    :set filetype=doit
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

fun! doit#OpenSelectedFile()
    try
        let line = getline('.')
        let reg = '\(\S\+\):\(\d\+\)$'
        let matches = matchlist(line, reg)
        :echo matches[0]
        execute ":e " . matches[1]
        execute ":" . matches[2]
        " @@todo i will probably need to create a syntax file for the hotkey +doit #feature
    catch
    endtry
endfun

fun! SearchFile(file)
    "let regex_line = s:GetRegexCommentString(a:file) . '\((\w\{-})\)'
    let regex_line = s:GetRegexCommentString(a:file) . " " . g:doit_identifier

    let regex_status = g:doit_identifier . '\S\+'
    let regex_context = '+\S\+'
    let regex_tag = '#\S\+'

    try
        let lines = readfile(a:file)
        let line_num = 1

        for line in lines
            if(match(line, regex_line) > -1)
                let templine = line
                let temp = ""
                let statusString = ""
                let contextString = ""
                let tagString = ""
                let matches = matchlist(line, regex_line)

                " add priority we dont really need this anymore?
                " keeping it for later maybe?
                "let priority = matches[1]
                
                call substitute(line, regex_status, '\=add(status, submatch(0))', 'g')
                call substitute(line, regex_context, '\=add(context, submatch(0))', 'g')
                call substitute(line, regex_tag, '\=add(tags, submatch(0))', 'g')

                " add status
                for s in status
                    let statusString = statusString . s
                    let templine = substitute(templine, " " . s, "", 'g')
                endfor

                " add context
                for c in context
                    let contextString = contextString . " " . c
                    let templine = substitute(templine, " " . c, "", 'g')
                endfor

                " add tags
                for t in tags
                    let tagString = tagString . " " . t
                    let templine = substitute(templine, " " . t, "", 'g')
                endfor

                " remove the comment string
                let templine = substitute(templine, s:GetRegexCommentString(a:file), "", 'g')
                let statusString = substitute(statusString, g:doit_identifier, "", 'g')

                " build file info
                let fileinfo = fnamemodify(a:file, g:doit_filename_modifier) . ":" . line_num

                " build output string 
                let temp = statusString . " |" . templine . " |" . contextString . tagString . " | " . fileinfo

                call add(s:output, temp)
            endif
            let line_num = line_num + 1
        endfor
    catch
    endtry
endfun

fun! ClearCache()
    let s:output = []
endfun
