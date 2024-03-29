return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>U", ":UndotreeToggle<CR>", {silent = true, noremap = true, desc = "Undotree"})
	end,
}
