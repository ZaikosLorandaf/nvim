return { -- No nonsense, very stoic
  "aktersnurra/no-clown-fiesta.nvim",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
          ensure_installed = {
            "c", "go", "python", "yaml", "json", "lua", "vim", "graphql"
          },
          ignore_install = {
            "javascript", "typescript"
          },
          sync_install = false,
          highlight = {enable = true},
          indent = {enable = false},
          additional_vim_regex_highlighting = false,
        })
      end,
    },
  },
  lazy = false,
  priority = 1000,
  config = function()
    require("no-clown-fiesta").setup({
      transparent = true,
      styles = {
        -- You can set any of the style values specified for `:h nvim_set_hl`
        type = { bold = true },
        lsp = { underline = true },
      },
    })
    local fullbg = "#111a1f"
    vim.cmd.colorscheme('no-clown-fiesta')
    vim.api.nvim_set_hl(0,"LineNr",{fg="#727272"})
    -- vim.api.nvim_set_hl(0,"Visual",{bg="#171717"})
    -- vim.api.nvim_set_hl(0,"Visual",{bg="#829e9c"})
    vim.api.nvim_set_hl(0,"Visual",{bg="#84493b"})
    vim.api.nvim_set_hl(0,"Folded",{bg="none"})
    vim.api.nvim_set_hl(0,"VertSplit",{bg="none",fg="#727272"})
    vim.api.nvim_set_hl(0,"WinSeparator",{bg="none",fg="#727272"})
    vim.api.nvim_set_hl(0,"StatusLine",{bg="none",fg="#727272"})
    vim.api.nvim_set_hl(0,"LazyNormal",{bg=fullbg})
    -- vim.api.nvim_set_hl(0,"MasonNormal",{bg=fullbg})
    vim.api.nvim_set_hl(0,"NormalFloat",{bg=fullbg})
    vim.api.nvim_set_hl(0,"FloatBorder",{bg="none",fg=fullbg})
  end,
}
