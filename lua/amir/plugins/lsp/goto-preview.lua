return {
	"rmagatti/goto-preview",
	config = function()
		require("goto-preview").setup({
			width = 120, -- Width of the floating window
			height = 20, -- Height of the floating window
			stack_floating_preview_windows = true, -- Whether to nest floating windows
			preview_window_title = { enable = true, position = "left" },
		})
		local keymap = vim.keymap -- for conciseness
		local opts = { noremap = true, silent = true }
		keymap.set("n", "gp", ":lua require('goto-preview').goto_preview_definition()<CR>", opts) -- show definition, references
		keymap.set("n", "gX", ":lua require('goto-preview').close_all_win()<CR>", opts) -- show definition, references
	end,
}
