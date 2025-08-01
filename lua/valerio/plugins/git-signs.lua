return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local git_signs = require("gitsigns")

			git_signs.setup({
				signs = {
					add = { text = "│" },
					change = { text = "│" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				numhl = false, -- Highlight numbers for changes
				linehl = false, -- Highlight lines for changes
				current_line_blame = true, -- Show blame inline by default
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				sign_priority = 6, -- Priority of signs
				update_debounce = 100, -- Debounce time for updates (in ms)
				max_file_length = 40000, -- Max file length to enable gitsigns

				on_attach = function(bufnr)
					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
					end
					local gs = package.loaded.gitsigns

					-- Add keymaps
					map("n", "<leader>gp", "<cmd>:Gitsigns preview_hunk<CR>", "Preview changes")

					map("n", "<leader>gb", "<cmd>:Gitsigns toggle_current_line_blame<CR>", "Toggle line blame")

					map("n", "]h", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gs.nav_hunk("next")
						end
					end, "Next Hunk")

					map("n", "[h", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gs.nav_hunk("prev")
						end
					end, "Prev Hunk")
				end,
			})
		end,
	},
}
