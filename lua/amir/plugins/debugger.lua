return {
	"mfussenegger/nvim-dap",

	-- "rcarriga/nvim-dap-ui",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		-- "mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		{ "mfussenegger/nvim-dap-python", ft = "python3" },
	},

	event = { "BufReadPre", "BufNewFile" },

	config = function()
		require("dapui").setup()

		local python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"
		require("dap-python").setup(python_path)

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

		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
		)

		vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
		vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
		vim.keymap.set("n", "<Leader>dn", ":DapStepInto<CR>")
		vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
		vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
	end,
}
