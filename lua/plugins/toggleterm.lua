return {
	"akinsho/toggleterm.nvim",

	version = "*",

	config = function()

		require("toggleterm").setup({
			direction = "horizontal",
			open_mapping = "<Leader>ft",
			auto_scroll = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_mode = true,
			close_on_exit = true,
			shell = vim.o.shell,
		})
	end,
}
