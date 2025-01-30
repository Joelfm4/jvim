return {
	"ThePrimeagen/refactoring.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},

	lazy = false,

	config = function()
		require("refactoring").setup()

		vim.keymap.set("x", "<leader>re", ":Refactor extract ", { desc = "Extract code into a function" })
		vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ", { desc = "Extract code to a new file" })
		vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ", { desc = "Extract code to a variable" })
		vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var", { desc = "Inline a variable" })
		vim.keymap.set("n", "<leader>rI", ":Refactor inline_func", { desc = "Inline a function" })
		vim.keymap.set("n", "<leader>rb", ":Refactor extract_block", { desc = "Extract a block of code" })
		vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file", { desc = "Extract a block of code to a new file" })

	end,
}
