-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Builtin Dark"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 20

config.enable_tab_bar = false

config.window_decorations = "NONE"
config.window_background_opacity = 0.75
config.macos_window_background_blur = 8

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
