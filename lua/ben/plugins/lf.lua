return {
  "lmburns/lf.nvim",
  dependencies = {
    { "akinsho/toggleterm.nvim", version = "*", config = true },
  },
  config = {
    border = "rounded",
  },
  keys = {
    { "<leader>lf", "<cmd>Lf<cr>" },
  },
}
