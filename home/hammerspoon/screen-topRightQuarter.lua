-- top right quarter
function screenTopRight()
    local win = hs.window.focusedWindow()
    if (nil == win ) then hs.alert.show("no active application window") return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local halfWidth = max.w / 2

    f.x = max.x + halfWidth
    f.y = max.y 
    f.w = halfWidth
    f.h = max.h / 2

    win:setFrame(f)
end