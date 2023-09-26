return {
	"joaomsa/telescope-orgmode.nvim",
	depends = {
		{
			"nvim-telescope/telescope.nvim",
			branch = "0.1.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		"nvim-orgmode/orgmode",
	},
	lazy = true,
	config = function()
		require("telescope").load_extension("orgmode")
	end,
	keys = {
		-- F.ing O.rgmode
		{ "<leader>fo", '<cmd>lua require("telescope").extensions.orgmode.search_headings()<cr>' },
	},
}
