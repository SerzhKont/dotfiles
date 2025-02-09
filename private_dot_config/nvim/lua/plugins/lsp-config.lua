return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "solargraph", "omnisharp" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities })
--      lspconfig.rubocop.setup({ capabilities = capabilities })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
                 cmd = { "solargraph", "stdio" },
                 settings = {
                    solargraph = {
                        diagnostics = true, -- Enable diagnostics
                        autoformat = true,  -- Enable autoformatting
                        useBundler = false, -- Set to true if using Bundler
                    },
                }
      })
			lspconfig.omnisharp.setup({
        capabilities = capabilities,
                cmd = { "dotnet", vim.fn.stdpath "data" .. "/mason/packages/omnisharp/libexec/OmniSharp.dll" },
                enable_import_completion = true,
                organize_imports_on_format = true,
                enable_roslyn_analyzers = true,
                root_dir = function ()
                    return vim.loop.cwd() -- current working directory
                end,
      })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
