local wezterm = require("wezterm")
local config = {}
local act = wezterm.action

local is_windows = function()
	return wezterm.target_triple:find("windows") ~= nil
end

if is_windows() then
	config.default_prog = { "powershell.exe" }
end

-- then finally apply the plugin
-- these are currently the defaults:
wezterm.plugin.require("https://github.com/nekowinston/wezterm-bar").apply_to_config(config, {
  position = "bottom",
  max_width = 32,
  dividers = "slant_right", -- or "slant_left", "arrows", "rounded", false
  indicator = {
    leader = {
      enabled = true,
      off = " ",
      on = " ",
    },
    mode = {
      enabled = true,
      names = {
        resize_mode = "RESIZE",
        copy_mode = "VISUAL",
        search_mode = "SEARCH",
      },
    },
  },
  tabs = {
    numerals = "arabic", -- or "roman"
    pane_count = "superscript", -- or "subscript", false
    brackets = {
      active = { "", ":" },
      inactive = { "", ":" },
    },
  },
  clock = { -- note that this overrides the whole set_right_status
    enabled = true,
    format = "%H:%M", -- use https://wezfurlong.org/wezterm/config/lua/wezterm.time/Time/format.html
  },
})

config.font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true })
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
config.color_scheme = "Catppuccin Mocha"

return config
