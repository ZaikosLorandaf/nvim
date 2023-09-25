return {
	"rbong/vim-flog",
	dependencies = { "tpope/vim-fugitive" },
	keys = {
		{ "<leader>gg", "<cmd>Flog<cr>" }, -- G.it G.raph
		{ "<leader>gv", "<cmd>Flogsplit<cr>" }, -- G.it V.ertical
	},
}
