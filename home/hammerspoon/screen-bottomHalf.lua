-- move window to top bottom of screen
function screenBottomHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local halfH = max.h / 2

    f.x = max.x
    f.y = max.y + halfH
    f.w = max.w 
    f.h = halfH

    win:setFrame(f)
end