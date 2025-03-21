return {
  'neovim/nvim-lspconfig',
  ft = { 'elixir', 'lua', 'ruby', 'typescript', 'typescriptreact', 'vue', 'markdown' },
  dependencies = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },

  config = function()
    -- local capabilities = require('blink.cmp').get_lsp_capabilities()
    local lspconfig = require 'lspconfig'

    -- lspconfig['lua_ls'].setup { capabilities = capabilities }
    -- lspconfig['vtsls'].setup { capabilities = capabilities }
    -- lspconfig['elixirls'].setup { capabilities = capabilities }

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('jmarks-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', '<cmd>lua Snacks.picker.lsp_definitions()<cr>', 'Goto Definition')
        map('gr', '<cmd>lua Snacks.picker.lsp_references()<cr>', 'Goto References')
        map(',c', vim.lsp.buf.code_action, 'Code Action')
        map(',r', vim.lsp.buf.rename, 'Rename')
        map('<C-k>', vim.lsp.buf.hover, 'Hover Documentation')
        map('[[', function()
          Snacks.words.jump(-vim.v.count1)
        end, 'Previous Diagnostic')
        map(']]', function()
          Snacks.words.jump(vim.v.count1)
        end, 'Next Diagnostic')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.name == 'elixirls' then
          map('<space>p', function()
            local pos = vim.api.nvim_win_get_cursor(0)
            local row = pos[1] - 1
            local col = pos[2]
            client.request_sync('workspace/executeCommand', {
              command = 'manipulatePipes:serverid',
              arguments = { 'toPipe', 'file://' .. vim.api.nvim_buf_get_name(0), row, col },
            }, nil, 0)
          end, 'To Pipe')

          map('<space>P', function()
            local pos = vim.api.nvim_win_get_cursor(0)
            local row = pos[1] - 1
            local col = pos[2]
            client.request_sync('workspace/executeCommand', {
              command = 'manipulatePipes:serverid',
              arguments = { 'fromPipe', 'file://' .. vim.api.nvim_buf_get_name(0), row, col },
            }, nil, 0)
          end, 'From Pipe')
        end
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
