return {
  'otavioschwanck/arrow.nvim',
  event = { 'VeryLazy' },

  opts = {
    show_icons = true,
    leader_key = '\\',
    buffer_leader_key = ',m',
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
