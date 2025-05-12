local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

if is_windows() then
	config.default_prog = { "powershell.exe" }
end

config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
config.window_frame = {
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),
	font_size = 12.0,
	active_titlebar_bg = "#333333",
	inactive_titlebar_bg = "#333333",
}

config.colors = {
	tab_bar = {
		inactive_tab_edge = "#575757",
	},
}

config.keys = {
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action({
			SplitHorizontal = {
				domain = "CurrentPaneDomain",
			},
		}),
	},
	{
		key = "-",
		mods = "ALT",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "+",
		mods = "ALT",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "w",
		mods = "ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "w",
		mods = "ALT|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	{
		key = "v",
		mods = "ALT",
		action = wezterm.action({
			SplitVertical = {
				domain = "CurrentPaneDomain",
			},
		}),
	},
	{
		key = "n",
		mods = "ALT",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "n",
		mods = "SHIFT|ALT",
		action = wezterm.action.ToggleFullScreen,
	},
}
for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = act.ActivateTab(i - 1),
	})
end

config.color_scheme = "tokyonight-storm"

return config
