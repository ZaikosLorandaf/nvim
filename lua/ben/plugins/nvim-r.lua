return {
	"jalvesaq/Nvim-R",
	ft = { "R", "Rnoweb", "tex", "aux", "bib" },
	config = function()
		vim.g.r_syntax_folding = 1
		vim.opt.foldnestmax = 1
		vim.opt.foldmethod = "marker"
		vim.g.rout_follow_colorscheme = 0
	end,
}
