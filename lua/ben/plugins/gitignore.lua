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
	cond = function()
		return vim.fn.executable("python3") == 1
	end,
	build = function()
		vim.cmd([[UpdateRemotePlugins]])
	end,
	ft = "gitignore",
}
