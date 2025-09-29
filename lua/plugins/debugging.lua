return {
  "mfussenegger/nvim-dap",

  event = "VeryLazy",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },

  config = function()
    local mason_dap = require("mason-nvim-dap")
    local dap = require("dap")
    local dap_ui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")


    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"

    local function get_executable_path()
      local ext = is_windows and ".exe" or ""
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") .. ext
    end

    -- Dap Virtual Text
    dap_virtual_text.setup()

    -- Mason DAP setup
    mason_dap.setup({
      ensure_installed = { "codelldb", "cppdbg" },
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    -- Configurations
    dap.configurations.c = {
      {
        name = "Launch File",
        type = "codelldb", -- Use codelldb for cross-platform LLDB debugging
        request = "launch",
        program = get_executable_path,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
      },
      {
        name = "Select and attach to process",
        type = "codelldb", -- Use codelldb instead of gdb for consistency
        request = "attach",
        program = get_executable_path,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Attach to lldbserver :1234",
        type = "codelldb",
        request = "launch",
        miDebuggerServerAddress = "localhost:1234",
        cwd = "${workspaceFolder}",
        program = get_executable_path,
      },
    }

    dap.configurations.cpp = dap.configurations.c

    -- Dap UI
    dap_ui.setup()
    vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

    -- DAP UI listeners
    dap.listeners.before.attach.dapui_config = function()
      dap_ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dap_ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dap_ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dap_ui.close()
    end

    -- Keymaps
    vim.keymap.set("n", "<Leader>dc", function() require("dap").continue() end, { desc = "Debugger - Continue debugger" })
    vim.keymap.set("n", "<Leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Debugger - Toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dB", function() require("dap").set_breakpoint() end, { desc = "Debugger - Set breakpoint" })
    vim.keymap.set("n", "<Leader>dbl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "Debugger - Set breakpoint with log point" })
    vim.keymap.set({ "n", "v" }, "<Leader>di", function() require("dap.ui.widgets").hover() end, { desc = "Debugger - Hover to show variable information" })
    vim.keymap.set({ "n", "v" }, "<Leader>dii", function() require("dap.ui.widgets").preview() end, { desc = "Debugger - Preview variable information" })
    vim.keymap.set("n", "<Leader>dso", function() require("dap").step_over() end, { desc = "Debugger - Step over" })
    vim.keymap.set("n", "<Leader>dsi", function() require("dap").step_into() end, { desc = "Debugger - Step into" })
    vim.keymap.set("n", "<Leader>dsot", function() require("dap").step_out() end, { desc = "Debugger - Step out" })
    vim.keymap.set("n", "<Leader>dss", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.frames) end, { desc = "Debugger - Show frames in centered float" })
    vim.keymap.set("n", "<Leader>dsv", function() local widgets = require("dap.ui.widgets") widgets.centered_float(widgets.scopes) end, { desc = "Debugger - Show scopes in centered float" })
  end,
}
