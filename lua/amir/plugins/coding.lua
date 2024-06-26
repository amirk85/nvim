return {
	-- bracketpairs
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local autopairs = require("nvim-autopairs")
			autopairs.setup({
				check_ts = true, -- enable treesitter
				ts_config = {
					lua = { "string" }, -- don't add pairs in lua string treesitter nodes
					javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
					java = false, -- don't check treesitter on java
				},
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	-- UFO code folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		event = "VimEnter",
		keys = {
			{
				"zr",
				function()
					require("ufo").openFoldsExceptKinds({ "comment", "imports" })
				end,
				desc = "Open All Regular Folds",
			},
			{
				"z1",
				function()
					require("ufo").closeFoldsWith(1)
				end,
				desc = "Close L1 Folds",
			},
			{
				"z2",
				function()
					require("ufo").closeFoldsWith(2)
				end,
				desc = "Close L2 Folds",
			},
			{
				"z3",
				function()
					require("ufo").closeFoldsWith(3)
				end,
				desc = "Close L3 Folds",
			},
			{
				"z4",
				function()
					require("ufo").closeFoldsWith(4)
				end,
				desc = "Close L4 Folds",
			},
		},
		init = function()
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
		end,
		opts = {
			provider_selector = function(_, ft, _)
				local lspWithOutFolding = { "markdown", "sh", "css", "html", "python" }
				if vim.tbl_contains(lspWithOutFolding, ft) then
					return { "treesitter", "indent" }
				end
				return { "lsp", "indent" }
			end,
		},
	},
}
