return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "no-clown-fiesta",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        globalstatus = false,
        ignore_focus = {},
        always_divide_middle = true,
        refresh = {
          statusline = 500,
          tabline = 500,
          winbar = 500,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      extensions = {'fugitive'},
    })
    -- Remove duplicate information that clutters the bottom of the screen
    -- "-- INSERT --" on the left:
    vim.opt.showmode = false
    -- "100%" linenr/col on the right:
    vim.opt.ruler = false
    -- commands on the right:
    vim.opt.showcmd = false
  end,
}
