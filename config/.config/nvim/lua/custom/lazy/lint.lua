return {
  'mfussenegger/nvim-lint',
  event = 'BufReadPre',

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

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
