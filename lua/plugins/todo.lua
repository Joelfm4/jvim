return {
	"folke/todo-comments.nvim",

	dependencies = { "nvim-lua/plenary.nvim" },

	opts = {
		signs = true, -- show icons in the signs column
	},

	config = function(_, opts)
		require("todo-comments").setup(opts)
		vim.keymap.set("n", "<leader>fft", "<cmd>TodoTelescope<CR>", { desc = "Search for todos" })
		vim.keymap.set("n", "<leader>fflt", "<cmd>TodoQuickFix<CR>", { desc = "List the TODOs in Quickfix" })
	end,
}
