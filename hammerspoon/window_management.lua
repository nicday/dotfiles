local geometry = require("hs.geometry")

-- Left half
hs.hotkey.bind(HYPER, "Left", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	win:moveToUnit(hs.layout.left50)
end)

-- Maximize window
hs.hotkey.bind(HYPER, "M", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	win:moveToUnit(geometry.rect(0, 0, 1, 1))
end)

-- Right half
hs.hotkey.bind(HYPER, "Right", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	win:moveToUnit(hs.layout.right50)
end)

-- Right 79% accounting for the width of Raycast notes
hs.hotkey.bind(HYPER, "2", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	win:moveToUnit(geometry.rect(0.21, 0, 1, 1))
end)

-- Left 21% (min width of Raycast notes, rounded up to the nearest percent)
hs.hotkey.bind(HYPER, "1", function()
	local win = hs.window.focusedWindow()
	if not win then
		return
	end
	win:moveToUnit(geometry.rect(0, 0, 0.21, 1))
end)
