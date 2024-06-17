return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },

  config = function()
    local conform = require 'conform'
    conform.setup {
      formatters = {
        mix = {
          command = 'mix',
          args = { 'format', '--stdin-filename', '$FILENAME', '-' },
          cwd = require('conform.util').root_file { 'mix.exs' },
        },
      },

      formatters_by_ft = {
        css = { 'prettier' },
        elixir = { 'mix' },
        eruby = { 'erb_format' },
        graphql = { 'prettier' },
        html = { 'prettier' },
        javascript = { 'prettier' },
        javascriptreact = { 'prettier' },
        json = { 'prettier' },
        jsonc = { 'prettier' },
        lua = { 'stylua' },
        markdown = { 'prettier' },
        python = { 'black' },
        ruby = { 'rubocop' },
        scss = { 'prettier' },
        sh = { 'beautysh' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        yaml = { 'prettier' },
        vue = { 'prettier' },
        zsh = { 'beautysh' },
      },
    }

    vim.keymap.set('n', ',,', function()
      conform.format { async = true, lsp_fallback = true, timeout_ms = 8000 }
    end, { silent = true, desc = 'Format buffer' })
  end,
}
