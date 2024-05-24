return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim"
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
      },
    }
  },
  lazy=false,
  config = function()
    telescope = require('telescope')
    require("lspconfig").gopls.setup{
      on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set("n", "<leader>r",  vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, {buffer=0})
        vim.keymap.set("n", "<leader>fn", vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set("n", "<leader>fp", vim.diagnostic.goto_prev, {buffer=0})

        -- like "K" but for diagnostics
        vim.keymap.set("n", "S", vim.diagnostic.open_float, {buffer=0})
      end
    }
  end,
}
