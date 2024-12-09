return {
  'mfussenegger/nvim-lint',
  ft = { 'elixir', 'markdown', 'sql', 'yaml' },

  config = function()
    local lint = require 'lint'

    lint.linters.credo.args = { 'credo', 'list', '--format=oneline', '--read-from-stdin' }
    lint.linters.sqlfluff.args = { 'lint', '--format=json', '--dialect=postgres' }

    lint.linters_by_ft = {
      elixir = { 'credo' },
      yaml = { 'yamllint' },
      markdown = { 'markdownlint' },
      sql = { 'sqlfluff' },
    }

    local debounce_timer = nil

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost', 'FileType' }, {
      callback = function()
        if debounce_timer then
          debounce_timer:stop()
        end

        debounce_timer = vim.defer_fn(function()
          require('lint').try_lint()
        end, 200)
      end,
    })
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
