return {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,
    build = ":TSUpdate",

    config = function()

        require("nvim-treesitter").setup({
            auto_install = true,
            highlight = { enable = false },
            indent = { enable = true },
        })


    end,
}
