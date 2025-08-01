return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		preset = "helix",
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.add({
			{ "<leader>c", group = "code" },
			{ "<leader>g", group = "git" },
			{ "<leader>A", name = "Open Alpha", icon = "󰋜" },
		})
	end,
}
