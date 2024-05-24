return {
  "simeji/winresizer",
  config = function()
    vim.keymap.set("n", "<C-a>", "<Cmd>WinResizerStartResize<CR>" )
  end,
  keys = {"<C-a>"},
}
