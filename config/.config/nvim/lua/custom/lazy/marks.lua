return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  opts = {}, -- Pass plugin options here
  keys = {
    { 'n', ']m', '<Plug>(Marks-next)zz', desc = 'Jump to next mark' },
    { 'n', '[m', '<Plug>(Marks-prev)zz', desc = 'Jump to previous mark' },
  },
}
