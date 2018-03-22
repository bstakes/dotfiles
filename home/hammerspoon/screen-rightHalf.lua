-- spectacle like - move window to right half of screen
function screenRightHalf()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local halfW = max.w / 2

    f.x = max.x + halfW
    f.y = max.y 
    f.w = max.w / 2
    f.h = max.h

    win:setFrame(f)
end