return {
	"tpope/vim-fugitive",
	dependencies = "tpope/vim-rhubarb",
	-- Only enable when in a git repo
	keys = {
		{ "<leader>gs", "<cmd>G<CR>" }, -- G.it S.tatus
		{ "<leader>gd", "<cmd>G difftool<CR>" }, -- G.it D.iff
		{ "<leader>gm", "<cmd>Gvdiffsplit!<CR>" }, -- G.it M.erge
		{ "<leader>gc", "<cmd>G commit<CR>" }, -- G.it C.ommit
		{ "<leader>gpu", "<cmd>G push<CR>" }, -- G.it P.ush U.pstream
		{ "<leader>gpl", "<cmd>G pull<CR>" }, -- G.it P.ull L.atest
	},
}
