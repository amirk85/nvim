vim.g.mapleader = " " -- set leader key to space

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-s>", ":w<CR>", opts) -- adds new line without leaving normal mode

keymap.set("n", "<Leader>o", "o<Esc>", opts) -- adds new line without leaving normal mode
keymap.set("n", "<Leader>O", "O<Esc>", opts) -- adds new line without leaving normal mode

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-a>", "ggVG") -- selects all

vim.api.nvim_set_keymap("n", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false })

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "Q", "<nop>")

keymap.set("n", "<leader>w", ":w<CR>")

keymap.set("x", "<leader>p", [["_dP]])
keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

keymap.set("i", "jj", "<ESC>", opts)

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- window management
keymap.set("n", "sh", "<C-w>s", opts) -- split window vertically
keymap.set("n", "sv", "<C-w>v", opts) -- split window horizontally
keymap.set("n", "se", "<C-w>=", opts) -- make split windows equal width & height
keymap.set("n", "sx", ":close<CR>", opts) -- close current split window

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- tabs
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "<leader>tx", ":tabclose<Return>", opts)
