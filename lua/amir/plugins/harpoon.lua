return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>hm", mark.add_file, { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "see harpoon list" })

		keymap.set("n", "<C-n>", ui.nav_next, { desc = "Go to next harpoon mark" })
		keymap.set("n", "<C-p>", ui.nav_prev, { desc = "Go to previous harpoon mark" })
	end,
}
