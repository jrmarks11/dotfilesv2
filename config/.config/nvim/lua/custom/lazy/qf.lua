return {
  'romainl/vim-qf',
  event = 'VeryLazy',

  config = function()
    local map = vim.keymap.set
    map('n', '[q', [[<Plug>(qf_qf_previous)]], { desc = 'Go To Previous [Q]uickfix' })
    map('n', ']q', [[<Plug>(qf_qf_next)]], { desc = 'Go To Next [Q]uickfix' })
    map('n', ',q', [[<Plug>(qf_qf_toggle)]], { desc = 'Toggle [Q]uickfix' })
    map('n', '[l', [[<Plug>(qf_loc_previous)]], { desc = 'Go To Previous [L]ocation List' })
    map('n', ']l', [[<Plug>(qf_loc_next)]], { desc = 'Go To Next [L]ocation List' })
    map('n', ',l', [[<Plug>(qf_loc_toggle)]], { desc = 'Toggle [L]ocation List' })
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
