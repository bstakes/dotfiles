-- screen center - keeps window dimensions and centers it on the screen
function screenCenter()
    local win = hs.window.focusedWindow()
    if (nil == win ) then hs.alert.show("no active application window") return end

    win:centerOnScreen()
end
