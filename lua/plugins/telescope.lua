return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = { -- LazyLoad telescope when it's actually needed

		-- P.roject F.iles
		{ "<leader>pv", '<cmd>lua require("telescope.builtin").find_files()<cr>' },

		-- P.roject S.earch
		{  "<leader>ps", '<cmd>lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ")})<cr>' },


		-- F.ind Q.uickfix
		{ "<leader>qf", '<cmd>lua require("telescope.builtin").quickfix()<cr>' },

		-- F.ind G.it (files known to git / not ignored or untracked)
		{ "<C-p>", '<cmd>lua require("telescope.builtin").git_files()<cr>' },

		-- F.ind B.ranch
		{ "<leader>fb", '<cmd>lua require("telescope.builtin").grep_branches()<cr>' },
	},
	cmd = {
		"Telescope",
		"TelescopeFindFiles",
		"TelescopeFindHelp",
		"TelescopeQuickfix",
		"TelescopeGitFiles",
		"TelescopeGitCommits",
		"TelescopeGrepBranches",
	},
}
