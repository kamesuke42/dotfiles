local wezterm = require "wezterm"

return {
  color_scheme = 'nord',
  font = wezterm.font("HackGen Console NFJ", {weight="Regular", stretch="Normal", style="Normal"}),
  default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' },
  launch_menu = {
    {
      label = 'PowerShell',
      args = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' },
    },
    {
      label = 'Ubuntu - kamesuke42',
      args = { 'wsl.exe', '-d', 'Ubuntu', '-u', 'kamesuke42' },
    },
    {
      label = 'Ubuntu - mistnotfound',
      args = { 'wsl.exe', '-d', 'Ubuntu', '-u', 'mistnotfound' },
    },
  },
  leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = '\\',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action.ShowLauncher,
    },
    { key = 'h', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Left' },
    { key = 'l', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Right' },
    { key = 'k', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Up' },
    { key = 'j', mods = 'LEADER', action = wezterm.action.ActivatePaneDirection 'Down' },
  },
  window_background_opacity = 0.9,
}
