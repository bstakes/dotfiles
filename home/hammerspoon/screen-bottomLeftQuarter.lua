-- bottom left quarter
function screenBottomLeft()
    local win = hs.window.focusedWindow()
    if (nil == win ) then hs.alert.show("no active application window") return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local halfHeight = max.h / 2

    f.x = max.x
    f.y = max.y + halfHeight
    f.w = max.w / 2
    f.h = halfHeight

    win:setFrame(f)
end