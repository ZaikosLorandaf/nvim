return {
  "lmburns/lf.nvim",
  lazy = false,
  dependencies = {
    { "akinsho/toggleterm.nvim", version = "*", config = true },
  },
  config = function()
    vim.g.lf_netrw = 1
    require("lf").setup({
      border = "rounded",
      winblend = 20,
      focus_on_open = true,
      highlights = { -- highlights passed to toggleterm
      Normal = {link = "Normal"},
      NormalFloat = {link = 'Normal'},
      FloatBorder = {guifg = "#111a1f", guibg = "#bada55"},
      },
    })
    vim.api.nvim_set_keymap("n", "<leader>lf", "<cmd>Lf<cr>", { noremap = true, silent = true })
  end,
}
