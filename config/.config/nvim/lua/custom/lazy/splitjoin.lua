return {
  {
    'AndrewRadev/splitjoin.vim',
    event = 'VeryLazy',

    init = function()
      vim.g.splitjoin_split_mapping = ''
      vim.g.splitjoin_join_mapping = ''
      vim.keymap.set('n', 'sj', '<cmd>SplitjoinJoin<cr>', { desc = '[J]oin' })
      vim.keymap.set('n', 'sk', '<cmd>SplitjoinSplit<cr>', { desc = 'Split [K]' })
    end,
  },
}
