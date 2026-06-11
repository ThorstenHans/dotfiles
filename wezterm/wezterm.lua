local wezterm = require("wezterm")

local mux = wezterm.mux
local action = wezterm.action

local config = {}

-- Fonts
config.font = wezterm.font({
	family = "JetBrainsMono Nerd Font",
	weight = "Regular",
})
config.font_size = 22

-- Command Palette
config.command_palette_bg_color = "#24283b"
config.command_palette_fg_color = "#c0caf5"
config.command_palette_font_size = 20
config.command_palette_rows = 20

-- Cursor
config.cursor_blink_rate = 250
config.cursor_blink_ease_in = "Linear"
config.default_cursor_style = "BlinkingBar"

-- Appearance & Colors
config.color_scheme = "Tokyo Night Storm"
config.macos_window_background_blur = 1
config.enable_tab_bar = false
config.use_fancy_tab_bar = true
config.inactive_pane_hsb = {
	saturation = 0.5,
	brightness = 0.6,
}
config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Regular" }),
	font_size = 14,
	active_titlebar_bg = "#24283b",
	inactive_titlebar_bg = "#24283b",
}
config.colors = {
	tab_bar = {
		active_tab = {
			bg_color = "#24283b",
			fg_color = "#7aa2f7",
		},
		inactive_tab = {
			bg_color = "#24283b",
			fg_color = "#c0caf5",
		},
		inactive_tab_hover = {
			bg_color = "#c0caf5",
			fg_color = "#24283b",
		},
		new_tab = {
			bg_color = "#7aa2f7",
			fg_color = "#24283b",
		},
		new_tab_hover = {
			bg_color = "#24283b",
			fg_color = "#7aa2f7",
		},
		inactive_tab_edge = "#24283b",
	},
}
config.window_padding = {
	left = 50,
	right = 50,
	top = 25,
	bottom = 25,
}
config.window_decorations = "RESIZE"

-- Default Dimensions
config.initial_rows = 40
config.initial_cols = 130
config.window_background_opacity = 0.93

-- wezterm events
-- wezterm.on("gui-startup", function(cmd)
--	local _, _, window = mux.spawn_window(cmd or {})
--	window:gui_window():toggle_fullscreen()
-- end)

-- Misc
config.window_close_confirmation = "NeverPrompt"
config.max_fps = 120

-- Key Bindings
config.keys = {
	{
		key = "p",
		mods = "CMD|SHIFT",
		action = action.ActivateCommandPalette,
	},
	{
		key = "DownArrow",
		mods = "CMD|SHIFT",
		action = action.ToggleFullScreen,
	},
	{
		key = "=",
		mods = "CMD|SHIFT",
		action = action.ResetFontSize,
	},
}
return config
