return {
	"tpope/vim-fugitive",
	-- Only enable when in a git repo
	cond = function()
		return vim.fn.isdirectory(".git") == 1
	end,
	config = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>")
		vim.keymap.set("n", "<leader>gd", ":Git difftool<CR>")
		vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>")
		vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
	end,
}
