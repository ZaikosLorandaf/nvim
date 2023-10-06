return {
	"iamcco/markdown-preview.nvim",
	ft = { "markdown", "pandoc.markdown", "rmd" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.g.mkdp_auto_start = 0
		vim.g.mkdp_auto_close = 1
		vim.g.mkdp_auto_update = 1
		vim.g.mkdp_refresh_slow = 1
		vim.g.mkdp_command_for_global = 0
		vim.g.mkdp_open_to_the_world = 0
		vim.g.mkdp_open_ip = ""
		vim.g.mkdp_browser = ""
		vim.g.mkpd_echo_preview_url = 0
		vim.g.mkdp_browser_func = ""
		vim.g.mkdp_preview_options = {
			mkit = {},
			katex = {},
			uml = {},
			maid = {},
			disable_sync_scroll = 0,
			sync_scroll_type = "middle",
			hide_yaml_meta = 1,
			sequence_diagrams = {},
			flowchart_diagrams = {},
			content_editable = false,
			disable_filename = 0,
			toc = {},
		}
		vim.g.mkdp_markdown_css = ""
		vim.g.mkdp_highlight_css = ""
		vim.g.mkpd_port = ""
		vim.g.mkdp_page_title = "「${name}」"
		vim.g.mkpd_filetypes = { "markdown", "pandoc.markdown", "rmd" }
		vim.g.mkdp_theme = "dark"
		-- Keymaps
		vim.api.nvim_set_keymap("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader>mk", "<Plug>MarkdownPreviewStop", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader>mi", "<Plug>MarkdownPreview", { silent = true })
	end,
}
