-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

--Multiplexer (Mux module)
--local mux = wezterm.mux

--SwitchToWorkspace (bind keys to actions)
local act = wezterm.action

-- This is where you actually apply your config choices
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
  --window:gui_window():toggle_fullscreen()
end)
--config.color_scheme = "AdventureTime"
--"tokyonight-storm"
--"Rosé Pine Moon (Gogh)"
--"rose-pine-dawn"
--"GruvboxLight"
config.enable_wayland = false
config.color_scheme = "tokyonight-storm"

-- Font
--config.font = wezterm.font("FiraCode Nerd Font") --[[  {weight="Regular", stretch='Normal', style=Normal})--]]
config.font = wezterm.font_with_fallback {
  'FiraCode Nerd Font',
  'Hack Nerd Font',
  'Noto Color Emoji'
}
config.font_size = 10
--background_image
--[[config.window_background_image = "/home/serzh/Изображения/Wallpapers/alena-aenami-escape-hd.jpeg"
config.window_background_image_hsb = {
	-- Darken the background image by reducing it to 1/3rd
	brightness = 0.2,
	-- You can adjust the hue by scaling its value.
	-- a multiplier of 1.0 leaves the value unchanged.
	hue = 1.0,
	-- You can adjust the saturation also.
	saturation = 1.0,
}]]--

--Window Background Opacity from 0.0 to 1.0
config.window_background_opacity = 1.0

--Tab Bar
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),
	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 12.0,
	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#333333",
	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#333333",
}
config.colors = {
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#575757",
	},
}
-- Spawn a fish shell in login mode

config.default_prog = { "/usr/bin/fish", "-l" }

--Workspaces
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.leader = { key = 'F2', mods = 'NONE', timeout_milliseconds = 2000 }
config.disable_default_key_bindings = true

config.keys = {
  { key = 'p', mods = 'CTRL|SHIFT', action = act.ActivateCommandPalette },
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) },
  { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) },
  { key = 'j', mods = 'SUPER', action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'SUPER', action = act.ActivatePaneDirection 'Up', },
  { key = 'h', mods = 'SUPER|CTRL', action = act.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'SUPER|CTRL', action = act.ActivatePaneDirection 'Right' },
  { key = 'r', mods = 'SUPER|SHIFT', action = act.ReloadConfiguration },
  { key = 'H', mods = 'LEADER', action = act.AdjustPaneSize { 'Left', 5 }, },
  { key = 'J', mods = 'LEADER', action = act.AdjustPaneSize { 'Down', 5 }, },
  { key = 'K', mods = 'LEADER', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'L', mods = 'LEADER', action = act.AdjustPaneSize { 'Right', 5 }, },
  { key = 'X', mods = 'CTRL', action = act.ActivateCopyMode },
  { key = 'UpArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Up', 1 } },
  { key = 'DownArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Down', 1 } },
  { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Left', 1 } },
  { key = 'RightArrow', mods = 'CTRL|SHIFT', action = wezterm.action.AdjustPaneSize { 'Right', 1 } }, { key = '=', mods = 'CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'CTRL', action = act.DecreaseFontSize },
  { key = '0', mods = 'CTRL', action = act.ResetFontSize },
  { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
  { key = 'N', mods = 'SHIFT|CTRL', action = act.SpawnWindow },
  { key = 'k', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to =  'ClipboardAndPrimarySelection' } },
  { key = 'PageUp', mods = 'CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'PageDown', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'V', mods = 'SUPER|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = '|', mods = 'SUPER|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'h', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Left', },
  { key = 'l', mods = 'SUPER|SHIFT', action = act.ActivatePaneDirection 'Right', },
  { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = false } },
  { key = 'x', mods = 'SUPER', action = act.CloseCurrentPane{ confirm = false } },
  { key = 'b', mods = 'LEADER|CTRL', action = act.SendString '\x02', },
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'k', mods = 'CTRL|ALT', action = act.Multiple
    {
      act.ClearScrollback 'ScrollbackAndViewport',
      act.SendKey { key = 'L', mods = 'CTRL' }
    }
  },
  { key = 'r', mods = 'LEADER', action = act.ActivateKeyTable { name = 'resize_pane', one_shot = false, }, },

  -- Switch to the default workspace
  {
    key = 'y',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'home',
    },
  },
  -- Switch to a monitoring workspace, which will have `top` launched into it
  {
    key = 'u',
    mods = 'CTRL|SHIFT',
    action = act.SwitchToWorkspace {
      name = 'monitoring',
      spawn = {
        args = { 'btop' },
      },
    },
  },
  -- Create a new workspace with a random name and switch to it
  { key = 'i', mods = 'CTRL|SHIFT', action = act.SwitchToWorkspace },
-- Prompt for a name to use for a new workspace and switch to it.
  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
  -- Show the launcher in fuzzy selection mode and have it list all workspaces
  -- and allow activating one.
  {
    key = '9',
    mods = 'ALT',
    action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' },
  },
  { key = 'n', mods = 'LEADER', action = act.SwitchWorkspaceRelative(1) },
  { key = 'p', mods = 'LEADER', action = act.SwitchWorkspaceRelative(-1) },
  { key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher },
  { key = 'f', mods = 'SUPER|SHIFT', action = wezterm.action.ToggleFullScreen, },
}

--Additional settings
config.use_dead_keys = false
config.scrollback_lines = 5000

-- and finally, return the configuration to wezterm
return config
