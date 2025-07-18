-- configuration for wezterm appearance

local wezterm = require("wezterm")

local module = {}

function module.style(config)
	config.font = wezterm.font("SauceCodePro Nerd Font", { weight = "Regular" })
	config.font_size = 13
	config.color_scheme = "Sonokai (Gogh)"
end

function module.tabs(config)
	config.use_fancy_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = true
end

return module
