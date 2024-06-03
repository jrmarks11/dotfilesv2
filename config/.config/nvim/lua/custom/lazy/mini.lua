return {
  'echasnovski/mini.nvim',
  version = false,
  event = 'VeryLazy',

  config = function()
    require('mini.ai').setup()
    require('mini.indentscope').setup()

    require('mini.splitjoin').setup {
      mappings = {
        toggle = 'ss',
      },
    }

    require('mini.surround').setup()
  end,
}
