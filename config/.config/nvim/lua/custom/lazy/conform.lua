return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },

  config = function()
    local conform = require('conform')
    conform.setup({
      formatters_by_ft = {
        css = { 'prettier' },
        elixir = { 'mix' },
        eruby = { 'erb_format' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        markdown = { 'prettier' },
        python = { 'black' },
        ruby = { 'rubocop' },
        scss = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        yaml = { 'prettier' },
        vue = { 'prettier' },
      },
    })

    vim.keymap.set('n', ',,', function()
      conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
    end, { silent = true, desc = 'Format buffer' })
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
