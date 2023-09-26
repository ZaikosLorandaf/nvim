return {
	"tpope/vim-fugitive",
	-- Only load if git is installed
	cond = function()
		return vim.fn.executable("git")
	end,
	dependencies = "tpope/vim-rhubarb",
	-- Only enable when in a git repo
	keys = {
		{ "<leader>gs", "<cmd>G<CR>" }, -- G.it S.tatus
		{ "<leader>gd", "<cmd>G difftool<CR>" }, -- G.it D.iff
		{ "<leader>gm", "<cmd>Gvdiffsplit!<CR>" }, -- G.it M.erge
		{ "<leader>gc", "<cmd>G commit<CR>" }, -- G.it C.ommit
		{ "<leader>gu", "<cmd>G push<CR>" }, -- G.it push U.pstream
		{ "<leader>gp", "<cmd>G pull<CR>" }, -- G.it P.ull
	},
}
