return {
  "mfussenegger/nvim-dap",

  event = "VeryLazy",

  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },


  -- NOTE: Editor <-> Adapter <-> Debugger <-> Code


  config = function()

    local mason_dap = require("mason-nvim-dap")
    local dap = require("dap")
    local ui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    -- Dap Virtual Text
    dap_virtual_text.setup()

    -- Dap Setup
    mason_dap.setup({

      ensure_installed = { "cppdbg" },
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
        type = "cppdbg",
        request = "launch",
        program = function()
		    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        MIMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb",
      },
    }

    dap.configurations.cpp = dap.configurations.c

    -- Dap UI
    ui.setup()

    vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

    -- Dap UI Listeners
    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end

    -- Keymaps
    vim.keymap.set("n", "<Leader>dc", function() require("dap").continue() end, { desc = "Debugger - Continue / Start" })
    vim.keymap.set("n", "<Leader>dd", function() require("dap").disconnect({ terminateDebuggee = true }) end, { desc = "Debugger - Disconnect" })
    vim.keymap.set("n", "<Leader>dl", function() require("dap").run_last() end, { desc = "Debugger - Run Last Configuration" })

    vim.keymap.set("n", "<Leader>dq", function()

        require("dap").terminate()
        require("dapui").close()
        if pcall(require, "nvim-dap-virtual-text") then
            require("nvim-dap-virtual-text").toggle()
        end

    end, { desc = "Debugger - Terminate & Clean UI" })

    -- Stepping
    vim.keymap.set("n", "<Leader>di", function() require("dap").step_into() end, { desc = "Debugger - Step Into" })
    vim.keymap.set("n", "<Leader>do", function() require("dap").step_over() end, { desc = "Debugger - Step Over" })
    vim.keymap.set("n", "<Leader>du", function() require("dap").step_out() end, { desc = "Debugger - Step Out" })

    -- Break Point
    vim.keymap.set("n", "<Leader>dt", function() require("dap").toggle_breakpoint() end, { desc = "Debugger - Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>db", function() require("dap").list_breakpoints() end, { desc = "Debugger - List All Breakpoints" })
    vim.keymap.set("n", "<Leader>dpl", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "Debugger - Log Point" })
    vim.keymap.set("n", "<Leader>de", function() require("dap").set_exception_breakpoints({ "all" }) end, { desc = "Debugger - Break on Exceptions" })

    -- Inspecting Variables
    vim.keymap.set({ "n", "v" }, "<Leader>dv", function() require("dap.ui.widgets").hover() end, { desc = "Debugger - Hover Variable Info" })
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end, { desc = "Debugger - Preview Variable Window" })
    vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end, { desc = "Debugger - Open REPL Console" })

  end,
}
