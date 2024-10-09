-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- Normal Mode Keymaps
keymap.set("n", "<Leader>o", "o<Esc>", opts) -- add new line below without leaving normal mode
keymap.set("n", "<Leader>O", "O<Esc>", opts) -- add new line above without leaving normal mode

keymap.set("n", "<C-a>", "ggVG") -- select all
keymap.set("n", "<leader>X", ":!chmod +x %<CR>") -- make file executable
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- open tmux sessionizer

keymap.set("n", "E", "$", { noremap = false }) -- move to end of line
keymap.set("n", "B", "^", { noremap = false }) -- move to beginning of line

keymap.set("n", "J", "mzJ`z") -- join lines without moving the cursor
keymap.set("n", "<C-d>", "<C-d>zz") -- scroll down and center
keymap.set("n", "<C-u>", "<C-u>zz") -- scroll up and center
keymap.set("n", "n", "nzzzv") -- search next and center
keymap.set("n", "N", "Nzzzv") -- search previous and center

keymap.set("n", "Q", "<nop>") -- disable Ex mode
keymap.set("n", "<C-z>", "<nop>") -- disable suspend

keymap.set("n", "<C-s>", ":w<CR>") -- save with Ctrl+s
keymap.set("n", "<leader>w", ":w<CR>") -- save with leader + w

keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word under cursor

-- Increment/Decrement Numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment number
keymap.set("n", "<leader>-", "<C-x>") -- decrement number

-- Clear search highlights
keymap.set("n", "<leader>no", ":nohl<CR>", { desc = "Clear search highlights" })

-- Delete single character without copying into register
keymap.set("n", "x", '"_x')

-- Visual Mode Keymaps
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selected line down
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selected line up

-- Window Management
keymap.set("n", "sh", "<C-w>s", opts) -- split window horizontally
keymap.set("n", "sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "se", "<C-w>=", opts) -- equalize split windows
keymap.set("n", "sx", ":close<CR>", opts) -- close current split window

-- Resize Windows
keymap.set("n", "<C-w><left>", "<C-w><") -- resize window left
keymap.set("n", "<C-w><right>", "<C-w>>") -- resize window right
keymap.set("n", "<C-w><up>", "<C-w>+") -- resize window up
keymap.set("n", "<C-w><down>", "<C-w>-") -- resize window down

-- Tabs Management
keymap.set("n", "<leader>tn", ":tabnext<Return>", opts) -- go to next tab
keymap.set("n", "<leader>tp", ":tabprev<Return>", opts) -- go to previous tab
keymap.set("n", "<leader>tn", ":tabnew<Return>", opts) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<Return>", opts) -- close current tab
keymap.set("n", "<leader>to", ":tabonly<Return>", opts) -- close all other tabs

-- Paste over visual selection without overwriting register
keymap.set("x", "<leader>p", [["_dP]])
