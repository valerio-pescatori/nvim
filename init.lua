require("valerio.core")
require("valerio.lazy")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	callback = function()
		vim.cmd("TSEnable highlight")
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- set the cursoline to be transparent
vim.cmd("highlight CursorLine guibg=NONE ctermbg=NONE")
