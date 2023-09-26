return {
	"jalvesaq/Nvim-R",
	-- Only enable if R is installed
	cond = function()
		return vim.fn.executable("R") == 1
	end,
	ft = { "R", "Rnoweb", "tex", "aux", "bib" },
	config = function()
		vim.g.r_syntax_folding = 1
		vim.opt.foldnestmax = 1
		vim.opt.foldmethod = "marker"
		vim.g.rout_follow_colorscheme = 0
	end,
}
