-- MACOS WEZTERM CONFIGURATION

local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.adjust_window_size_when_changing_font_size = false

-- config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

show_new_tab_button_in_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

config.color_scheme = 'Tokyo Night'

config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.font_size = 15.0

config.initial_cols = 120 -- Set the width (number of columns)
config.initial_rows = 35  -- Set the height (number of rows)

config.window_padding = {
  left = 20,
  right = 20,
  top = 30,
  bottom = 30,
}

config.leader = { key = 'b', mods = 'CMD', timeout_milliseconds = 1000 }
config.keys = {
  -- natural text editing
  { mods = "OPT", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "b" }) },
	{ mods = "OPT", key = "RightArrow", action = wezterm.action.SendKey({ mods = "ALT", key = "f" }) },
	{ mods = "CMD", key = "LeftArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "a" }) },
	{ mods = "CMD", key = "RightArrow", action = wezterm.action.SendKey({ mods = "CTRL", key = "e" }) },
	{ mods = "CMD", key = "Backspace", action = wezterm.action.SendKey({ mods = "CTRL", key = "u" }) },

  -- splitting
  {
    mods   = "LEADER",
    key    = "\"",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = "LEADER",
    key    = "%",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = "LEADER",
    key    = "h",
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
  },
  {
    mods   = "LEADER",
    key    = "v",
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
  },
  {
    mods = 'LEADER',
    key = 'z',
    action = wezterm.action.TogglePaneZoomState
  },
  {
    mods = 'ALT',
    key = '.',
    action = wezterm.action{ActivateTabRelative = 1}
  },
  {
    mods = 'ALT',
    key = ',',
    action = wezterm.action{ActivateTabRelative = -1}
  },
  {
    mods = 'ALT|SHIFT',
    key = '<',
    action = wezterm.action{MoveTabRelative = -1}
  },
  {
    mods = 'ALT|SHIFT',
    key = '>',
    action = wezterm.action{MoveTabRelative = 1}
  },
  {
    mods = 'CTRL|CMD',
    key = 'f',
    action = wezterm.action.ToggleFullScreen
  },
  {
    key = 'R',
    mods = 'CMD|SHIFT',
    action = wezterm.action.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 30

return config
