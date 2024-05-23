return {
  "rmagatti/auto-session",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("auto-session").setup({
      session_lens = {
        bufftypes_to_ignore = {},
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = true,
      }
    })
    vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
      noremap = true, 
    })
  end,
}
