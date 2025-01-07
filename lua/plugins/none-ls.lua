return {
	"nvimtools/none-ls.nvim",

	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- JavaScript
				null_ls.builtins.formatting.prettier,
				require("none-ls.diagnostics.eslint_d"),

				-- Python
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,

				-- Cpp
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.diagnostics.cppcheck,

				-- ASM
				null_ls.builtins.formatting.asmfmt,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
