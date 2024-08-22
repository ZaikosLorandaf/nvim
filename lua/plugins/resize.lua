return {
	"simeji/winresizer",
	config = function()
		vim.g.winresizer_vert_resize = 13
		vim.g.winresizer_horiz_resize = 10
	end,
	keys = {
		{ "<leader><leader>w", "<Cmd>WinResizerStartResize<CR>" },
	},
}
