return {
	"fedepujol/move.nvim",

	config = function()
		local movelines = require("move")

		movelines.setup({

			line = {
				enable = true,
				indent = true,
			},

			block = {
				enable = true,
				indent = true,
			},

			word = {
				enable = true,
			},

			char = {
				enable = false,
			},
		})

		local opts = { noremap = true, silent = true }

		-- Normal-mode commands
		vim.keymap.set("n", "<A-j>", ":MoveLine(1)<CR>", vim.tbl_extend("force", opts, { desc = "Move line down" }))
		vim.keymap.set("n", "<A-k>", ":MoveLine(-1)<CR>", vim.tbl_extend("force", opts, { desc = "Move line up" }))

		-- Visual-mode commands
		vim.keymap.set("v", "<A-j>", ":MoveBlock(1)<CR>", vim.tbl_extend("force", opts, { desc = "Move selected block down" }))
		vim.keymap.set("v", "<A-k>", ":MoveBlock(-1)<CR>", vim.tbl_extend("force", opts, { desc = "Move selected block up" }))

	end,
}
