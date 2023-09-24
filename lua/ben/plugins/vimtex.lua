return {
	"lervag/vimtex",
	ft = { "texinfo", "tex", "aux", "bib" },
	config = function()
		vim.g.vimtex_view_general_viewer = "open"
		vim.g.vimtex_view_general_options = "-a zathura"
		vim.g.tex_flavor = "latex"
		vim.g.tex_no_error = 1
		vim.g.tex_conceal = "abdmg"
		vim.api.set_keymap("n", "<C-n>", "<Plug>(vimtex-toc-open)", { noremap = false, silent = true })
	end,
}
