-- Turn on/off wifi
function toggleWifi()
  local wifiIsPowered = hs.wifi.interfaceDetails('en0')['power']
  if wifiIsPowered then
    hs.wifi.setPower(false)
    hs.alert.show('Wi-Fi Off')
  else
    hs.wifi.setPower(true)
    hs.alert.show('Wi-Fi On')
  end
  local wifiIsPowered = nil
end

hs.hotkey.bind({"cmd", "alt", "ctrl"}, 'w', function() toggleWifi() end)
