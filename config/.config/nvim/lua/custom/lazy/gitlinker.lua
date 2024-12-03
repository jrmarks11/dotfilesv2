return {
  'linrongbin16/gitlinker.nvim',
  event = 'VeryLazy',

  cmd = 'GitLink',
  opts = {},
  keys = {
    { 'sh', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Yank Git Link' },
    { 'sH', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open Git Link' },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
