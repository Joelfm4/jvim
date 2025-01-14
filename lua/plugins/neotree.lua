return {
	"nvim-neo-tree/neo-tree.nvim",

	branch = "v3.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

  opts = {
  	filesystem = {
      filtered_items = {
				 visible = true,
				 show_hidden_count = true,
				 hide_dotfiles = false,
				 hide_gitignored = false,
				 hide_by_name = {
					 -- '.git',
					 -- '.DS_Store',
					 -- 'thumbs.db',
				 },
				never_show = {},
      },
    },
  },

	config = function(_, opts)
		require("neo-tree").setup(opts)

		vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal right<CR>', {})
		vim.keymap.set('n', '<leader>q', ':Neotree filesystem close right<CR>', {})
	end

}
