return {
  'cbochs/grapple.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  opts = { scope = 'cwd' },

  keys = {
    { '<leader><leader>', '<cmd>Grapple toggle<cr>', desc = 'Grapple Toggle' },
    { '<leader>m', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple open [M]arks window' },
    { '<leader>n', '<cmd>Grapple cycle_tags next<cr>', desc = 'Grapple Cycle [N]ext Tag' },
    { '<leader>p', '<cmd>Grapple cycle_tags prev<cr>', desc = 'Grapple Cycle [P]revious Tag' },
  },

  cond = vim.fn.exists 'g:vscode' == 0,
}
