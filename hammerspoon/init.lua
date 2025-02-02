local hs = hs --define hs as itself to avoid noisy LSP errors.

HYPER = { "cmd", "alt", "ctrl", "shift" }

-- Config reloading shortcut.
hs.hotkey.bind(HYPER, "R", function()
	hs.reload()
end)
hs.alert.show("Config loaded")

require("window_management")
