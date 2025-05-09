return {
  'alexghergh/nvim-tmux-navigation',
  lazy = false,
  opts = {
    disable_when_zoomed = true,
  },

  keys = {
    { '<C-j>h', '<cmd>NvimTmuxNavigateLeft<cr>', mode = { 'n', 'i', 'c', 'x', 't' }, desc = 'Navigate Left' },
    { '<C-j>j', '<cmd>NvimTmuxNavigateDown<cr>', mode = { 'n', 'i', 'c', 'x', 't' }, desc = 'Navigate Down' },
    { '<C-j>k', '<cmd>NvimTmuxNavigateUp<cr>', mode = { 'n', 'i', 'c', 'x', 't' }, desc = 'Navigate Up' },
    { '<C-j>l', '<cmd>NvimTmuxNavigateRight<cr>', mode = { 'n', 'i', 'c', 'x', 't' }, desc = 'Navigate Right' },
  },
}
