return {
  'linrongbin16/gitlinker.nvim',
  event = 'VeryLazy',

  cmd = 'GitLink',
  opts = {},
  keys = {
    { 'sh', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Yank git link' },
    { 'sH', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open git link' },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
