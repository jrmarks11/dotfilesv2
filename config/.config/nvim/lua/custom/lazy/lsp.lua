return {
  'neovim/nvim-lspconfig',
  ft = { 'elixir', 'lua', 'typescript', 'typescriptreact', 'vue', 'ruby'},
  dependencies = { 'mason-org/mason.nvim', 'mason-org/mason-lspconfig.nvim' },

  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    local ok, blink = pcall(require, 'blink.cmp')
    if ok then
      capabilities = vim.tbl_deep_extend('force', capabilities, blink.get_lsp_capabilities())
    end

    vim.lsp.config('*', { capabilities = capabilities })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('jmarks-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        map('gd', '<cmd>lua Snacks.picker.lsp_definitions()<cr>', 'Goto Definition')
        map('grr', '<cmd>lua Snacks.picker.lsp_references()<cr>', 'Goto References')
        map('go', '<cmd>lua Snacks.picker.lsp_symbols()<cr>', 'Goto Symbols')
        map('gO', '<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>', 'Goto Workspace Symbols')
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
      ensure_installed = {
        'elixirls',
        'lua_ls',
        'vtsls',
        'ruby_lsp',
      },
      automatic_enable = true,
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
}
