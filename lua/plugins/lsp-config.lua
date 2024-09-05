

return {

	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {"lua_ls", "clangd", "cmake", "cssls", "docker_compose_language_service", "html", "ast_grep", "jsonls", "grammarly", "pyright"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
	
			local lspconfig = require("lspconfig")

			-- Install language server
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.cmake.setup({})
			lspconfig.cssls.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.html.setup({})
			lspconfig.ast_grep.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.grammarly.setup({})
			lspconfig.pyright.setup({})
			lspconfig.cssls.setup({})

			-- Keymaps
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'L', vim.lsp.buf.definition, {})
			vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})


		end
	}

}
