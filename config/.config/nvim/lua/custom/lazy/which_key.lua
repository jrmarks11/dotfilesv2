return {
  'folke/which-key.nvim',
  event = { 'VeryLazy' },
  opts = {},
  keys = {
    {
      's',
      function()
        require('which-key').show { keys = 's', loop = true }
      end,
      desc = 'Show which-key for [s]',
    },
  },
}
