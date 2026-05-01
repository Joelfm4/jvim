vim.g.mapleader = " "


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
require("lazy").setup("plugins")
require("preferences")

-- vim.cmd("colorscheme retrobox")
vim.cmd("colorscheme koehler")

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

vim.keymap.set("n", "fc", "zc", { desc = "Fold current function / block" })
vim.keymap.set("n", "fo", "zo", { desc = "Unfold current function / block" })
vim.keymap.set("n", "fC", "zM", { desc = "Close all folds in buffer" })
vim.keymap.set("n", "fO", "zR", { desc = "Open all folds in buffer" })


-- Tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.list = true


-- Vertical Movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")


-- Search
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")






