return {
  'echasnovski/mini.ai',
  version = '*',
  event = 'VeryLazy',

  config = function()
    require('mini.ai').setup({
      mappings = {
        around_next = '',
        inside_next = '',
        around_last = '',
        inside_last = '',
        goto_left = '',
        goto_right = '',
      }
    })
  end,
}
