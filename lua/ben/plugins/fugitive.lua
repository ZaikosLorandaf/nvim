return {
	"tpope/vim-fugitive",
	dependencies = "tpope/vim-rhubarb",
	-- Only enable when in a git repo
	cond = function()
		return vim.fn.isdirectory(".git") == 1
	end,
	config = function()
		vim.keymap.set("n", "<leader>gs", ":G<CR>") -- G.it S.tatus
		vim.keymap.set("n", "<leader>gd", ":G difftool<CR>") -- G.it D.iff
		vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>") -- G.it M.erge
		vim.keymap.set("n", "<leader>gc", ":G commit<CR>") -- G.it C.ommit
		vim.keymap.set("n", "<leader>gpu", ":G push<CR>") -- G.it P.ush U.pstream
		vim.keymap.set("n", "<leader>gpl", ":G pull<CR>") -- G.it P.ull L.atest
	end,
}
