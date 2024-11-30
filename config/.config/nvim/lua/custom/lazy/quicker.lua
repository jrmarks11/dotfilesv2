return {
  'stevearc/quicker.nvim',
  event = 'VeryLazy',

  config = function()
    require('quicker').setup()
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
