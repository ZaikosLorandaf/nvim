return {
	"lewis6991/gitsigns.nvim",
	-- Only load if git is installed
	cond = function()
		return vim.fn.executable("git")
	end,
	event = { "BufReadPre", "BufNewFile" },
	config = true,
}
