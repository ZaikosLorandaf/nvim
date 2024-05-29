return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local mason = require('mason')
      local mlsp = require('mason-lspconfig')
      mason.setup({
        ui = {
          icons = {
            package_installed = "",
            package_not_installed = "",
            package_pending = "",
          }
        }
      })
      -- Global so it can be used by both mason and lspconfig ;)
      local myServers = {
        "gopls",
        "golangci_lint_ls",
        "lua_ls",
        "bashls",
        "graphql",
        "texlab",
        "clangd",
        "marksman",
        "dockerls",
        "ruff_lsp",
        "docker_compose_language_service",
        "rust_analyzer",
      }
      mlsp.setup({
        ensure_installed = myServers,
        automatic_installation = false,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    veryLazy = true,
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "nvim-telescope/telescope.nvim",
    },
    config = function()

      -- Use icons in the sidebar
      local signs = { Error="", Warn ="", Hint ="󰈈", Info ="" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
      end
      -- Hide inline virtual text and use only the icons for debbuging/tips
      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true
      })

      local lsp = require('lspconfig')
      local lspCaps = require('cmp_nvim_lsp').default_capabilities()
      local lspMaps = function()

        vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0,
          desc = "Show object description on hover"})

        vim.keymap.set("n", "<leader>r",  vim.lsp.buf.rename, {buffer=0,
          desc = "Rename object across all occurences"})

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0,
          desc = "Go to the location where the object is defined"})

        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0,
          desc = "Go to the definition of the objects type"})

        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0,
					desc = "Go to the method implementation"})

        vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0,
					desc = "Go to references of the object"})

        vim.keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, {buffer=0,
					desc = ""})
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {buffer=0,
					desc = "Go to the next diagnostic/issue"})

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {buffer=0,
					desc = "Go to the previous diagnostic/issue"})

        -- S is the same as cc, I'd rather use it for something more useful
        vim.keymap.set("n", "S", vim.diagnostic.open_float, {buffer=0,
					desc = "View diagnostics information in a floating window"})

      end

      -- Configure every lsp installed and managed by mason
      -- TODO: automate this with a global myServers table
      local myServers = {
        "gopls",
        "golangci_lint_ls",
        "lua_ls",
        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "graphql",
        "texlab",
        "ruff_lsp",
        "clangd",
        "marksman",
      }
      for _, server in ipairs(myServers) do
        lsp[server].setup({
          capabilities = lspCaps,
          on_attach = lspMaps
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
              version = 'LuaJIT'
            },
            diagnostic = {
              -- Get the language server to recognize the `vim` global
              globals = {
                'vim',
                'require'
              }
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false
            }
          }
        }
      })
    end,
  },
}
