vim.g.mapleader=" "
vim.opt.encoding="utf-8"
vim.opt.wildmenu=true -- Show mathes with tab-completion
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.ruler=true
-- vim.opt.laststatus=0
vim.opt.laststatus=3
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.tabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true
vim.opt.foldmethod="marker" --- For `{{{` & `}}}` folding
vim.opt.complete:append("kspell")
vim.opt.spelllang="fr" -- why does french exist...
vim.api.nvim_set_keymap("n","Y","y$", {}) -- What should have been `Y`
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {}) -- terminal mode Esc

vim.keymap.set("v", "<s-l>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<s-h>", ":m '<-2<cr>gv=gv")

-- Netrw preferences when not using lf
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- Navigate splits
vim.keymap.set("n", "<C-S-h>", "<C-w>h")
vim.keymap.set("n", "<C-S-j>", "<C-w>j")
vim.keymap.set("n", "<C-S-k>", "<C-w>k")
vim.keymap.set("n", "<C-S-l>", "<C-w>l")

-- Clear search highlights
vim.keymap.set("n", "<C-/>", ":nohlsearch<cr>")
