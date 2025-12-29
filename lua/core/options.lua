vim.opt.encoding = "utf-8"
vim.opt.wildmenu = false -- Show matches with tab-completion
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.lazyredraw = true
vim.opt.laststatus = 0
vim.opt.showmode = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.conceallevel = 2
vim.opt.foldmethod = "marker" --- For `{{{` & `}}}` folding
vim.opt.complete:append("kspell")
vim.opt.inccommand = "split"
vim.opt.winborder = "rounded"

-- why does french exist...
vim.opt.spelllang = "fr"



-- Netrw preferences when not using lf
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"


