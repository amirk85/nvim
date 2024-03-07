return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },

		{
			"SmiteshP/nvim-navbuddy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"MunifTanjim/nui.nvim"
			},
			opts = { lsp = { auto_attach = true } }
		}
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { noremap = true, silent = true, desc = "LSP references" })
			keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, silent = true, desc = "Go to declaration" })
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { noremap = true, silent = true, desc = "Go to definitions" })
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { noremap = true, silent = true, desc = "LSP implementations" })
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { noremap = true, silent = true, desc = "LSP type definitions" })
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "available code actions" })
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "Smart rename"})
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { noremap = true, silent = true, desc = "Show diagnostics" })
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Show line diagnostics" })
			keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "previous diagnostics" })
			keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "next diagnostics" })
			keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "Show documentation" })
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", { noremap = true, silent = true, desc = "Restart LSP" })
			keymap.set("n", "<leader>N", ":Navbuddy<CR>", { noremap = true, silent = true, desc = "Navbuddy"})
		end

		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local servers = { "html", "tsserver", "cssls", "tailwindcss", "prismals", "gopls" }

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					diagnostics = {
					globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{border = 'rounded'}
		)

		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
			vim.lsp.handlers.signature_help,
			{border = 'rounded'}
		)


	end,
}
