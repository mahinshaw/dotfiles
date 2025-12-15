local wezterm = require("wezterm")

-- local utilities
local appearance = require("appearance")

-- setup config
local config = wezterm.config_builder()

appearance.style(config)
appearance.tabs(config)

-- keys - https://wezterm.org/config/default-keys.html?h=key
config.keys = {
	{
		key = "Enter",
		mods = "SUPER",
		action = wezterm.action.ToggleFullScreen,
	},
}

config.audible_bell = "Disabled"

return config
