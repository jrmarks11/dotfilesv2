return {
  'folke/which-key.nvim',
  event = { 'VeryLazy' },

  opts = {
    triggers = {
      { '<auto>', mode = 'nixsotc' },
      { 's',      mode = { 'n', 'v' } },
    },
    win = {
      height = { min = 5, max = 30 }
    },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
