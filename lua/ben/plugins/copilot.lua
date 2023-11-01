return {
  "github/copilot.vim",
  event = "VeryLazy",
  build = function()
    vim.cmd([[Copilot setup]])
  end,
}
