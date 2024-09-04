require("preferences")



local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
	{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
	}
}

local opts = {}

require("lazy").setup(plugins, opts)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', 'C-p>', builtin.find_files, {})



-- require("catppuccin").setup()

-- vim.cmd.colorscheme "catppuccin"
vim.cmd("colorscheme retrobox")
