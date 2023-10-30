return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        bib = { "bibtex_tidy" },
        go = { "goimports", "gci", "golines" },
        sh = { "shfmt" },
        tex = { "latexindent" },
        sql = { "sql_formatter" },
        python = { "isort", "black" },
        yaml = { "yamlfix" },
        lua = { "stylua" },
      },

      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 300,
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 300,
      })
    end, { desc = "Format file or range" })
  end,
}
