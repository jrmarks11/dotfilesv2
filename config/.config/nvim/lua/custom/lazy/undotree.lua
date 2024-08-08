return {
  'mbbill/undotree',
  event = { 'BufReadPre' },

  config = function()
    local map = vim.keymap.set
    map('n', ',u', ':UndotreeToggle<CR>', { desc = 'Toggle Undo Tree' })
  end,
}
