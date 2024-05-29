return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    local errorfmt = '[%t] %. stdin:%l:%c %m, [%t] %. stdin:%l %m'

    lint.linters.credo = {
      cmd = 'mix',
      stdin = true,
      args = { 'credo', 'list', '--format=oneline', '--read-from-stdin' },
      stream = 'stdout',
      ignore_exitcode = true,
      parser = require('lint.parser').from_errorformat(errorfmt, { ['source'] = 'credo' }),
    }

    lint.linters_by_ft = {
      elixir = { 'credo' },
    }

    vim.api.nvim_create_autocmd({ 'BufReadPost', 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
