--- Global options
------------------
hs.window.animationDuration = 0
hyper = {"ctrl", "alt", "cmd"}


--- Spoons definition
---------------------
hs.loadSpoon("SpoonInstall")

spoon.SpoonInstall:andUse("MiroWindowsManager", {
  -- config = {},
  hotkeys = {
    up = {hyper, "up"},
    right = {hyper, "right"},
    down = {hyper, "down"},
    left = {hyper, "left"},
    fullscreen = {hyper, "f"}
  }
})
spoon.SpoonInstall:andUse("ClipboardTool", {
    disable = true,
    config = {
      config = 40,
      paste_on_select = true,
    },
    hotkeys = {
      toggle_clipboard = {{"cmd", "shift"}, "v"},
    },
    start=true,
})
spoon.SpoonInstall:andUse("WiFiToggle", {
    hotkeys = {
      toggle_wifi = {hyper, "w"}
    }
})
spoon.SpoonInstall:andUse("DeepLTranslate", {
    disable = true,
    hotkeys = {
      translate = {hyper, "t"}
    }
})
spoon.SpoonInstall:andUse("PopupTranslateSelection", {
    hotkeys = {
      translate_en_ru = {hyper, "t"}
    }
})
spoon.SpoonInstall:andUse("BluetoothToggle", {
    hotkeys = {
      toggle_wifi = {hyper, "b"}
    }
})


--- Old modules
---------------
require "modules/keybindings"
require "modules/control_escape"
require "modules/appearance"
-- require "modules/layouts" -- under development

-- Reload config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            hs.reload()
            break
        end
    end
end

hs.pathwatcher.new(os.getenv("HOME") ..
    "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
