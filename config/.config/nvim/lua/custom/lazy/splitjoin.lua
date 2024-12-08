return {
  'AndrewRadev/splitjoin.vim',

  lazy = true,
  keys = {
    { 'sj', '<cmd>SplitjoinJoin<CR>', desc = 'Splitjoin Join Code' },
    { 'sk', '<cmd>SplitjoinSplit<CR>', desc = 'Splitjoin Split Code' },
  },


  init = function()
    vim.g.splitjoin_split_mapping = ''
    vim.g.splitjoin_join_mapping = ''
  end,
}
