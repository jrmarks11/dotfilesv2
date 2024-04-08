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
  }
}
