return {
	"APZelos/blamer.nvim",
	-- Only load if linux is the os AND git is installed
	cond = function()
		return (vim.fn.has("linux") == 1) and vim.fn.executable("git")
	end,
	config = function()
		vim.g.blamer_enabled = 1
		vim.g.blamer_delay = 500
		vim.g.blamer_template = "<committer>, <committer-time> • <summary>"
		vim.g.blamer_prefix = ">"
	end,
}
