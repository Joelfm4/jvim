local servers = {
    "ast_grep",
    "asm_lsp",
    "clangd",
    "cmake",
    "cssls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "ruff",
    "tailwindcss",
    "tsp_server",
    "ts_ls",
}
return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                })
            end
            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp - Show hover information"})
            vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "Lsp - Go to definition" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp - Show code actions" })
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Lsp - Rename" })
            vim.keymap.set("n", "<leader>ky", "<cmd>Telescope keymaps<CR>", { desc = "Show keymaps" })
        end,
    },
}
