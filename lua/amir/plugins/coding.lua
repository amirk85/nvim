return {
	-- run program
	{
		"arjunmahishi/flow.nvim",
		config = function()
			require("flow").setup({
				output = {
					buffer = true,
					split_cmd = "80vsplit",
					focused = true,
					modifiable = false,
				},
			})
			vim.keymap.set("n", "<leader>R", ":FlowRunFile<CR>", { silent = true, desc = "Run file" })
			vim.keymap.set("v", "<leader>R", ":FlowRunSelected<CR>", { silent = true, desc = "Run file" })
		end,
	},

	-- formatting
	{
		"stevearc/conform.nvim",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascriptf = { "prettier" },
					typescript = { "prettier" },
					javascriptreact = { "prettier" },
					typescriptreact = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					lua = { "stylua" },
				},
				-- format_on_save = {
				-- 	lsp_fallback = true,
				-- 	async = false,
				-- 	timeout_ms = 1000,
				-- },
			})

			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})

				-- local save_view = vim.fn.winsaveview()
				vim.cmd([[execute "normal! mzgg=G`z"]])
				-- vim.fn.winrestview(save_view)
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},

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

	-- comment code
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = function()
			local comment = require("Comment")
			local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
			comment.setup({
				pre_hook = ts_context_commentstring.create_pre_hook(),
			})
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
