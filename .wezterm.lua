local wezterm = require("wezterm")
local act = wezterm.action

local DEFAULT_FG = { Color = '#9a9eab' }
local DEFAULT_BG = { Color = '#333333' }

local SPACE_1 = ' '
local SPACE_3 = '   '

local HEADER_KEY_NORMAL = { Foreground = DEFAULT_FG, Text = '' }
local HEADER_LEADER = { Foreground = { Color = '#ffffff' }, Text = '' }
local HEADER_IME = { Foreground = DEFAULT_FG, Text = 'あ' }

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

local function AddIcon(elems, icon)
  table.insert(elems, { Foreground = icon.Foreground })
  table.insert(elems, { Background = DEFAULT_BG })
  table.insert(elems, { Text = SPACE_1 .. icon.Text .. SPACE_3 })
end

local function GetKeyboard(elems, window)
  if window:leader_is_active() then
    AddIcon(elems, HEADER_LEADER)
    return
  end

  AddIcon(elems, window:composition_status() and HEADER_IME or HEADER_KEY_NORMAL)
end

local function LeftUpdate(window, pane)
  local elems = {}
  GetKeyboard(elems, window)
  window:set_left_status(wezterm.format(elems))
end

wezterm.on("update-status", function(window, pane)
  LeftUpdate(window, pane)
end)

return {
  font = wezterm.font_with_fallback({
    { family = "Cica", weight = "Regular", style = "Normal" },
    { family = "Cica", weight = "Bold", style = "Normal" },
    { family = "0xProto", weight = "Regular", style = "Normal" },
  }),
  font_size = 12.0,
  color_scheme = "Catppuccin Mocha",
  initial_cols = 170,
  initial_rows = 50,
  status_update_interval = 1000,

  use_fancy_tab_bar = false,

  window_background_opacity = 0.8,
  macos_window_background_blur = 20,

  -- Key configuration
  leader = { key = "s", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "\\", mods = "LEADER", action = act.SplitPane({ direction = "Right", size = { Percent = 50 } }) },
    { key = "-", mods = "LEADER", action = act.SplitPane({ direction = "Down", size = { Percent = 50 } }) },
    { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  },
}
