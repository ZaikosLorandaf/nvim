return {
	"rbong/vim-flog",
	-- Only enable if git is installed
	cond = function()
		return vim.fn.executable("git") == 1
	end,
	dependencies = { "tpope/vim-fugitive" },
	keys = {
		{ "<leader>gg", "<cmd>Flogsplit<cr>" }, -- G.it G.raph
	},
}
