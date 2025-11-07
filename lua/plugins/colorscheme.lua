return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        version = false,
        priority = 1000,
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function()
                    local configs = require("nvim-treesitter.configs")
                    ---@diagnostic disable-next-line: missing-fields
                    configs.setup({
                        -- List of languages in-> :h
                        ensure_installed = {
                            "bash",
                            "c",
                            "dockerfile",
                            "gitignore",
                            "go",
                            "json",
                            "java",
                            "javascript",
                            "sxhkdrc",
                            "lua",
                            "markdown",
                            "mermaid",
                            "python",
                            "r",
                            "rnoweb",
                            "rust",
                            "vim",
                            "vimdoc",
                            "yaml",
                            "xml",
                            -- others
                            "sxhkdrc",
                            "zathurarc",
                        },
                        ignore_install = {
                            "graphql",
                            "typescript",
                        },
                        sync_install = false,
                        highlight = { enable = true },
                        indent = { enable = false },
                        additional_vim_regex_highlighting = false,
                    })
                end,
            },
        },
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                palette = {
                    -- Override the builtin palette per variant
                    -- moon = {
                    --     base = '#18191a',
                    --     overlay = '#363738',
                    -- },
                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })

            local fullbg = "#111a1f"
            vim.cmd.colorscheme("rose-pine")
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#727272" })
            -- vim.api.nvim_set_hl(0,"Visual",{bg="#171717"})
            -- vim.api.nvim_set_hl(0,"Visual",{bg="#829e9c"})
            vim.api.nvim_set_hl(0, "Visual", { bg = "#84493b" })
            vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "LazyNormal", { bg = fullbg })
            -- vim.api.nvim_set_hl(0,"MasonNormal",{bg=fullbg})
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = fullbg })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = fullbg })
        end,
    },
    {
        "neanias/everforest-nvim",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function()
                    local configs = require("nvim-treesitter.configs")
                    ---@diagnostic disable-next-line: missing-fields
                    configs.setup({
                        -- List of languages in-> :h
                        ensure_installed = {
                            "c",
                            "go",
                            "bash",
                            "lua",
                            "python",
                            "vim",
                            "vimdoc",
                            "gitignore",
                            "mermaid",
                            "markdown",
                            "rnoweb",
                            "r",
                            "rust",
                            "dockerfile",
                            "yaml",
                            "json",
                            "xml",
                            "sxhkdrc",
                            "zathurarc",
                            "javascript",
                        },
                        ignore_install = {
                            "graphql",
                            "typescript",
                        },
                        sync_install = false,
                        highlight = { enable = true },
                        indent = { enable = false },
                        additional_vim_regex_highlighting = false,
                    })
                end,
            },
        },
        version = false,
        -- lazy = false,
        -- priority = 1000, -- make sure to load this vefore all others
        -- Optional configs
        config = function()
            require("everforest").setup({
                -- My config
                transparent_background_level = 2,
                -- transparent = true,
                styles = {
                    -- You can set any of the style values specified for `:h nvim_set_hl`
                    type = { bold = true },
                    lsp = { underline = true },
                    keywords = { italic = true },
                },
            })
            local fullbg = "#111a1f"
            -- vim.cmd.colorscheme("everforest")
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#727272" })
            -- vim.api.nvim_set_hl(0,"Visual",{bg="#171717"})
            -- vim.api.nvim_set_hl(0,"Visual",{bg="#829e9c"})
            vim.api.nvim_set_hl(0, "Visual", { bg = "#84493b" })
            vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "LazyNormal", { bg = fullbg })
            -- vim.api.nvim_set_hl(0,"MasonNormal",{bg=fullbg})
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = fullbg })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = fullbg })
        end,
    },
    { -- No nonsense, very stoic
        "aktersnurra/no-clown-fiesta.nvim",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter",
                build = ":TSUpdate",
                config = function()
                    local configs = require("nvim-treesitter.configs")
                    ---@diagnostic disable-next-line: missing-fields
                    configs.setup({
                        -- List of languages in-> :h
                        ensure_installed = {
                            "c",
                            "go",
                            "bash",
                            "lua",
                            "python",
                            "vim",
                            "vimdoc",
                            "gitignore",
                            "mermaid",
                            "markdown",
                            "rnoweb",
                            "r",
                            "rust",
                            "dockerfile",
                            "yaml",
                            "json",
                            "xml",
                            "sxhkdrc",
                            "zathurarc",
                            "javascript",
                        },
                        ignore_install = {
                            "graphql",
                            "typescript",
                        },
                        sync_install = false,
                        highlight = { enable = true },
                        indent = { enable = false },
                        additional_vim_regex_highlighting = false,
                    })
                end,
            },
        },
        lazy = true,
        -- priority = 1000,
        config = function()
            require("no-clown-fiesta").setup({
                transparent = true,
                styles = {
                    -- You can set any of the style values specified for `:h nvim_set_hl`
                    type = { bold = true },
                    lsp = { underline = true },
                    keywords = { italic = true },
                    comments = { italic = true },
                },
            })
            local fullbg = "#111a1f"
            -- vim.cmd.colorscheme("no-clown-fiesta")
            vim.api.nvim_set_hl(0, "LineNr", { fg = "#727272" })
            -- vim.api.nvim_set_hl(0,"Visual",{bg="#171717"})
            -- vim.api.nvim_set_hl(0,"Visual",{bg="#829e9c"})
            vim.api.nvim_set_hl(0, "Visual", { bg = "#84493b" })
            vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
            vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = "#727272" })
            vim.api.nvim_set_hl(0, "LazyNormal", { bg = fullbg })
            -- vim.api.nvim_set_hl(0,"MasonNormal",{bg=fullbg})
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = fullbg })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = fullbg })
        end,
    },
}
