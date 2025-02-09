return {
  'nvim-lualine/lualine.nvim',
  config = function()
  local config = require("lualine")
    config.setup({
      options = { theme  = "eldritch" } -- "gruvbox_light", "material", "eldritch"
    })
  end
}
