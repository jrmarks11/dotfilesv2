return {
  'janko-m/vim-test',
  dependencies = { { 'preservim/vimux', cond = vim.fn.exists 'g:vscode' == 0 } },
  keys = {
    { ',t', ':TestNearest<CR>', desc = 'Test Nearest' },
    { ',k', ':TestLast<CR>', desc = 'Test Last' },
    { ',f', ':TestFile<CR>', desc = 'Test File' },
    { ',s', ':TestSuite<CR>', desc = 'Test Suite' },
    { ',v', ':TestVisit<CR>zz', desc = 'Test Visit' },
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
