-- Complements mac OS's default Readline bindings

hs.hotkey.bind({"alt"}, 'f', function()-- {{{2
    hs.eventtap.keyStroke({"alt"}, "Right")
end)-- }}}2

hs.hotkey.bind({"alt"}, 'b', function()-- {{{2
    hs.eventtap.keyStroke({"alt"}, "Left")
end)-- }}}2
