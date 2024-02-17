return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		local oil = require("oil")

		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
			keymaps = {
				["g?"] = "actions.show_help",
				["L"] = "actions.select",
				["<CR>"] = "actions.select",
				["<C-v>"] = "actions.select_vsplit",
				["<C-s>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<C-y>"] = "actions.copy_entry_path",
				["<ESC>"] = "actions.close",
				["q"] = "actions.close",
				["<C-r>"] = "actions.refresh",
				["H"] = "actions.parent",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			use_default_keymaps = false,
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = false,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				-- This function defines what will never be shown, even when `show_hidden` is set
				is_always_hidden = function(name, bufnr)
					return false
				end,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			-- Configuration for the floating window in oil.open_float
			float = {
				padding = 1,
				max_width = 60,
				max_height = 20,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				override = function(conf)
					return conf
				end,
			},
			-- Configuration for the actions floating preview window
			preview = {
				-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				-- min_width and max_width can be a single value or a list of mixed integer/float types.
				-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
				max_width = 0.9,
				-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
				min_width = { 40, 0.4 },
				-- optionally define an integer/float for the exact width of the preview window
				width = nil,
				-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				-- min_height and max_height can be a single value or a list of mixed integer/float types.
				-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
				max_height = 0.9,
				-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
				min_height = { 5, 0.1 },
				-- optionally define an integer/float for the exact height of the preview window
				height = nil,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				-- Whether the preview window is automatically updated when the cursor is moved
				update_on_cursor_moved = true,
			},
			-- Configuration for the floating progress window
			progress = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
				width = nil,
				max_height = { 10, 0.9 },
				min_height = { 5, 0.1 },
				height = nil,
				border = "rounded",
				minimized_border = "none",
				win_options = {
					winblend = 0,
				},
			},
		})

		-- vim.keymap.set("n", "<leader>ee", ":Oil --float<CR>", { silent = true, noremap = true, desc = "Oil file explorer" })
		vim.keymap.set("n", "<leader>e", function()
			oil.toggle_float(".")
		end, { silent = true, noremap = true, desc = "Oil" })
	end,
}
