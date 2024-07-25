return {
  {
    'AndrewRadev/splitjoin.vim',
    event = 'VeryLazy',

    init = function()
      vim.g.splitjoin_split_mapping = ''
      vim.g.splitjoin_join_mapping = ''
      vim.keymap.set('n', 'sj', '<cmd>SplitjoinJoin<cr>', { desc = 'Splitjoin Join Code' })
      vim.keymap.set('n', 'sk', '<cmd>SplitjoinSplit<cr>', { desc = 'Splitjoin Split Code' })
    end,
  },
}
