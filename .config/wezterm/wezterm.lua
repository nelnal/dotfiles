local wezterm = require 'wezterm';
local act = wezterm.action

keys = {
  -- with leader
  {
    key = 'c',
    mods = 'LEADER',
    action = act.SpawnTab 'DefaultDomain',
  },
  {
    key = 'n',
    mods = 'LEADER',
    action = act.ActivateTabRelative(1),
  },
  {
    key = 'p',
    mods = 'LEADER',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = 'r',
    mods = 'LEADER',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end)
    },
  },
  {
    key = 's',
    mods = 'LEADER',
    action = act.ActivateTabRelative(-1),
  },
  {
    key = '|',
    mods = 'LEADER',
    action = act.SplitHorizontal {},
  },
  {
    key = '-',
    mods = 'LEADER',
    action = act.SplitVertical {},
  },
  {
    key = '#',
    mods = 'LEADER',
    action = act.SplitPane {
      direction = 'Down',
      size = { Cells = 20 },
    },
  },
  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Down',
  },

  -- with leader + CTRL
  {
    key = 'd',
    mods = 'LEADER|CTRL',
    action = act.CloseCurrentTab { confirm = true },
  },
}
for i = 0, 9 do
  table.insert(keys, {
    key = tostring(i),
    mods = 'LEADER',
    action = act.ActivateTab(i),
  })
end

return {
  color_scheme = 'Dark+',
  enable_scroll_bar = true,
  font = wezterm.font('Hack Nerd Font Mono'),
  font_size = 15.0,
  keys = keys,
  leader = {
    key = 't',
    mods = 'CTRL',
  },
  tab_and_split_indices_are_zero_based = true,
  tab_bar_at_bottom = true,
  use_ime = true,
  use_fancy_tab_bar = true,
  window_background_opacity = 0.92,
}