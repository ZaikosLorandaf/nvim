return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = { -- LazyLoad telescope when it's actually needed

		-- F.ind F.iles
		{ "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>' },

		-- F.ind H.elp
		{ "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>' },

		-- F.ind Q.uickfix
		{ "<leader>fq", '<cmd>lua require("telescope.builtin").quickfix()<cr>' },

		-- F.ind G.it (files known to git / not ignored or untracked)
		{ "<leader>fg", '<cmd>lua require("telescope.builtin").git_files()<cr>' },

		-- F.ind C.ommit ( checkout )
		{ "<leader>fc", '<cmd>lua require("telescope.builtin").git_commits()<cr>' },

		-- F.ind B.ranch
		{ "<leader>fs", '<cmd>lua require("telescope.builtin").grep_branches()<cr>' },
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
