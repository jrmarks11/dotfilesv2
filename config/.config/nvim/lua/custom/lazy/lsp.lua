return {
  'neovim/nvim-lspconfig',
  ft = { 'elixir', 'lua', 'ruby', 'typescript', 'typescriptreact', 'vue', 'markdown' },
  dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },

  config = function()
    local lspconfig = require 'lspconfig'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('jmarks-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', '<cmd>lua Snacks.picker.lsp_definitions()<cr>', 'Goto Definition')
        map('grr', '<cmd>lua Snacks.picker.lsp_references()<cr>', 'Goto References')
        map('go', '<cmd>lua Snacks.picker.lsp_symbols()<cr>', 'Goto Symbols')
        map('gO', '<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>', 'Goto Symbols')
        map('<C-k>', vim.lsp.buf.hover, 'Hover Documentation')
        map('[[', function()
          Snacks.words.jump(-vim.v.count1)
        end, 'Previous Diagnostic')
        map(']]', function()
          Snacks.words.jump(vim.v.count1)
        end, 'Next Diagnostic')
      end,
    })

    require('mason').setup()
    require('mason-lspconfig').setup {
      automatic_installation = true,
      ensure_installed = {
        'elixirls',
        'lua_ls',
        'vtsls',
        'volar',
      },

      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,

        ['lua_ls'] = function()
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    'vim',
                    'Snacks',
                    'dbg',
                  },
                },
              },
            },
          }
        end,

        ['elixirls'] = function()
          lspconfig.elixirls.setup {
            settings = {
              elixirLS = {
                dialyzerEnabled = true,
                fetchDeps = true,
              },
            },
          }
        end,

        ['volar'] = function()
          lspconfig.volar.setup {
            settings = {
              init_options = {
                vue = {
                  hybridMode = true,
                },
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
        source = 'if_many',
        header = '',
        prefix = '',
      },
    }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
