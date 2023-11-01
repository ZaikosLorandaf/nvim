return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      css = { "stylelint" },
      markdown = { "markdownlint" },
      python = { "pylint" },
      go = { "golangci_lint" },
      sh = { "shellcheck" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("link", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, {
      desc = "Trigger linting for current file",
      silent = true,
    })
  end,
}
