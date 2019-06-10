-- Different keybindings

local function check_number(x)
  if tonumber(x) ~= nil then
    return x
  else
    return string.lower(x)
  end
end

local function keyCode(key, mods, callback)
    mods = mods or {}
    key = check_number(key)
    callback = callback or function() end
    return function()
        hs.eventtap.event.newKeyEvent(mods, key, true):post()
        hs.timer.usleep(1000)
        hs.eventtap.event.newKeyEvent(mods, key, false):post()
        callback()
    end
end

local function remapKey(mods, key, keyCode)
    hs.hotkey.bind(mods, key, keyCode, nil, keyCode)
end

remapKey({"ctrl"}, "m", keyCode("return"))
remapKey({"ctrl"}, "'", keyCode(42, "shift")) -- "|" aka pipe
remapKey({"alt"}, "h", keyCode("left"))
remapKey({"alt"}, "j", keyCode("down"))
remapKey({"alt"}, "k", keyCode("up"))
remapKey({"alt"}, "l", keyCode("right"))
