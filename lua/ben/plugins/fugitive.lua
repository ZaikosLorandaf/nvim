return {
	"tpope/vim-fugitive",
	-- Only enable when in a git repo
	cond = function()
		return vim.fn.isdirectory(".git") == 1
	end,
}
