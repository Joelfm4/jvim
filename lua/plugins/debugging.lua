return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local mason_dap = require("mason-nvim-dap")

    dapui.setup()

    -- Automatically open/close DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- Key mappings
    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})
    vim.keymap.set("n", "<Leader>ds", dap.step_over, {})
    vim.keymap.set("n", "<Leader>di", dap.step_into, {})
    vim.keymap.set("n", "<Leader>do", dap.step_out, {})
    vim.keymap.set("n", "<Leader>dr", dap.repl.open, {})

    -- DAP Adapters
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap" }
    }

    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = 'codelldb',
        args = {"--port", "${port}"}
      }
    }

    -- DAP Configurations for C++
    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
      },
      {
        name = "Attach to gdbserver",
        type = "gdb",
        request = "attach",
        target = "localhost:1234",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main.exe", "file")
        end,
        cwd = "${workspaceFolder}",
      }
    }

    -- DAP Configurations for Rust with codelldb
    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/main.exe", "file")
        end,
        cwd = "${workspaceFolder}",
        stopAtEntry = true,
      }
    }

    -- Install codelldb using mason-nvim-dap
    mason_dap.setup({
      ensure_installed = { "codelldb" }
    })
  end,
}

