return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
  keys = {

    { -- Floating Oil window
      "<leader>-",
      function()
        require("oil").toggle_float()
      end,
      mode = "n",
      desc = "Toggle floating Oil window",
    },

    -- { -- Open parent directory
    --   "-",
    --   "<cmd>Oil<CR>",
    --   mode = "n",
    --   desc = "Open parent directory",
    -- },
  },
}
