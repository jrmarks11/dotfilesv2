return {
  'echasnovski/mini.nvim',
  version = false,
  event = 'VeryLazy',

  config = function()
    require('mini.ai').setup()

    require('mini.indentscope').setup {
      draw = {
        animation = require('mini.indentscope').gen_animation.none(),
      },
    }

    require('mini.jump').setup {
      mappings = {
        repeat_jump = '',
      },
    }

    require('mini.splitjoin').setup {
      mappings = {
        toggle = 'ss',
      },
    }

    require('mini.surround').setup()
  end,
}
