vim.g.mapleader = " "
vim.opt.encoding = "utf-8"
vim.opt.wildmenu = true -- Show matches with tab-completion
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
vim.opt.spelllang = "fr" -- why does french exist...
vim.api.nvim_set_keymap("n", "Y", "y$", {}) -- What should have been `Y`
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {}) -- terminal mode Esc

vim.keymap.set("v", "<s-l>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<s-h>", ":m '<-2<cr>gv=gv")

-- Netrw preferences when not using lf
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"

-- Clear search highlights
vim.keymap.set("n", "<leader><leader>l", "<cmd>nohlsearch<cr>")

-- Don't mess with pasted text
vim.keymap.set("i", "<C-r>", "<C-r><C-o>")

-- Remove trailing whitespace (except current line to avoid moving cursor)
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		pcall(function()
			vim.cmd([[%s/\s\+$//e]])
		end)
		vim.fn.setpos(".", save_cursor)
	end,
})

-- Quickly compile and preview files
vim.keymap.set("n", "<leader>c", "<cmd>make<cr>")
-- vim.keymap.set("n", "<leader>o", "<cmd>!opout %<cr>")
-- Make sure I don't accidentally delete with 'S' when not using an LSP:
vim.keymap.set("n", "S", "<nop>")
-- Stop hurting my pinky with <C-w>:
vim.keymap.set("n", "<leader>w", "<C-w>")
-- Quickly navigate between Tabs
vim.keymap.set("n", "<Tab>", "<cmd>tabnext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>tabnew<cr>")
