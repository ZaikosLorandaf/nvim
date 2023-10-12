return {
	"pschitt/telescope-yadm.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	cond = function()
		return vim.fn.executable("yadm") == 1
	end,
	config = function()
		require("telescope").load_extension("yadm_files")
		require("telescope").load_extension("git_or_yadm_files")
	end,
	keys = {
		{ "<leader>fy", "<cmd>Telescope yadm_files<cr>" },
	},
}
