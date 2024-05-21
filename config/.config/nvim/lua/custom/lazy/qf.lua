return {
  'romainl/vim-qf',
  event = 'VeryLazy',

  config = function()
    local map = vim.keymap.set
    map('n', '[q', [[<Plug>(qf_qf_previous)]], { desc = 'Go to previous quickfix' })
    map('n', ']q', [[<Plug>(qf_qf_next)]], { desc = 'Go to next quickfix' })
    map('n', ',q', [[<Plug>(qf_qf_toggle)]], { desc = 'Toggle quickfix' })
    map('n', '[l', [[<Plug>(qf_loc_previous)]], { desc = 'Go to previous location list' })
    map('n', ']l', [[<Plug>(qf_loc_next)]], { desc = 'Go to next location list' })
    map('n', ',l', [[<Plug>(qf_loc_toggle)]], { desc = 'Toggle location list' })
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
