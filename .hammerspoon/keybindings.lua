-- Different keybindings

local function keyCode(key, mods, callback)
    mods = mods or {}
    callback = callback or function() end
    return function()
        hs.eventtap.event.newKeyEvent(mods, string.lower(key), true):post()
        hs.timer.usleep(1000)
        hs.eventtap.event.newKeyEvent(mods, string.lower(key), false):post()
        callback()
    end
end

local function remapKey(mods, key, keyCode)
    hs.hotkey.bind(mods, key, keyCode, nil, keyCode)
end

remapKey({"ctrl"}, "m", keyCode("return"))
