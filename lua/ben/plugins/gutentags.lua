return {
	"ludovicchabant/vim-gutentags",
	-- Only enable if ctags is installed
	condition = function()
		return vim.fn.executable("ctags") == 1
	end,
	event = { "BufReadPre", "BufNewFile" },
}
