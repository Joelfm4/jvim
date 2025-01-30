return {
	"mfussenegger/nvim-dap",

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		dap.adapters.gdb = {
  		type = "executable",
  		command = "gdb",
  		args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
		}

		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = "${workspaceFolder}",
				stopAtBeginningOfMainSubprogram = false,
			},
			{
				name = "Select and attach to process",
				type = "gdb",
				request = "attach",
				program = function()
					 return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				pid = function()
					 local name = vim.fn.input('Executable name (filter): ')
					 return require("dap.utils").pick_process({ filter = name })
				end,
				cwd = '${workspaceFolder}'
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'gdb',
				request = 'attach',
				target = 'localhost:1234',
				program = function()
					 return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}'
			},
		}

		dap.configurations.c = dap.configurations.cpp

		dapui.setup()

		vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, { desc = "Debugger - Continue debugger" })
		vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Debugger - Toggle breakpoint" })
		vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { desc = "Debugger - Set breakpoint" })
		vim.keymap.set('n', '<Leader>dbl', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "Debugger - Set breakpoint with log point" })

		vim.keymap.set({'n', 'v'}, '<Leader>di', function() require('dap.ui.widgets').hover() end, { desc = "Debugger - Hover to show variable information" })
		vim.keymap.set({'n', 'v'}, '<Leader>dii', function() require('dap.ui.widgets').preview() end , { desc = "Debugger - Preview variable information" })

		vim.keymap.set('n', '<Leader>dso', function() require('dap').step_over() end, { desc = "Debugger - Step over" })
		vim.keymap.set('n', '<Leader>dsi', function() require('dap').step_into() end, { desc = "Debugger - Step into" })
		vim.keymap.set('n', '<Leader>dsot', function() require('dap').step_out() end, { desc = "Debugger - Step out" })

		vim.keymap.set('n', '<Leader>dss', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end, { desc = "Debugger - Show frames in centered float" })
		vim.keymap.set('n', '<Leader>dsv', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, { desc = "Debugger - Show scopes in centered float" })

	end,
}
