return {
  'janko-m/vim-test',
  event = { 'VeryLazy' },
  dependencies = { 'jgdavey/tslime.vim' },

  config = function()
    local g = vim.g
    local map = vim.keymap.set

    g['test#preserve_screen'] = 1
    g['test#strategy'] = 'tslime'
    g['tslime_always_current_session'] = 1
    g['tslime_always_current_window'] = 1

    map('n', ',t', ':TestNearest<CR>', { desc = '[T]est Nearest' })
    map('n', ',k', ':TestLast<CR>', { desc = 'Test [L]ast' })
    map('n', ',f', ':TestFile<CR>', { desc = 'Test [F]ile' })
    map('n', ',s', ':TestSuite<CR>', { desc = 'Test [S]uite' })
    map('n', ',v', ':TestVisit<CR>zz', { desc = 'Test [V]isit' })
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
