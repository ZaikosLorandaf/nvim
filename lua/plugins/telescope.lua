return {
	"nvim-telescope/telescope.nvim",
	tag = "latest",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		-- { "sharkdp/fd" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "stevearc/dressing.nvim" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.load_extension("fzf")
	end,

	keys = {
		-- P.aruse F.iles
		{ "<leader>pf", '<cmd>lua require("telescope.builtin").find_files()<cr>' },
		-- P.aruse A.ll
		{ "<leader>pa", '<cmd>lua require("telescope.builtin").find_files({hidden=true})<cr>' },
		-- P.aruse B.uffers
		{ "<leader>pb", '<cmd>lua require("telescope.builtin").buffers()<cr>' },
		-- P.aruse with G.rep
		{ "<leader>pg", '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
		-- P.roject S.earch
		{ "<leader>ps", '<cmd>lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ")})<cr>' },
		-- F.ind Q.uickfix
		{ "<leader>qf", '<cmd>lua require("telescope.builtin").quickfix()<cr>' },
		-- Find Git (files known to git / not ignored or untracked)
		{ "<C-p>", '<cmd>lua require("telescope.builtin").git_files()<cr>' },
		-- F.ind B.ranch
		{ "<leader>fb", '<cmd>lua require("telescope.builtin").grep_branches()<cr>' },
		-- F.ix L.ist
		{ "<leader>fl", "<cmd>Telescope diagnostics<cr>" },
		-- F.ind R.eferences
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>" },
	},
}
