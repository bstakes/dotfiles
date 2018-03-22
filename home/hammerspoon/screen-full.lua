-- full screen
function screenFull()
    local win = hs.window.focusedWindow()
    if (nil == win ) then hs.alert.show("no active application window") return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y 
    f.w = max.w 
    f.h = max.h

    win:setFrame(f)
end