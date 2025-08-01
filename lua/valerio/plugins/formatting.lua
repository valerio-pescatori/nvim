return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			cmd = { "biome", "lsp-proxy" },
			formatters_by_ft = {
				javascript = { "prettier", "biome", stop_after_first = true },
				typescript = { "prettier", "biome", stop_after_first = true },
				javascriptreact = { "prettier", "biome", stop_after_first = true },
				typescriptreact = { "prettier", "biome", stop_after_first = true },
				svelte = { "biome" },
				css = { "prettier", "biome", stop_after_first = true },
				html = { "prettier", "biome", stop_after_first = true },
				json = { "prettier", "biome", stop_after_first = true },
				yaml = { "biome" },
				markdown = { "biome" },
				graphql = { "biome" },
				liquid = { "biome" },
				lua = { "stylua" },
				rust = { "rustfmt" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
