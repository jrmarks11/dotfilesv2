return {
  {
    'AndrewRadev/splitjoin.vim',
    event = 'VeryLazy',

    init = function()
      local map = vim.keymap.set

      vim.g.splitjoin_split_mapping = ''
      vim.g.splitjoin_join_mapping = ''
      map('n', 'sj', '<cmd>SplitjoinJoin<cr>', { desc = 'Splitjoin Join Code' })
      map('n', 'sk', '<cmd>SplitjoinSplit<cr>', { desc = 'Splitjoin Split Code' })
    end,
  },
}
