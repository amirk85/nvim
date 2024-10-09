return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
  },
  config = function()
    local cmp = require("cmp")
    require("luasnip.loaders.from_vscode").lazy_load() -- load snippets
    local lspkind = require("lspkind")

    cmp.setup({
      completion = { completeopt = "menu,menuone,preview,noselect" },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      mapping = cmp.mapping.preset.insert({
        ["<tab>"] = cmp.mapping.select_next_item(),
        ["<S-tab>"] = cmp.mapping.select_prev_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      formatting = {
        format = lspkind.cmp_format({ maxwidth = 50, ellipsis_char = "..." }),
      },
    })

    -- Additional setup for SQL and DB file types
    cmp.setup.filetype({ "sql", "db" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })
  end,
}
