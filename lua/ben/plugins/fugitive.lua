return {
	"tpope/vim-fugitive",
	dependencies = "tpope/vim-rhubarb",
	-- Only enable on systems with git installed
	cond = function()
		return vim.fn.executable("git") == 1
	end,
	-- Only load when using one of the following commands:
	keys = {
		{ "<leader>gs", "<cmd>G<CR>" }, -- G.it S.tatus
		{ "<leader>gd", "<cmd>G difftool<CR>" }, -- G.it D.iff
		{ "<leader>gm", "<cmd>Gvdiffsplit!<CR>" }, -- G.it M.erge
		{ "<leader>gc", "<cmd>G commit<CR>" }, -- G.it C.ommit
		{ "<leader>gu", "<cmd>G push<CR>" }, -- G.it push U.pstream
		{ "<leader>gp", "<cmd>G pull<CR>" }, -- G.it P.ull
	},
}
