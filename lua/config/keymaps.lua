-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("x", "s", "<Nop>")
-- Go to start of line in normal and visual modes
vim.keymap.set({ "n", "v" }, "gs", "^", { desc = "Go to Start of Line" })

-- Go to end of line in normal and visual modes
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Go to End of Line" })

-- Define 'gs' and 'gl' as motions for operator-pending mode (so dgs, ygs, etc. work)
vim.keymap.set("o", "gs", "^", { desc = "Operator to Start of Line" })
vim.keymap.set("o", "gl", "$", { desc = "Operator to End of Line" })

local cmp = require("cmp")

vim.keymap.set("i", "<C-x>", function()
  cmp.complete()
end, { desc = "Trigger CMP Completion" })

vim.keymap.set({ "n" }, "U", "<C-r>", { desc = "Redo last change" })
