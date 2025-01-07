return {
	{
		'hrsh7th/cmp-nvim-lsp',
	},

	{
		'L3MON4D3/LuaSnip',
		dependencies = {
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets'
		}
	},

	{
	},


	{
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({

			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},

			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = 'luasnip' },
				{ name = 'snippy' },
			},

			{
				{ name = "buffer" },
			}),

		})

	end,
	}


}
