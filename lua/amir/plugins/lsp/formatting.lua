return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascriptf = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        go = { "goimports", "gofmt" },
        sql = { "sql-formatter", "sqlfmt" },
      },
      -- format_on_save = {
      -- 	lsp_fallback = true,
      -- 	async = false,
      -- 	timeout_ms = 1000,
      -- },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
      -- vim.cmd([[execute "normal! mzgg=G`z"]])
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
