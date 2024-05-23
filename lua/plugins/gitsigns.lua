return {
	"lewis6991/gitsigns.nvim",
	-- Only enable if git is installed
	cond = function()
		return vim.fn.executable("git") == 1
	end,
	event = { "BufReadPre", "BufNewFile" },
	config = true,
}
