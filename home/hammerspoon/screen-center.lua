-- screen center - keeps window dimensions and centers it on the screen
function screenCenter()
    local win = hs.window.focusedWindow()
    if (nil == win ) then hs.alert.show("no active application window") return end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = (max.w - f.w) / 2
    f.y = (max.h - f.h) / 2

    win:setFrame(f)
end