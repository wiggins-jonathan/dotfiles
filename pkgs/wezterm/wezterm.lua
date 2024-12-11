local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_padding = {left = 0, right = 0, top = 0, bottom = 0} -- no padding
config.window_decorations = 'NONE'

config.adjust_window_size_when_changing_font_size = false

-- tabs
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- define color scheme
local black   = "#242424"
local blue    = "#0099ff"
local cyan    = "#5ea8a9"
local green   = "#50ff4a"
local magenta = "#ff3399"
local red     = "#be0e50"
local white   = "#ffffff"
local yellow  = "#cc5fa3"
config.color_schemes = {
  ['my_scheme'] = {
    foreground = white,
    background = black,

    -- flip foreground & background when selected
    selection_fg = black,
    selection_bg = white,

    cursor_bg = '#0099ff',
    cursor_fg = '#000000',

    ansi = {
      black,
      red,
      green,
      yellow,
      blue,
      magenta,
      cyan,
      white,
    },
    brights = ansi,

    visual_bell = red,
  }
}
config.color_scheme = 'my_scheme'

config.visual_bell = {
  fade_in_duration_ms = 15,
  fade_out_duration_ms = 15,
}

-- workarounds for https://github.com/wez/wezterm/issues/5382
config.front_end = "WebGpu"
config.enable_wayland = false

return config
