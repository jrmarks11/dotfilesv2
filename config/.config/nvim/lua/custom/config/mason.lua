local lsp = vim.lsp
local cmp_lsp = require('cmp_nvim_lsp')

local capabilities = vim.tbl_deep_extend(
  'force',
  {},
  lsp.protocol.make_client_capabilities(),
  cmp_lsp.default_capabilities()
)

local lsp_on_attach = function()
  local map = vim.keymap.set
  local opts = { buffer = true }

  map('n', 'gd', lsp.buf.definition, opts)
  map('n', '<C-k>', lsp.buf.hover, opts)
  map('n', 'gr', lsp.buf.references, opts)
end

require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'elixirls',
    'efm',
  },
  handlers = {
    function(server_name) -- default handler (optional)
      require('lspconfig')[server_name].setup {
        on_attach = lsp_on_attach,
        capabilities = capabilities
      }
    end,

    ['lua_ls'] = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup {
        on_attach = lsp_on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' },
            }
          }
        }
      }
    end,

    ['elixirls'] = function()
      local lspconfig = require('lspconfig')
      lspconfig.elixirls.setup {
        on_attach = lsp_on_attach,
        capabilities = capabilities,
        settings = {
          autoBuild = true,
          dialyzerEnabled = false,
          fetchDeps = false,
          enableTestLenses = false,
          suggestSpecs = false,
        }
      }
    end,

    ['efm'] = function()
      local lspconfig = require('lspconfig')
      lspconfig.efm.setup {
        on_attach = lsp_on_attach,
        root_dir = lspconfig.util.root_pattern("mix.exs", ".git", vim.fn.getcwd()),
        capabilities = capabilities,
        init_options = { documentFormatting = true },
        filetypes = { 'elixir' },
        settings = {
          rootMarkers = { '.git/' },
          languages = {
            elixir = {
              {
                lintCommand = 'mix credo suggest --format=flycheck --read-from-stdin',
                lintStdin = true,
                lintFormats = { '%f:%l:%c: %m' }
              }
            }
          }
        }
      }
    end,
  }
})
