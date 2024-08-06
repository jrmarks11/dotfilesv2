return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },

  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  config = function()
    require 'custom.autocmds.lsp'
    require('mason').setup()

    require('mason-lspconfig').setup {
      ensure_installed = {
        'elixirls',
        'emmet_language_server',
        'lua_ls',
        'ruby_lsp',
        'tsserver',
      },

      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,

        ['lua_ls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
                },
              },
            },
          }
        end,

        ['elixirls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.elixirls.setup {
            settings = {
              dialyzerEnabled = true,
              fetchDeps = true,
              trace = { server = "verbose" }
            },
          }
        end,
      },
    }

    vim.diagnostic.config {
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    }
  end,
}
