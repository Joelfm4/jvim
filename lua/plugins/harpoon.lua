return {
	"ThePrimeagen/harpoon",
	config = function()
		 local harpoon = require("harpoon")

		-- Adding a mark for the current file
		vim.api.nvim_set_keymap("n", "<leader>hm", ":lua require('harpoon.mark').add_file()<CR>", { noremap = true, silent = true })

		-- Quick menu
		vim.api.nvim_set_keymap("n", "<leader>hq", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true, silent = true })

		-- Navigation to specific marks
		vim.api.nvim_set_keymap("n", "<leader>h1", ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>h2", ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>h3", ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>h4", ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true, silent = true })

		-- Cycle through marks
		vim.api.nvim_set_keymap("n", "<leader>hn", ":lua require('harpoon.ui').nav_next()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>hp", ":lua require('harpoon.ui').nav_prev()<CR>", { noremap = true, silent = true })

	end
}
