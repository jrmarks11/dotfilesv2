return {
  'janko-m/vim-test',
  dependencies = { { 'preservim/vimux', cond = vim.fn.exists 'g:vscode' == 0 } },
  keys = {
    { ',t', ':TestNearest<CR>', desc = 'Test Nearest', mode = { 'n', 'x' } },
    { ',k', ':TestLast<CR>', desc = 'Test Last', mode = { 'n', 'x' } },
    { ',f', ':TestFile<CR>', desc = 'Test File', mode = { 'n', 'x' } },
    { ',s', ':TestSuite<CR>', desc = 'Test Suite', mode = { 'n', 'x' } },
    { ',v', ':TestVisit<CR>zz', desc = 'Test Visit', mode = { 'n', 'x' } },
  },
  ft = { 'elixir' },

  init = function()
    local g = vim.g

    if vim.g.vscode then
      g['test#strategy'] = 'neovim_vscode'
    else
      g['test#preserve_screen'] = 1
      g['test#strategy'] = 'vimux'
    end
  end,
}
