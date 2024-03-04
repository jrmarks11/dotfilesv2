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
    'rubocop',
    'elixirls',
    'ruby_ls',
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
  }
})
