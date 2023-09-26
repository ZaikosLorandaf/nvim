return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = { -- LazyLoad telescope when it's actually needed

		-- F.ind F.iles
		{ "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>' },

		-- F.ind B.uffers
		{ "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>' },

		-- F.ind G.it
		{ "<leader>fg", '<cmd>lua require("telescope.builtin").git_files()<cr>' },

		-- F.ind H.elp
		{ "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>' },

		-- F.ind Q.uick F.ix
		{ "<leader>fqf", '<cmd>lua require("telescope.builtin").quickfix()<cr>' },

		-- F.ind C.olor S.cheme
		{ "<leader>fcs", '<cmd>lua require("telescope.builtin").colorscheme()<cr>' },
	},
}
