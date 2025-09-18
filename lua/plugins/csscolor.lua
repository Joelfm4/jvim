return {
	"brenoprata10/nvim-highlight-colors",

	config = function()
		local treesitter = require("nvim-highlight-colors")

		treesitter.setup({

			---Render style
			render = "background",

			---Set virtual symbol (requires render to be set to 'virtual')
			virtual_symbol = "■",

			---Set virtual symbol suffix (defaults to '')
			virtual_symbol_prefix = "",

			---Set virtual symbol suffix (defaults to ' ')
			virtual_symbol_suffix = " ",

			---Set virtual symbol position()
			virtual_symbol_position = "inline",

			enable_hex = true,
			enable_short_hex = true,
			enable_rgb = true,
			enable_hsl = true,
			enable_var_usage = true,
			enable_named_colors = true,
			enable_tailwind = true,
			exclude_filetypes = {},
			exclude_buftypes = {},

			formatting = {
				format = require("nvim-highlight-colors").format,
			},

		})

	end,
}
