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

    map('n', ',t', ':TestNearest<CR>')
    map('n', ',k', ':TestLast<CR>')
    map('n', ',f', ':TestFile<CR>')
    map('n', ',s', ':TestSuite<CR>')
    map('n', ',b', ':TestVisit<CR>zz')
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
