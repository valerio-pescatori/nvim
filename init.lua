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

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- disable left click popup menu
vim.cmd("aunmenu PopUp")
vim.cmd("autocmd! nvim.popupmenu")

-- set the cursoline to be transparent
vim.cmd("highlight CursorLine guibg=NONE ctermbg=NONE")
