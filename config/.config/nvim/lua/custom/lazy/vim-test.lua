return {
  'janko-m/vim-test',
  dependencies = { 'preservim/vimux' },
  keys = {
    { ',t', ':TestNearest<CR>', desc = 'Test Nearest', mode = { 'n', 'x' } },
    { ',k', ':TestLast<CR>', desc = 'Test Last', mode = { 'n', 'x' } },
    { ',f', ':TestFile<CR>', desc = 'Test File', mode = { 'n', 'x' } },
    { ',s', ':TestSuite<CR>', desc = 'Test Suite', mode = { 'n', 'x' } },
    { ',v', ':TestVisit<CR>', desc = 'Test Visit', mode = { 'n', 'x' } },
  },
  ft = { 'elixir' },

  init = function()
    local g = vim.g
    g['test#preserve_screen'] = 1
    g['test#strategy'] = 'vimux'
  end,
}
