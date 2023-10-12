return {
	"tpope/vim-fugitive",
	dependencies = "tpope/vim-rhubarb",
	-- Only enable on systems with git installed
	cond = function()
		return vim.fn.executable("git") == 1
	end,
	-- Only load when using one of the following commands:
	keys = {
		{ "<leader>gs", "<cmd>G<CR>" }, -- G.it S.tatus
		{ "<leader>gd", "<cmd>G difftool<CR>" }, -- G.it D.iff
		{ "<leader>gm", "<cmd>Gvdiffsplit!<CR>" }, -- G.it M.erge
		{ "<leader>gc", "<cmd>G commit<CR>" }, -- G.it C.ommit
		{ "<leader>gu", "<cmd>G push<CR>" }, -- G.it push U.pstream
		{ "<leader>gp", "<cmd>G pull<CR>" }, -- G.it P.ull
		{ "<leader>gf", "<cmd>G fetch<CR>" }, -- G.it F.etch
	},
	config = function()
		-- Use > and < to fix merge conflicts (keep the cursor in the middle of the screen)
		vim.api.nvim_set_keymap("n", ">", "<cmd>diffg //2<cr><cmd>diffupdate<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<", "<cmd>diffg //3<cr><cmd>diffupdate<cr>", { noremap = true, silent = true })
		-- Use } and { to force the entire file
		vim.api.nvim_set_keymap(
			"n",
			"}",
			"<C-w>h<cmd>Gwrite!<cr><cmd>diffupdate<cr>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"{",
			"<C-w>l<cmd>Gwrite!<cr><cmd>diffupdate<cr>",
			{ noremap = true, silent = true }
		)
	end,
}
