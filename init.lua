--  _       _ _     _
-- (_)_ __ (_) |_  | |_   _  __ _
-- | | '_ \| | __| | | | | |/ _` |
-- | | | | | | |_ _| | |_| | (_| |
-- |_|_| |_|_|\__(_)_|\__,_|\__,_|
--
require("core")
require("core.langmap")

-- Lazy Plugins Bootstrap {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "git@github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    { import = "plugins" }, -- i.e. the lua/plugins directory
    -- add more subdirectories as needed
  }, {
    install = { colorscheme = { "no-clown-fiesta" }, }
  }, {
    checker = {
      enabled = true,
      notify = false,
    },
    change_detection = {
      notify = false,
    },
})
-- }}}
