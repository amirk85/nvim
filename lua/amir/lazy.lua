local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local imports = {
	-- using tables for multiple imports
	{ import = "amir.plugins"},
	{ import = "amir.plugins.lsp"},
}

local opts = {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},

	ui = {
		border = "single"
	}
}

require("lazy").setup(imports, opts)
