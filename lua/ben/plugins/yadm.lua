return {
	"robstumborg/yadm.nvim",
	-- Only load if yadm is installed
	cond = function()
		return vim.fn.executable("yadm")
	end,
	config = function()
		require("yadm").setup({
			yadm_dir = vim.fn.expand("$XDG_DATA_HOME/yadm/repo.git"),
		})
	end,
}
