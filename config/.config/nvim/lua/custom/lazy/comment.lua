return {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',

  config = function()
    require('Comment').setup()
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
