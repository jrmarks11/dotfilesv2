return {
  'cbochs/grapple.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  opts = { scope = 'cwd', },

  keys = {
    { 'sm',       '<cmd>Grapple toggle<cr>',          desc = 'Grapple toggle tag' },
    { '<Space>m', '<cmd>Grapple toggle_tags<cr>',     desc = 'Grapple open tags window' },
    { 'sn',       '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple cycle next tag' },
    { 'sp',       '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple cycle previous tag' },
  },

  cond = vim.fn.exists('g:vscode') == 0,
}
