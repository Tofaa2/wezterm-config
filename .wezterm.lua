local wezterm = require 'wezterm'
local config = {}


local is_windows = function()
    return wezterm.target_triple:find("windows") ~= nil
end


if (is_windows()) then
    config.default_prog = { 'powershell.exe' }
end

config.font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })

config.keys = {
    {
        key = 'h',
        mods = 'CTRL',
        action = wezterm.action {
            SplitHorizontal = {
                domain = "CurrentPaneDomain"
            }
        }
    },
    { 
        key = '-',
        mods = 'CTRL',
        action = wezterm.action.DecreaseFontSize
    },
    { 
        key = '+',
        mods = 'CTRL',
        action = wezterm.action.DecreaseFontSize
    },
    {
        key = 'w',
        mods = 'CTRL',
        action = wezterm.action.CloseCurrentTab { confirm = false },
    },
    {
        key = 'w',
        mods = 'CTRL|SHIFT',
        action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    { 
        key = 'n',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.SpawnWindow
    },
    {
        key = 'v',
        mods = 'CTRL',
        action = wezterm.action {
            SplitVertical = {
                domain = "CurrentPaneDomain"
            }
        }
    },
}

config.color_scheme = 'tokyonight-storm'

return config
