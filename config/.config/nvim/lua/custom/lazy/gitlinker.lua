return {
  'ruifm/gitlinker.nvim',
  event = { 'VeryLazy' },
  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    require('gitlinker').setup { mappings = 'sh' }
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
