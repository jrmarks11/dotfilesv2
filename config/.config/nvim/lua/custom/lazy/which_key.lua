return {
  'folke/which-key.nvim',
  event = { 'VeryLazy' },

  config = function()
    require('which-key').setup {}
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
