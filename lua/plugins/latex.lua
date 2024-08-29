return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.

		-- This is necessary for VimTeX to load properly. The "indent" is optional.
		-- Note: Most plugin managers will do this automatically!
		-- filetype plugin indent on

		-- This enables Vim's and neovim's syntax-related features. Without this, some
		-- VimTeX features will not work (see ":help vimtex-requirements" for more info).
		-- Note: Most plugin managers will do this automatically!
		-- syntax enable

		-- Viewer options:
		-- let g:vimtex_view_general_viewer = 'zathura'

		-- vim.g.vimtex_view_method = "zathura"
	end,
}
