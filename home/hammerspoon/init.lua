-- native osx notification basic
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    -- hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send():release()
-- end)

local hammerspoon = os.getenv("HOME") .. "/.hammerspoon/"

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

Install:andUse("Seal",
               {
                 hotkeys = { show = { {"alt"}, "space"} },
                 fn = function(s)
                   s:loadPlugins({"apps", "calc"})
                   s:refreshAllCommands()
                 end,
                 start = true,
               }
)

-- require all lua files in home dir
for file in hs.fs.dir(hammerspoon) do
    if file ~= "init.lua" and file:sub(-4) == ".lua" then
        -- require(file:sub(0,-4))
        require(file:sub(0,-5))
    end
end


function reload(showReloadMessage)
    hs.settings.set("showReloadMessage", showReloadMessage)
    print(hs.settings.get("showReloadMessage"))
    hs.reload()
end

-- reload hammerspoon config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if (doReload) then
        reload(true)
    end
end

hs.pathwatcher.new(hammerspoon, reloadConfig):start()
if (hs.settings.get("showReloadMessage") == true) then
    hs.alert.show("Hammerspoon Config Loaded")
end
hs.settings.set("showReloadMessage", true)

hs.window.animationDuration = 0
hs.hints.showTitleThresh = 8

function appWindowToUnit(app, windowContains, unit)
    if nil ~= app then
        local windows = app:allWindows()
        for i,window in pairs(windows) do
            if (string.find(window:title(), windowContains)) then
                window:moveToUnit(unit)
            end
        end
    end
end

function layoutFourK()
    local fourK = "31MU97"
    local leftHalf = { x = 0, y = 0, w = 0.5, h = 1}
    local upperRight = { x = 0.5, y = 0, w = 0.5, h = 0.65}
    local bottomRight = { x = 0.5, y = 0.65, w = 0.5, h = 0.35}
    local middle = { x = 0.25, y = 0.25, w = 0.5, h = 0.5}


    local fourKLayout = {
        {"Spotify", nil, fourK, middle, nil, nil},
        {"kitty", nil, fourK, bottomRight, nil, nil},
        {"Slack", nil, fourK, middle, nil, nil},
        {"Emacs", nil, fourK, upperRight, nil, nil},
        {"Vivaldi", nil, fourK, leftHalf, nil, nil},
    }

    hs.layout.apply(fourKLayout)

    local chromeWindows = hs.appfinder.appFromWindowTitlePattern("Developer Tools*")
    appWindowToUnit(chromeWindows, "Developer Tools", bottomRight)

    local sublimeWindows = hs.appfinder.appFromName("Sublime Text")
    appWindowToUnit(sublimeWindows, "AutomatedTesting", upperRight)
end

function focusedWindowToLaptop()
    hs.window.focusedWindow():moveToScreen("Built%-in Retina Display")
    screenFull()
end

function focusedWindowTo4k()
    hs.window.focusedWindow():moveToScreen("31MU97", true, true)
    screenTopLeft()
    screenCenter()
end

function goToBrowser()
    local browser = "Vivaldi"
    hs.application.launchOrFocus(browser)
    hs.mouse.setAbsolutePosition({ x=2500, y=500 })

end

-- bind ALL THE KEYS
keyBindings = {
    ["cmd alt ctrl"] = {
        -- spectacle like move window to top half of the screen
        { key = "Up", fn = screenTopHalf },
        -- spectacle like move window to bottom half of the screen
        { key = "Down", fn = screenBottomHalf },
        -- make full screen
        { key = "F", fn = screenFull },
        -- spectacle like center - keeps window dimensions and centers on screen
        { key = "C", fn = screenCenter },
        -- clean up layout on the big screen
        { key = "4", fn = layoutFourK },
        -- move focused window to laptop
        { key = "L", fn = focusedWindowToLaptop },
        -- move focused window to 4k
        { key = "K", fn = focusedWindowTo4k },
        { key = "G", fn = goToBrowser },
        { key = "T", fn = function() hs.application.launchOrFocus("Alacritty") end },
        { key = "R", fn = function() reload(true) end },
    },
    ["cmd alt"] = {
        -- spectacle like move window to left half of the screen
        {key = "Left", fn = screenLeftHalf },
        -- spectacle like move window to right half of the screen
        {key = "Right", fn = screenRightHalf }
    },
    ["cmd ctrl"] = {
        -- spectacle like move window to top left quarter of the screen
        { key = "Left", fn = screenTopLeft },
        -- spectacle like move window to top right quarter of the screen
        { key = "Right", fn = screenTopRight }
    },
    ["cmd ctrl shift"] = {
        -- spectacle like move window to bottom left quarter of the screen
        { key = "Left", fn = screenBottomLeft },
        -- spectacle like move window to bottom right quarter of the screen
        { key = "Right", fn = screenBottomRight }
    }
};

for hyperString,modObject in pairs(keyBindings) do
    hyper = hs.fnutils.split(hyperString, " ")
    hs.fnutils.each(modObject, function(keyObject)
        hs.hotkey.bind(hyper, keyObject.key, keyObject.fn)
    end)
end
