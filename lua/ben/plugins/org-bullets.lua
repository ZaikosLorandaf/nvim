return {
	"akinsho/org-bullets.nvim",
	dependencies = {
		{
			"nvim-orgmode/orgmode",
			dependencies = "nvim-treesitter/nvim-treesitter",
		},
	},
	-- Only load org-bullets while in actual org files
	ft = { "org" },
	config = function()
		require("org-bullets").setup({
			symbols = {
				concealcursor = false,
				list = "",
				headlines = { "◉", "○", "󰮍", "󱥸" },
				checkboxes = {
					half = { "", "OrgTSCheckboxHalfChecked" },
					done = { "", "OrgTSCheckboxDone" },
					todo = { "", "OrgTSCheckboxTODO" },
				},
			},
		})
	end,
}
