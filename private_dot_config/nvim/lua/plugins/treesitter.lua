return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"c_sharp", "ruby", "lua", "vim", "vimdoc", "query", "html", "markdown", "kdl", "jq", "json", "yaml", "fish", "css"},
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      })
  end
}
