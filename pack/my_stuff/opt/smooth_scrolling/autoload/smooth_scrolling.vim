vim9script

# this function executes the scrolling
export def Smooth_Scroll(dir: string, scrollTime: float, lines: number)
    var deltaTime = float2nr((scrollTime * 1000) / lines)

    for i in range(lines)
        if dir == "d"
            exec "normal! \<C-e>"
        else
            exec "normal! \<C-y>"
        endif
        redraw

        if (deltaTime > 0)
            exec "sleep " .. deltaTime .. "m"
        endif
    endfor
    normal! M
enddef
