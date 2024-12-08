return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },

  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('jmarks-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', vim.lsp.buf.definition, 'Goto Definition')
        map('gr', '<cmd>FzfLua lsp_references<CR>', 'Goto References')
        map(',c', vim.lsp.buf.code_action, 'Code Action')
        map(',r', vim.lsp.buf.rename, 'Rename')
        map('<C-k>', vim.lsp.buf.hover, 'Hover Documentation')
      end,
    })

    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'elixirls',
        'lua_ls',
        'ruby_lsp',
        'ts_ls',
      },

      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,

        ['lua_ls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.lua_ls.setup {
            settings = {
              Lua = { diagnostics = { globals = {
                'vim',
              } } },
            },
          }
        end,

        ['elixirls'] = function()
          local lspconfig = require 'lspconfig'
          lspconfig.elixirls.setup {
            settings = {
              elixirLS = {
                dialyzerEnabled = true,
                fetchDeps = true,
              },
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

  cond = vim.fn.exists 'g:vscode' == 0,
}
