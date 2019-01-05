local macbook_monitor = "Color LCD"

local work_layout= {
  {"Chat", nil, macbook_monitor, hs.layout.right50, nil, nil},
}

hs.hotkey.bind(hyper, '1', function()
  hs.application.launchOrFocus('Chat')

  hs.layout.apply(work_layout)
end)
