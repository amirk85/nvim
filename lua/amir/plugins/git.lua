return {
  -- git fugitive
  { "tpope/vim-fugitive" },
  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",

    config = function()
      require("gitsigns").setup({
        signs = {
          add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = {
            hl = "GitSignsChange",
            text = "│",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = {
            hl = "GitSignsDelete",
            text = "‾",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = "~",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        },
      })
      -- keymaps
      local keymap = vim.keymap
      local gs = package.loaded.gitsigns

      keymap.set("n", "<leader>gn", function()
        gs.next_hunk()
        gs.preview_hunk()
        gs.toggle_current_line_blame()
      end, { desc = "Git next hunk" })

      keymap.set("n", "<leader>gp", function()
        gs.prev_hunk()
        gs.preview_hunk()
        gs.toggle_current_line_blame()
      end, { desc = "Git prev hunk" })
    end,
  },
}
