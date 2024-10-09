return {
  -- git fugitive greatest ever
  { "tpope/vim-fugitive" },
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",

    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "┃" },
          change = { text = "┃" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
      })
      -- keymaps
      local keymap = vim.keymap
      local gs = package.loaded.gitsigns

      keymap.set("n", "<leader>gn", function()
        gs.next_hunk()
        gs.preview_hunk()
      end, { desc = "Git next hunk" })

      keymap.set("n", "<leader>gp", function()
        gs.prev_hunk()
        gs.preview_hunk()
      end, { desc = "Git prev hunk" })
    end,
  },
}
