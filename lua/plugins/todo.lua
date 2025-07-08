return {
	"folke/todo-comments.nvim",

	dependencies = { "nvim-lua/plenary.nvim" },

	opts = {
		signs = true, -- show icons in the signs column
	},

	config = function(_, opts)
		require("todo-comments").setup(opts)
		vim.keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<CR>", { desc = "Todo - Search for todos" })
		vim.keymap.set("n", "<leader>ttl", "<cmd>TodoQuickFix<CR>", { desc = "Todo - List" })
	end,
}
