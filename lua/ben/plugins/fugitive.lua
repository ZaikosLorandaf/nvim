return {
	"tpope/vim-fugitive",
	-- Only enable when in a git repo
	cond = function()
		return vim.fn.isdirectory(".git") == 1
	end,
	config = function()
		vim.keymap.set("n", "<leader>gs", ":G<CR>")
		vim.keymap.set("n", "<leader>gd", ":G difftool<CR>")
		vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>")
		vim.keymap.set("n", "<leader>gc", ":G commit<CR>")
		vim.keymap.set("n", "<leader>gbb", ":GBrowse<CR>")
		vim.keymap.set("n", "<leader>gps", ":G push<CR>")
		vim.keymap.set("n", "<leader>gpl", ":G pull<CR>")
	end,
}
