return {
	-- Treesitter optimized colorscheme
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = true,
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
	-- A multi-themed plugin
	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			require("nightfox").setup({
				options = {
					-- Compiled file's destination location
					compile_path = vim.fn.stdpath("cache") .. "/nightfox",
					compile_file_suffix = "_compiled", -- Compiled file suffix
					transparent = true, -- Disable setting background
					terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
					dim_inactive = false, -- Non focused panes set to alternative background
					module_default = true, -- Default enable value for modules
					colorblind = {
						enable = false, -- Enable colorblind support
						simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
						severity = {
							protan = 0, -- Severity [0,1] for protan (red)
							deutan = 0, -- Severity [0,1] for deutan (green)
							tritan = 0, -- Severity [0,1] for tritan (blue)
						},
					},
					styles = { -- Style to be applied to different syntax groups
						-- bold
						-- underline
						-- undercurl	curly underline
						-- underdouble	double underline
						-- underdotted	dotted underline
						-- underdashed	dashed underline
						-- strikethrough
						-- reverse
						-- inverse		same as reverse
						-- italic
						-- standout
						-- altfont
						-- nocombine	override attributes instead of combining them
						-- NONE		no attributes used (used to reset it)
						comments = "italic", -- Value is any valid attr-list value `:help attr-list`
						conditionals = "NONE",
						constants = "bold",
						functions = "italic",
						keywords = "NONE",
						numbers = "NONE",
						operators = "NONE",
						strings = "NONE",
						types = "NONE",
						variables = "NONE",
					},
					inverse = { -- Inverse highlight for different types
						match_paren = true,
						visual = false,
						search = false,
					},
				},
				palettes = {},
				specs = {},
				groups = {},
			})
			vim.cmd([[colo terafox]])
		end,
	},
	-- Backup retro colorscheme
	{
		"djpohly/elly.vim",
		lazy = true,
	},
}
