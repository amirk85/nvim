return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        -- transparent_background = false,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- {
  -- 	"rose-pine/neovim",
  -- 	name = "rose-pine",
  -- 	config = function()
  -- 		require("rose-pine").setup({
  -- 			variant = "auto", -- auto, main, moon, or dawn
  -- 			dark_variant = "main", -- main, moon, or dawn
  -- 			dim_inactive_windows = false,
  -- 			extend_background_behind_borders = true,
  --
  -- 			styles = {
  -- 				bold = true,
  -- 				italic = true,
  -- 				transparency = false,
  -- 			},
  -- 		})
  --
  -- 		-- vim.cmd("colorscheme rose-pine")
  -- 		vim.cmd("colorscheme rose-pine-main")
  -- 	end,
  -- },
}
