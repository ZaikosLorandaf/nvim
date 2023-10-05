return {
	-- Treesitter optimized colorscheme
	{
		"neanias/everforest-nvim",
		priority = 1000,
		version = false,
		config = function()
			require("everforest").setup({
				background = "hard",
				italics = true,
				transparent_background_level = 2,
			})
			require("everforest").load()
		end,
	},
	-- My very own colorscheme
	{
		"ChausseBenjamin/friffle-vim",
		lazy = true,
		config = function()
			vim.cmd([[syntax on]]) -- Enable vim syntax
			vim.cmd([[set tgc]]) -- Terminal GUI Colors
			vim.cmd([[set lz]]) -- Lazy redraw
			vim.cmd([[set t_Co=256]]) -- 256 Colors
			vim.cmd([[colo friffle]]) -- Set the colorscheme
			vim.cmd([[hi Normal guibg=NONE]])
			vim.cmd([[hi CursorLineNr guibg=NONE]])
			vim.cmd([[hi Constant guibg=NONE]])
			vim.cmd([[hi Conceal guibg=NONE]])
			vim.cmd([[hi Folded guibg=NONE]])
			vim.cmd([[hi ColorColumn guibg='#738c9c']])
			vim.cmd([[hi Todo guibg='#acb3b5' guifg='#340001']])
			vim.cmd([[hi Search guifg='#810002' guibg='#738c9c']])
		end,
	},
	-- Backup retro colorscheme
	{
		"djpohly/elly.vim",
		lazy = true,
	},
}
