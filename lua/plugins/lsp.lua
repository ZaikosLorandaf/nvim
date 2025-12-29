return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"clangd",
				"denols",
				"dockerls",
				"docker_compose_language_service",
				"golangci_lint_ls",
				"gopls",
				"graphql",
				"jdtls",
				"lua_ls",
				"marksman",
				"pyright",
				"ruff",
				"rust_analyzer",
				"texlab",
				"tinymist",
				"zls",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"clang-format",
				"stylua",
				"terraform",
				"beautysh",
				"gofumpt",
				"goimports",
				"typstyle",
			},
			auto_update = false,
			run_on_start = true, -- Install missing tools when Neovim starts
		},
	},
	{
		"neovim/nvim-lspconfig",
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
		}),
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fc",
				function()
					-- require("conform").format({ async = true, lsp_format = "fallback" })
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				c = { "clang_format" },
				cpp = { "clang_format" },
				lua = { "stylua" },
				javascript = { "prettierd" },
				php = { "pretty_php" },
				go = { "gofumpt", "gci", "goimports" },
				yaml = { "yamlfix" },
				graphql = { "prettierd" },
				sql = { "sqlfmt" },
			},
			-- Set up format-on-save
			-- format_on_save = { timeout_ms = 500, lsp_format = "fallback" },

			-- Customize formatters
			formatters = {
				shfmt = { prepend_args = { "-i", "2" } },
				clang_format = {
					prepend_args = { "--style=file", "--fallback-style=llvm" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}

-- servers = {
-- 	["*"] = {
-- 		keys = {
-- 			{
-- 				"K",
-- 				vim.lsp.buf.hover,
-- 				buffer = 0,
-- 				desc = "Show object description on hover",
-- 			},
-- 			{
-- 				"S",
-- 				vim.diagnostic.open_float,
-- 				buffer = 0,
-- 				desc = "View diagnostics information in a floating window",
-- 			},
-- 			{
-- 				"<leader>r",
-- 				vim.lsp.buf.rename,
-- 				buffer = 0,
-- 				desc = "Rename object across all occurences",
-- 			},
-- 			{
-- 				"gd",
-- 				vim.lsp.buf.definition,
-- 				buffer = 0,
-- 				desc = "Go to the location where the object is defined",
-- 			},
-- 			{
-- 				"gt",
-- 				vim.lsp.buf.type_definition,
-- 				buffer = 0,
-- 				desc = "Go to the definition of the objects type",
-- 			},
-- 			{
-- 				"gi",
-- 				vim.lsp.buf.implementation,
-- 				buffer = 0,
-- 				desc = "Go to the method implementation",
-- 			},
-- 			{
-- 				"gr",
-- 				vim.lsp.buf.references,
-- 				buffer = 0,
-- 				desc = "Go to references of the object",
-- 			},
-- 			{
-- 				"<leader>fa",
-- 				vim.lsp.buf.code_action,
-- 				buffer = 0,
-- 				desc = "",
-- 			},
-- 			{
-- 				"]d",
-- 				function() -- GoTo Next diag.
-- 					vim.diagnostic.jump({
-- 						count = 1,
-- 						float = true,
-- 					})
-- 				end,
-- 				buffer = 0,
-- 				desc = "Go to the next diagnostic/issue",
-- 			},
-- 			{
-- 				"[d",
-- 				function() -- GoTo Prev diag.
-- 					vim.diagnostic.jump({
-- 						count = -1,
-- 						float = true,
-- 					})
-- 				end,
-- 				buffer = 0,
-- 				desc = "Go to the previous diagnostic/issue",
-- 			},
-- 		},
-- 	},
-- },
