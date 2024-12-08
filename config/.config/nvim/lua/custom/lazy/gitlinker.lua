return {
  'linrongbin16/gitlinker.nvim',
  lazy = true,

  opts = {},
  keys = {
    { 'sh', '<cmd>GitLink<cr>', mode = { 'n', 'v' }, desc = 'Yank Git Link' },
    { 'sH', '<cmd>GitLink!<cr>', mode = { 'n', 'v' }, desc = 'Open Git Link' },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
