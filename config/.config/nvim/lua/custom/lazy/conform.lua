return {
  'stevearc/conform.nvim',
  config = function()
    if vim.opt.diff:get() then
      return
    end
    local conform = require('conform')
    local map = vim.keymap.set
    conform.setup({
      formatters_by_ft = {
        css = { 'prettier' },
        eruby = {'erb_format'},
        html = { 'prettier' },
        javascript = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        markdown = { 'prettier' },
        ruby = { 'rubocop' },
        scss = { 'prettier' },
        typescript = { 'prettier' },
        yaml = { 'prettier' },
      },
    })

    map('n', ',,', function()
      conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
    end, { silent = true })
  end,
}
