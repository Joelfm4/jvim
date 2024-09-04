require("preferences")


-- Import Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Plugins and Opts

local plugins = {
	{'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	{"nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim",}},

}

local opts = {}

require("lazy").setup(plugins, opts)



vim.g.mapleader = " "



-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})



-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
	ensure_installed = {"lua", "python", "c", "cpp", "javascript", "cmake", "html", "css"},
  highlight = { enable = true },
  indent = { enable = true }, 
})

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal right<CR>', {})



vim.cmd("colorscheme retrobox")
