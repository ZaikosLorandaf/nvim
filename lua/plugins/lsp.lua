return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			local mason = require("mason")
			local mlsp = require("mason-lspconfig")
			mason.setup({
				ui = {
					icons = {
						package_installed = "",
						package_not_installed = "",
						package_pending = "",
					},
				},
			})
			-- Global so it can be used by both mason and lspconfig ;)
			local myServers = {
				-- LSPs:
				"gopls",
				-- "golangci_lint_ls",
				"lua_ls",
				"bashls",
				-- "graphql",
				-- "texlab",
				"clangd",
				-- "marksman",
				"dockerls",
				-- "ruff_lsp",
				"docker_compose_language_service",
				-- "rust_analyzer",
			}
			mlsp.setup({
				ensure_installed = myServers,
				automatic_installation = false,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			-- Hide inline virtual text and use only the icons for debbuging/tips
			vim.diagnostic.config({
				virtual_text = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "",
						[vim.diagnostic.severity.WARN] = "",
						[vim.diagnostic.severity.HINT] = "󰈈",
						[vim.diagnostic.severity.INFO] = "",
					},
				},
				underline = true,
			})

			local lsp = require("lspconfig")
			local lspCaps = require("cmp_nvim_lsp").default_capabilities()
			local lspMaps = function()
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {
					buffer = 0,
					desc = "Show object description on hover",
				})

				vim.keymap.set(
					"n",
					"<leader>r",
					vim.lsp.buf.rename,
					{ buffer = 0, desc = "Rename object across all occurences" }
				)

				vim.keymap.set(
					"n",
					"gd",
					vim.lsp.buf.definition,
					{ buffer = 0, desc = "Go to the location where the object is defined" }
				)

				vim.keymap.set(
					"n",
					"gt",
					vim.lsp.buf.type_definition,
					{ buffer = 0, desc = "Go to the definition of the objects type" }
				)

				vim.keymap.set(
					"n",
					"gi",
					vim.lsp.buf.implementation,
					{ buffer = 0, desc = "Go to the method implementation" }
				)

				vim.keymap.set(
					"n",
					"gr",
					vim.lsp.buf.references,
					{ buffer = 0, desc = "Go to references of the object" }
				)

				vim.keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, { buffer = 0, desc = "" })
				vim.keymap.set(
					"n",
					"]d",
					vim.diagnostic.goto_next,
					{ buffer = 0, desc = "Go to the next diagnostic/issue" }
				)

				vim.keymap.set(
					"n",
					"[d",
					vim.diagnostic.goto_prev,
					{ buffer = 0, desc = "Go to the previous diagnostic/issue" }
				)

				-- S is the same as cc, I'd rather use it for something more useful
				vim.keymap.set(
					"n",
					"S",
					vim.diagnostic.open_float,
					{ buffer = 0, desc = "View diagnostics information in a floating window" }
				)
			end

			-- Configure every lsp installed and managed by mason
			local myServers = {
				"gopls",
				"golangci_lint_ls",
				"lua_ls",
				"bashls",
				"dockerls",
				"docker_compose_language_service",
				-- "graphql",
				"texlab",
				"ruff_lsp",
				"clangd",
				"marksman",
			}
			for _, server in ipairs(myServers) do
				lsp[server].setup({
					capabilities = lspCaps,
					on_attach = lspMaps,
				})
			end

			-- Non standard language settings:
			lsp.lua_ls.setup({
				capabilities = lspCaps,
				on_attach = lspMaps,
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- -- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostic = {
							-- Get the language server to recognize the `vim` global
							globals = {
								"vim",
								"require",
							},
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lsp.clangd.setup({
				on_attach = function(client)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
					lspMaps()
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd" },
				php = { "pretty-php" },
				go = { "gofumpt", "gci", "goimports" },
				yaml = { "yamlfix" },
				-- graphql = { "prettierd" },
				-- sql = { "sqlfmt" },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"zapling/mason-conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		config = true,
	},
}
