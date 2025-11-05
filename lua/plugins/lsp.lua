return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        event = { "BufReadPre", "BufNewFile" },

    },
    {
        "mason-org/mason.nvim",
        dependencies = {
            "mason-lspconfig.nvim",
            "nvim-lspconfig",
        },
        event = { "BufReadPre", "BufNewFile" },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        -- event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"nvim-telescope/telescope.nvim",
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
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
        -- lspMaps = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {
                buffer = 0,
                desc = "Show object description on hover",
            }),

            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
                buffer = 0,
                desc = "Rename object across all occurences",
            }),

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
                buffer = 0,
                desc = "Go to the location where the object is defined",
            }),

            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
                buffer = 0,
                desc = "Go to the definition of the objects type",
            }),

            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
                buffer = 0,
                desc = "Go to the method implementation",
            }),

            vim.keymap.set("n", "gr", vim.lsp.buf.references, {
                buffer = 0,
                desc = "Go to references of the object",
            }),

            vim.keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, {
                buffer = 0,
                desc = "",
            }),

            vim.keymap.set("n", "]d",
                function() -- GoTo Next diag.
                    vim.diagnostic.jump({
                        count = 1,
                        float = true,
                    })
                end, {
                    buffer = 0,
                    desc = "Go to the next diagnostic/issue",
                }),

            vim.keymap.set("n", "[d",
                function() -- GoTo Next diag.
                    vim.diagnostic.jump({
                        count = -1,
                        float = true,
                    })
                end, {
                    buffer = 0,
                    desc = "Go to the previous diagnostic/issue",
                }),

            -- S is the same as cc, I'd rather use it for something more useful
            vim.keymap.set("n", "S", vim.diagnostic.open_float, {
                buffer = 0,
                desc = "View diagnostics information in a floating window",
            }),
        -- end,

        config = function()
            local lspCaps = require("cmp_nvim_lsp").default_capabilities()
            local myServers = {
                "bashls",
                "clangd",
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
                "zls",
            }
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = myServers,
                automatic_installation = true,
            })

            for _, server in ipairs(myServers) do
                capabilities = lspCaps
                on_attach = lspMaps
            end
        end,

    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>fc",
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
                graphql = { "prettierd" },
                sql = { "sqlfmt" },
            },
            -- Set up format-on-save
            -- format_on_save = { timeout_ms = 500, lsp_format = "fallback" },

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
}


-- vim.lsp.lua_ls.setup({
--     capabilities = lspCaps,
--     on_attach = lspMaps,
--     settings = {
--         Lua = {
--             runtime = {
--                 -- Tell the language server which version of Lua you're using
--                 -- -- (most likely LuaJIT in the case of Neovim)
--                 version = "Lua5.4",
--             },
--             diagnostic = {
--                 -- Get the language server to recognize the `vim` global
--                 globals = {
--                     "vim",
--                     "require",
--                 },
--             },
--             workspace = {
--                 checkThirdParty = false,
--                 library = vim.api.nvim_get_runtime_file("", true),
--             },
--             telemetry = {
--                 enable = false,
--             },
--         },
--     },
-- })
--
-- vim.lsp.clangd.setup({
--     on_attach = function(client)
--         client.server_capabilities.documentFormattingProvider = false
--         client.server_capabilities.documentRangeFormattingProvider = false
--         lspMaps()
--     end,
-- })
--
-- vim.lsp.zls.setup({
--     settings = {
--         zls = {
--             fmt_autosave = 0,
--         },
--     },
-- })
--
-- vim.lsp.pyright.setup({
--     settings = {
--         pyright = {
--             disableOrganizeImports = true, -- Using Ruff
--         },
--         python = {
--             analysis = {
--                 ignore = { "*" }, -- Using Ruff
--                 typeCheckingMode = "off", -- Using mypy
--             },
--         },
--     },
-- })
