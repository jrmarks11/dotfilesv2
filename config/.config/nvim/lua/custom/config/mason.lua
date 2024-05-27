local lsp = vim.lsp
local cmp_lsp = require 'cmp_nvim_lsp'

local capabilities =
  vim.tbl_deep_extend('force', {}, lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

local lsp_on_attach = function()
  local map = vim.keymap.set

  map('n', 'gd', lsp.buf.definition, { buffer = true, desc = 'LSP Go to definition' })
  map('n', '<C-k>', lsp.buf.hover, { buffer = true, desc = 'LSP Show hover' })
  map('n', 'gr', lsp.buf.references, { buffer = true, desc = 'LSP Show references' })
  map('n', 'sr', lsp.buf.rename, { buffer = true, desc = 'LSP Rename' })
end

require('mason').setup()

require('mason-lspconfig').setup {
  ensure_installed = {
    'elixirls',
    'emmet_language_server',
    'lua_ls',
    'tsserver',
  },

  handlers = {
    function(server_name) -- default handler (optional)
      require('lspconfig')[server_name].setup {
        on_attach = lsp_on_attach,
        capabilities = capabilities,
      }
    end,

    ['lua_ls'] = function()
      local lspconfig = require 'lspconfig'
      lspconfig.lua_ls.setup {
        on_attach = lsp_on_attach,
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
        on_attach = lsp_on_attach,
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

    ['efm'] = function()
      local lspconfig = require 'lspconfig'

      lspconfig.efm.setup {
        on_attach = lsp_on_attach,
        root_dir = lspconfig.util.root_pattern('mix.exs', '.git', vim.fn.getcwd()),
        capabilities = capabilities,
        init_options = { documentFormatting = true },
        filetypes = { 'elixir', 'ruby' },
        settings = {
          rootMarkers = { '.git/' },
          languages = {
            elixir = {
              {
                lintCommand = 'mix credo suggest --format=flycheck --read-from-stdin',
                lintStdin = true,
                lintFormats = { '%f:%l:%c: %m' },
              },
            },
            ruby = {
              {
                lintCommand = 'rubocop --format emacs --force-exclusion --stdin ${INPUT}',
                lintStdin = true,
                lintFormats = { '%f:%l:%c: %m' },
              },
            },
          },
        },
      }
    end,
  },
}
