return {
	"github/copilot.vim",
	event = "VeryLazy",
	config = function()
		vim.cmd([[Copilot enable]])
	end,
	build = function()
		vim.cmd([[Copilot setup]])
	end,
}
