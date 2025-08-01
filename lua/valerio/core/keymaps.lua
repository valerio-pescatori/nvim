vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- save file
keymap.set("n", "<leader>w", "<cmd>w<CR>", { noremap = true, silent = true, desc = "Save buffer" })

-- quit file
keymap.set("n", "<leader>q", "<cmd>q<CR>", { noremap = true, silent = true, desc = "Quit" })

-- esc insert mode
keymap.set("i", "jk", "<ESC>", opts)

-- goto end of line
keymap.set({ "n", "v" }, "gl", "$", { noremap = true, silent = true, desc = "Go to end of line" })

-- goto start of line
keymap.set({ "n", "v" }, "gs", "^", { noremap = true, silent = true, desc = "Go to start of line" })

-- Define 'gs' and 'gl' as motions for operator-pending mode (so dgs, ygs, etc. work)
keymap.set("o", "gs", "^", { desc = "Operator to Start of Line" })
keymap.set("o", "gl", "$", { desc = "Operator to End of Line" })

-- move between buffers
keymap.set("n", "<TAB>", "<cmd>bn<CR>", opts)
keymap.set("n", "<S-TAB>", "<cmd>bp<CR>", opts)
keymap.set("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>", { noremap = true, silent = true, desc = "Close buffer" })

-- increment/decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select buffer" })

-- redo
keymap.set("n", "<S-u>", "<C-r>", { noremap = true })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
