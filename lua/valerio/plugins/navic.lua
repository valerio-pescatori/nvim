return {
	{
		"SmiteshP/nvim-navic",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			local navic = require("nvim-navic")

			navic.setup({
				highlight = true,
				separator = " > ",
				depth_limit = 0,
				depth_limit_indicator = "..",
				safe_output = true,
			})

			-- winbar
			vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

			-- Attach navic to LSP clients that support it
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			local lspconfig = require("lspconfig")

			-- HTML
			lspconfig.html.setup({ on_attach = on_attach })

			-- CSS
			lspconfig.cssls.setup({ on_attach = on_attach })

			-- JSON
			lspconfig.jsonls.setup({
				on_attach = on_attach,
			})

			lspconfig.ts_ls.setup({
				on_attach = on_attach,
			})
		end,
	},
}
