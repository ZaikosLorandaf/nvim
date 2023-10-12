return {
	"theniceboy/fzf-gitignore",
	dependencies = {
		{
			"junegunn/fzf",
			build = function()
				vim.fn["fzf#install"]()
			end,
		},
	},
	build = function()
		vim.cmd([[UpdateRemotePlugins]])
	end,
	filetype = "gitignore",
	keys = {
		{ "<leader>gi", "<cmd>FzfGitignore<cr>" },
	},
}
