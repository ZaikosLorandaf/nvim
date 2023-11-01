return {
  "lambdalisue/fern.vim",
  dependencies = {
    "TheLeoP/fern-renderer-web-devicons.nvim",
    "lambdalisue/fern-git-status.vim",
    "lambdalisue/fern-hijack.vim",
    "lambdalisue/fern-bookmark.vim",
    "lambdalisue/fern-ssh",
  },
  config = function()
    vim.g["fern#renderer"] = "nvim-web-devicons"
    -- Store bookmarks in $XDG_CONFIG_HOME/nvim/fern-bookmarks
    vim.g["fern#scheme#bookmark#store#file"] = vim.fn.stdpath("config") .. "/fern-bookmarks"
  end,
  keys = {
    { "<leader>fm", "<cmd>Fern -drawer .<cr>" },
    { "<leader>fb", "<cmd>Fern bookmark:///<cr>" },
  },
}
