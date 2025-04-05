return {
	"mfussenegger/nvim-dap-python",
	dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("dap-python").setup("python3")
	end,
	keys = {
		{ "<leader>c", "<cmd>DapContinue<CR>" },
		{ "<F5>", "<cmd>DapStepOver<CR>" },
		{ "<F6>", "<cmd>DapStepInto<CR>" },
		{ "<leader>so", "<cmd>DapStepOut<CR>" },
		{ "<leader>b", "<cmd>DapToggleBreakpoint<CR>" },
		{ "<leader>B", "<cmd>DapClearBreakpoints<CR>" },
		{ "<leader>dr", "<cmd>DapToggleRepl<CR>" },
		{ "<leader>de", "<cmd>DapEval<CR>" },
		{ "<leader>do", "<cmd>DapShowLog<CR>" },
		{ "<leader>dt", "<cmd>DapTerminate<CR>" },
		{ "<leader>dd", "<cmd>DapDisconnect<CR>" },
	},

	-- Default Suggestion
	-- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
	-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
	-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
	-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
	-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
	-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
	-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
	-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
	-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
	-- vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
	--   require('dap.ui.widgets').hover()
	-- end)
	-- vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
	--   require('dap.ui.widgets').preview()
	-- end)
	-- vim.keymap.set('n', '<Leader>df', function()
	--   local widgets = require('dap.ui.widgets')
	--   widgets.centered_float(widgets.frames)
	-- end)
	-- vim.keymap.set('n', '<Leader>ds', function()
	--   local widgets = require('dap.ui.widgets')
	--   widgets.centered_float(widgets.scopes)
	-- end)
}
