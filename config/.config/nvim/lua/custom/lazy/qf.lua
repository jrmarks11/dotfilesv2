return {
  'romainl/vim-qf',
  event = 'VeryLazy',

  keys = {
    { ',q', [[<Plug>(qf_qf_toggle)]], desc = 'Toggle Quickfix' },
    { ',l', [[<Plug>(qf_loc_toggle)]], desc = 'Toggle Location List' },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
