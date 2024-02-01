return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim", --fzf
        build = "make",
      },

      {
        "debugloop/telescope-undo.nvim",
        keys = { { "<leader>U", "<cmd>Telescope undo<cr>" } }, -- undo tree
        config = function()
          require("telescope").load_extension("undo")
        end,
      },
    },

    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        wrap_results = true,
        file_ignore_patterns = { "node_modules" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.5,
          },
          width = 0.9,
          height = 0.9,
          preview_cutoff = 120,
        },
        winblend = 0,
        mappings = {
          n = {
            ["q"] = actions.close,
          },
        },
      })

      -- pickers

      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },

        colorscheme = {
          enable_preview = true,
        },

        grep_string = {
          temp__scrolling_limit = 50, -- only sort top 50 entries
        },

        fzf = {
          fuzzy = false, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      }

      -- extension config

      opts.extensions = {}

      telescope.setup(opts)
      require("telescope").load_extension("fzf")

      -- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Telescope: Find files" })
      keymap.set("n", "<leader>fF", ":Telescope find_files cwd=%:p:h<cr>", { desc = "Telescope: Find files" })
      keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>", { desc = "Telescope: Old files" })
      keymap.set("n", "<leader>ft", ":Telescope live_grep<cr>", { desc = "Telescope: Find text" })
      keymap.set("n", "<leader>fs", ":Telescope grep_string<cr>", { desc = "Telescope: Find String" })
      keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", { desc = "Telescope: buffers" })
      keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", { desc = "Telescope: Help" })
      keymap.set("n", "<leader>fd", ":Telescope diagnostics<cr>", { desc = "Telescope: Diagnostics" })

      -- Telescope for git
      keymap.set("n", "<leader>gb", ":Telescope git_branches<cr>", { desc = "Telescope: Git branches" })
      keymap.set("n", "<leader>gs", ":Telescope git_status<cr>", { desc = "Telescope: Git status" })
      keymap.set("n", "<leader>gc", ":Telescope git_commits<cr>", { desc = "Telescope: Git commits" })
    end,
  },
}
