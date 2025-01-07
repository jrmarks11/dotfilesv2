return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    { ']m', '<Plug>(Marks-next)zz', desc = 'Jump to next mark' },
    { '[m', '<Plug>(Marks-prev)zz', desc = 'Jump to previous mark' },
  },
}
