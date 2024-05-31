return {
  'cbochs/grapple.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  opts = { scope = 'cwd' },

  keys = {
    { 'sm', '<cmd>Grapple toggle<cr>', desc = 'Grapple Toggle [M]ark' },
    { '<leader>m', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open [M]arks window' },
    { 'sn', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple Cycle [N]ext Tag' },
    { 'sp', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple Cycle [P]revious Tag' },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
