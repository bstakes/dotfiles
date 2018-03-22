-- bottom right quarter
function screenBottomRight()
    local win = hs.window.focusedWindow()
    if (nil == win ) then hs.alert.show("no active application window") return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    local halfWidth = max.w / 2
    local halfHeight = max.h / 2

    f.x = max.x + halfWidth
    f.y = max.y + halfHeight
    f.w = halfWidth
    f.h = halfHeight

    win:setFrame(f)
end