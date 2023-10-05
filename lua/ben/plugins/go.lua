return {
	"ray-x/go.nvim",
	-- Only if Go is installed
	cond = function()
		return vim.fn.executable("go")
	end,
	dependencies = { -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"ray-x/guihua.lua",
	},
	config = function()
		require("go").setup()
		-- Go keymaps
		vim.api.nvim_set_keymap("n", "<Space>gb", "<cmd>GoBuild<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Space>gr", "<cmd>GoRun<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<Space>gd", "<cmd>GoDoc<cr>", { noremap = true, silent = true })
		-- Commands to run on save:
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				-- Go format:
				require("go.format").gofmt()
				-- Goimports:
				require("go.format").goimport()
			end,
			group = format_sync_grp,
		})
	end,
	ft = { "go", "gomod", "gowork", "gosum" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
