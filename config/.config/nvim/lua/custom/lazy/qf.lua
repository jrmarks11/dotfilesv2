return {
  'romainl/vim-qf',
  event = 'VeryLazy',

  config = function()
    local map = vim.keymap.set
    map('n', '[q', [[<Plug>(qf_qf_previous)zz]], { desc = 'Go To Previous Quickfix' })
    map('n', ']q', [[<Plug>(qf_qf_next)zz]], { desc = 'Go To Next Quickfix' })
    map('n', ',q', [[<Plug>(qf_qf_toggle)]], { desc = 'Toggle Quickfix' })
    map('n', '[l', [[<Plug>(qf_loc_previous)zz]], { desc = 'Go To Previous Location List' })
    map('n', ']l', [[<Plug>(qf_loc_next)zz]], { desc = 'Go To Next Location List' })
    map('n', ',l', [[<Plug>(qf_loc_toggle)]], { desc = 'Toggle Location List' })
  end,
}
