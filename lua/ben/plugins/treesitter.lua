return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = "windwp/nvim-ts-autotag",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- import nvim-treesitter plugin
			local treesitter = require("nvim-treesitter.configs")

			-- configure treesitter
			treesitter.setup({ -- enable syntax highlighting
				highlight = {
					enable = true,
				},
				-- enable indentation
				indent = { enable = true },
				-- enable autotagging (w/ nvim-ts-autotag plugin)
				autotag = { enable = true },
				-- ensure these language parsers are installed
				ensure_installed = {
					"json",
					"yaml",
					"html",
					"css",
					"javascript",
					"markdown",
					"markdown_inline",
					"graphql",
					"bash",
					"lua",
					"go",
					"gomod",
					"gowork",
					"gosum",
					"latex",
					"bibtex",
					"rnoweb",
					"org",
					"rust",
					"c",
					"cpp",
					"arduino",
					"vim",
					"make",
					"cmake",
					"mermaid",
					"passwd",
					"gpg",
					"regex",
					"awk",
					"sql",
					"ssh_config",
					"sxhkdrc",
					"nix",
					"xml",
					"csv",
					"dockerfile",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"diff",
				},
				-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},
				-- auto install above language parsers
				auto_install = true,
			})
		end,
	},
}
