return {
  {
    "jiaoshijie/undotree",
    dependencies = { "nvim-lua/plenary.nvim" },  -- Required dependency for undotree
    config = function()
      -- Basic setup for undotree
      require('undotree').setup({
        float_diff = true,  -- Enable floating diff window
        layout = "left_bottom", -- Change layout option
        position = "left", -- Set position of the undotree panel
        ignore_filetype = { 'undotree', 'undotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
        window = {
          winblend = 30,
        },
        keymaps = {
          ['j'] = "move_next",
          ['k'] = "move_prev",
          ['gj'] = "move2parent",
          ['J'] = "move_change_next",
          ['K'] = "move_change_prev",
          ['<cr>'] = "action_enter",
          ['p'] = "enter_diffbuf",
          ['q'] = "quit",
        },
      })

      -- Keybinding to toggle the undotree panel
      vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })
    end,
    keys = {
      { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "Toggle UndoTree" },
    }
  }
}

