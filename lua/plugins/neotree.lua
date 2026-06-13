return {
    "nvim-neo-tree/neo-tree.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    lazy = false,

    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                never_show = {},
            },
        },
    },

    config = function(_, opts)
        require("neo-tree").setup(opts)

        vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal right<CR>", { desc = "Neotree - Reveal" })
        vim.keymap.set("n", "<leader>q", ":Neotree filesystem close right<CR>", { desc = "Neotree - Close" })
    end,

}
