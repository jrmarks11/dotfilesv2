return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      '<space><space>',
      mode = { 'n', 'x' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash Search',
    },

    {
      'r',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash Search',
    },
  },
}
