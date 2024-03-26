return {
  'ruifm/gitlinker.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { 'VeryLazy' },

  config = function()
    require('gitlinker').setup({
      mappings = 'sy',
    })
  end,

}
