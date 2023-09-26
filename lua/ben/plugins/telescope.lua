return {
	{ -- Main plugin: Telescope
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
		{ -- Telescope extension for orgmode
			"joaomsa/telescope-orgmode.nvim",
			lazy = true,
			config = function()
				require("telescope").load_extension("orgmode")
			end,
			-- This way, telescope doesn't load the extension until it's actually needed
			keys = {
				-- F.ing O.rgmode
				{ "<leader>fo", '<cmd>lua require("telescope").extensions.orgmode.seach_headings()<cr>' },
			},
		},
	},
}
