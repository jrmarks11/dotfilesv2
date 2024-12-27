return {
  'otavioschwanck/arrow.nvim',
  keys = '\\',
  dependencies = { { 'echasnovski/mini.icons' } },

  opts = {
    show_icons = true,
    leader_key = '\\',
    buffer_leader_key = ',m',
    index_keys = 'afhjklwruiop1234',
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
