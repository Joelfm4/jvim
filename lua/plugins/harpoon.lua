return {
	"ThePrimeagen/harpoon",

	config = function()

		require("harpoon").setup({
			width = vim.api.nvim_win_get_width(0) - 4,
		})


		local opts = { noremap = true, silent = true }

		-- Adding a mark for the current file
		vim.api.nvim_set_keymap("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Add current file to Harpoon marks" }))

		-- Quick menu
		vim.api.nvim_set_keymap("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Quick menu" }))

		-- Navigation to specific marks
		vim.api.nvim_set_keymap("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Navigate to mark 1" }))
		vim.api.nvim_set_keymap("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Navigate to mark 2" }))
		vim.api.nvim_set_keymap("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Navigate to mark 3" }))
		vim.api.nvim_set_keymap("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Navigate to mark 4" }))

		-- Cycle through marks
		vim.api.nvim_set_keymap("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Next mark" }))
		vim.api.nvim_set_keymap("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", vim.tbl_extend("force", opts, { desc = "Harpoon - Previous mark" }))

	end
}
