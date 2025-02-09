return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
--      require("tokyonight").setup()
--      vim.cmd[[colorscheme tokyonight-storm]]-- `storm`, `moon`, `night` and `day`
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup()
--      vim.o.background = "light" -- "dark", "light"
--      vim.cmd [[colorscheme gruvbox]]
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    config = function ()
--      require("tokyodark").setup()
--      vim.cmd [[colorscheme tokyodark]]
    end
  },
  {
    "akinsho/horizon.nvim",
    config = function ()
--      require("horizon").setup()
--      vim.cmd [[colorscheme horizon]]
--      vim.o.background = "dark" -- or "light"
    end
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("eldritch").setup()
      vim.cmd[[colorscheme eldritch]]
    end
  }
}
