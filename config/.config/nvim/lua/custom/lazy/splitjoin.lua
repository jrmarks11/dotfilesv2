return {
  {
    'echasnovski/mini.splitjoin',
    version = '*';
    event = 'VeryLazy',

    config = function()
      require('mini.splitjoin').setup({
        mappings = {
          toggle = 'ss',
        }
      })
    end
  },
  {
    'AndrewRadev/splitjoin.vim',
    event = 'VeryLazy',

    init = function()
      vim.keymap.set('n', 'sj', '<cmd>SplitjoinJoin<cr>')
      vim.keymap.set('n', 'sk', '<cmd>SplitjoinSplit<cr>')
    end
  }
}
