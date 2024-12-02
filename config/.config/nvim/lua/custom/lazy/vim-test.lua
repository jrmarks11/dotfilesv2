return {
  'janko-m/vim-test',
  event = { 'VeryLazy' },
  dependencies = { 'jgdavey/tslime.vim', cond = vim.fn.exists 'g:vscode' == 0 },

  config = function()
    local g = vim.g
    local map = vim.keymap.set

    if vim.g.vscode then
      g['test#strategy'] = 'neovim_vscode'
    else
      g['test#preserve_screen'] = 1
      g['test#strategy'] = 'tslime'
      g['tslime_always_current_session'] = 1
      g['tslime_always_current_window'] = 1
    end

    map('n', ',t', ':TestNearest<CR>', { desc = 'Test Nearest' })
    map('n', ',k', ':TestLast<CR>', { desc = 'Test Last' })
    map('n', ',f', ':TestFile<CR>', { desc = 'Test File' })
    map('n', ',s', ':TestSuite<CR>', { desc = 'Test Suite' })
    map('n', ',v', ':TestVisit<CR>zz', { desc = 'Test Visit' })
  end,
}
