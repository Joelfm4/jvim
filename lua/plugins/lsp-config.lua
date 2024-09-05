

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
				ensure_installed = {"lua_ls", "clangd", "cmake", "cssls", "docker_compose_language_service", "html", "tsserver", "jsonls", "grammarly", "pyright", "cssls"}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- Starting
			lspconfig.lua_ls.setup({})
			lspconfig.clangd.setup({})
			lspconfig.cmake.setup({})
			lspconfig.cssls.setup({})
			lspconfig.docker_compose_language_service.setup({})
			lspconfig.html.setup({})
			lspconfig.tsserver.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.grammarly.setup({})
			lspconfig.pyright.setup({})
			lspconfig.cssls.setup({})
		end

	}

}
