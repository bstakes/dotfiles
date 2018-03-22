-- move window to top half of screen
function screenTopHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y 
    f.w = max.w 
    f.h = max.h / 2

    win:setFrame(f)
end