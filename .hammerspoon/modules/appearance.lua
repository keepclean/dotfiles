-- Switch OS Appearance style

function toggleAppearance()
  local cmd = [[
  tell application "System Events"
  tell appearance preferences
  set dark mode to not dark mode
  end tell
  end tell
  ]]
  hs.osascript.applescript(cmd)
end

hs.hotkey.bind(hyper, 'a', function() toggleAppearance() end)
