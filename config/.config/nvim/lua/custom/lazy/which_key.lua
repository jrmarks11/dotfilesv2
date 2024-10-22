return {
  'folke/which-key.nvim',
  event = { 'VeryLazy' },

  opts = {
    triggers = {
      { '<auto>', mode = 'nixsotc' },
      { 's',      mode = { 'n', 'v' } },
    },
  },
}
