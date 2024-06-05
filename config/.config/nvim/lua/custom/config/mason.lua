local lsp = vim.lsp
local cmp_lsp = require 'cmp_nvim_lsp'

local capabilities =
  vim.tbl_deep_extend('force', {}, lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

require('custom.autocmds.lsp')
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
    function(server_name) -- default handler (optional)
      require('lspconfig')[server_name].setup {
        capabilities = capabilities,
      }
    end,

    ['lua_ls'] = function()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
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
        capabilities = capabilities,
        settings = {
          autoBuild = true,
          dialyzerEnabled = true,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        },
      }
    end,
  },
}
