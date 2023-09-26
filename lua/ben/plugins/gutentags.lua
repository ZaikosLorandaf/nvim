return {
	"ludovicchabant/vim-gutentags",
	-- Only load if ctags are installed
	cond = function()
		return vim.fn.executable("ctags")
	end,
	event = { "BufReadPre", "BufNewFile" },
}
