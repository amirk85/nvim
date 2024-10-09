return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- Triggered on file read or new file creation
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "dprint", "prettierd", "prettier", stop_after_first = true },
        javascriptf = { "dprint", "prettier", "prettierd", stop_after_first = true },
        typescript = { "dprint", "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "dprint" },
        typescriptreact = { "dprint" },
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
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or selected range" })
  end,
}
