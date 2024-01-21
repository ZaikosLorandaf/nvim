return {

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- import mason
      local mason = require("mason")

      -- import mason-lspconfig
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
          },
        },
      })

      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = {
          "ast_grep",                        -- fallback
          "lua_ls",                          -- lua
          "autotools_ls",                    -- Makefile
          "dockerls",                        -- dockerfiles
          "docker_compose_language_service", -- docker-compose
          "marksman",                        -- markdown
          "gopls",                           -- go
          "texlab",                          -- latex
          "pyre",                            -- python
          "r_language_server",               -- r
          "rust_analyzer",                   -- rust
          "mutt_ls",                         -- mutt
          "taplo",                           -- toml
          "yamlls",                          -- yaml
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true,
      })

      -- configure mason tool installer
      mason_tool_installer.setup({
        ensure_installed = {
          "isort",            -- python import formatter
          "goimports",        -- go import formatter
          "doctoc",           -- markdown table of contents generator
          "go-debug-adapter", -- go debugger
          "codelldb",         -- c/c++ debugger
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")

      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap

      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr)
        opts.buffer = bufnr

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- change diagnostic symbols in sign column
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- configure lua server (with special settings)
      lspconfig["lua_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- configure dockerfile server
      lspconfig["dockerls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure docker-compose server
      lspconfig["docker_compose_language_service"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure markdown server
      lspconfig["marksman"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure golang server
      lspconfig["gopls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure LaTeX server
      lspconfig["texlab"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure LaTeX server
      lspconfig["texlab"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure python server
      lspconfig["pyre"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure R server
      lspconfig["r_language_server"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure R server
      lspconfig["r_language_server"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure mutt server
      lspconfig["mutt_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure toml server
      lspconfig["taplo"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure Makefile server
      lspconfig["autotools_ls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure fallback server
      lspconfig["ast_grep"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- configure yaml server
      lspconfig["yamlls"].setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          yaml = {
            schemas = {
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              ["../path/relative/to/file.yml"] = "/.github/workflows/*",
              ["/path/from/root/of/project"] = "/.github/workflows/*",
            },
          },
        },
      })
    end,
  },
}
