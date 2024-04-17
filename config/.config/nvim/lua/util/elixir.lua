local M = {}

function M.run_debug_test()
  local g = vim.g

  local executable = g['test#elixir#exunit#executable']
  g['test#elixir#exunit#executable'] = 'iex -S mix test'
  vim.cmd('TestNearest --trace')
  vim.cmd('wincmd l')
  g['test#elixir#exunit#executable'] = executable
end

function M.run_watch_test()
  local g = vim.g

  local executable = g['test#elixir#exunit#executable']
  g['test#elixir#exunit#executable'] = 'mix test.watch'
  vim.cmd('TestFile')
  g['test#elixir#exunit#executable'] = executable
end

return M
