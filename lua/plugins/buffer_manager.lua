return {
	"j-morano/buffer_manager.nvim",
	{
		"j-morano/buffer_manager.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("buffer_manager").setup({
				-- Configurações personalizadas aqui
				line_keys = "1234567890",
				select_menu_item_commands = {
					edit = {
						key = "<CR>",
						command = "edit",
					},
				},
				focus_alternate_buffer = false,
				short_file_names = false,
				short_term_names = false,
				loop_nav = true,
				highlight = "",
				win_extra_options = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				format_function = nil,
				order_buffers = nil,
				show_indicators = nil,
			})

			-- Key mapping
			vim.keymap.set("n", "<Leader>fb", function()
				require("buffer_manager.ui").toggle_quick_menu()
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "<Leader>fn", function()
				require("buffer_manager.ui").nav_next()
			end, { noremap = true, silent = true })

			vim.keymap.set("n", "<Leader>fm", function()
				require("buffer_manager.ui").nav_prev()
			end, { noremap = true, silent = true })

		end,
	},
}
