return {
  'stevearc/conform.nvim',
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    if vim.opt.diff:get() then
      return
    end

    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        css = { 'prettier' },
        eruby = { 'erb_format' },
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

    vim.keymap.set('n', ',,', function()
      conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
    end, { silent = true })
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
