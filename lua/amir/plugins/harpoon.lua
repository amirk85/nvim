return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    -- keymap.set("n", "<leader>ha", mark.add_file, { desc = "Mark file with harpoon" })
    -- keymap.set("n", "<leader>hl", ui.toggle_quick_menu, { desc = "see harpoon list" })
    --
    -- keymap.set("n", "<C-n>", ui.nav_next, { desc = "Go to next harpoon mark" })
    -- keymap.set("n", "<C-p>", ui.nav_prev, { desc = "Go to previous harpoon mark" })
    -- set keymaps

    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<leader>h", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("n", "<leader>j", function()
      ui.nav_file(2)
    end)
    vim.keymap.set("n", "<leader>k", function()
      ui.nav_file(3)
    end)
    vim.keymap.set("n", "<leader>l", function()
      ui.nav_file(4)
    end)
  end,
}
