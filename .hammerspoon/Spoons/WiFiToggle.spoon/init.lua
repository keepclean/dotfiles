--- === WiFiToggle ===
---
--- Enable/disable WiFi via keyboard shortcut
---
--- Download: [https://example.com](https://example.com)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "WiFiToggle"
obj.version = "0.1"
obj.author = "Rustam Iuldashev <r.uldashev@gmail.com>"
obj.homepage = "https://keepclean.github.io"
obj.license = "MIT - https://opensource.org/licenses/MIT"

--- WiFiToggle:toggleShow()
--- Method
--- Toggle WiFi adapter
---
function obj:toggleWifi()
  local wifiIsPowered = hs.wifi.interfaceDetails('en0')['power']
  if wifiIsPowered then
    hs.wifi.setPower(false)
    -- hs.alert.show('Wi-Fi Off')
    hs.notify.new({
        autoWithdraw = true,
        setIdImage = hs.configdir .. "/files/wifi-off.png",
        title = utf8.char(0020), -- empty char
        withdrawAfter = 1
    }):send()
  else
    hs.wifi.setPower(true)
    -- hs.alert.show('Wi-Fi On')
    hs.notify.new({
        autoWithdraw = true,
        setIdImage=hs.configdir .. "/files/wifi-on.png",
        title = utf8.char(0020), -- empty char
        withdrawAfter = 1
    }):send()
  end
  local wifiIsPowered = nil
end

--- WiFiToggle:bindHotkeys(mapping)
--- Method
--- Binds hotkeys for WiFiToggle
---
--- Parameters:
---  * mapping - A table containing hotkey objifier/key details for the following items:
---   * toggle_wifi - Enable/disable WiFi
---
function obj:bindHotkeys(mapping)
   local def = {
      toggle_wifi = hs.fnutils.partial(self.toggleWifi, self),
   }
   hs.spoons.bindHotkeysToSpec(def, mapping)
   obj.mapping = mapping
end

return obj
