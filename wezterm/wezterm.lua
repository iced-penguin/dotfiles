-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- 起動時の設定
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  -- ウィンドウを最大化
  window:gui_window():maximize()
end)

-- color
-- based on Nord. cf. https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/wezterm/nord.toml
config.color_schemes = {
  ['nord_like'] = {
    foreground    = "#d8dee9",
    background    = "#2e3440",
    cursor_bg     = "#eceff4",
    cursor_border = "#eceff4",
    cursor_fg     = "#282828",
    selection_bg  = "#eceff4",
    selection_fg  = "#4c566a",
    ansi = {
      "#3b4252",
      "#bf616a",
      "#a3be8c",
      "#ebcb8b",
      "#81a1c1",
      "#b48ead",
      "#88c0d0",
      "#e5e9f0",
    },
    brights = {
      "#A7A7A7", -- modified: brighter comment
      "#bf616a",
      "#a3be8c",
      "#ebcb8b",
      "#81a1c1",
      "#b48ead",
      "#8fbcbb",
      "#eceff4",
    },
  },
}
config.color_scheme = 'nord_like'
config.window_background_opacity = 0.93

-- font
config.font = wezterm.font("Fira Code")
config.font_size = 14.0

-- and finally, return the configuration to wezterm
return config
