return {
  'janko-m/vim-test',
  dependencies = { 'jgdavey/tslime.vim' },

  config = function()
    local g = vim.g
    local map = vim.keymap.set

    g['test#preserve_screen'] = 1
    g['test#strategy'] = 'tslime'

    map('n', ',t', ':TestNearest<CR>')
    map('n', ',k', ':TestLast<CR>')
    map('n', ',f', ':TestFile<CR>')
    map('n', ',s', ':TestSuite<CR>')
    map('n', ',b', ':TestVisit<CR>zz')
  end,
  cond = vim.fn.exists('g:vscode') == 0
}
