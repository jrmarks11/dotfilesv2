return {
  'janko-m/vim-test',
  event = { 'VeryLazy' },

  config = function()
    local g = vim.g
    local map = vim.keymap.set

    g['test#strategy'] = 'neovim_vscode'

    map('n', ',t', ':TestNearest<CR>', { desc = 'Test Nearest' })
    map('n', ',k', ':TestLast<CR>', { desc = 'Test Last' })
    map('n', ',f', ':TestFile<CR>', { desc = 'Test File' })
    map('n', ',s', ':TestSuite<CR>', { desc = 'Test Suite' })
    map('n', ',v', ':TestVisit<CR>zz', { desc = 'Test Visit' })
  end,
}
