return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  event = { 'VeryLazy' },

  dependencies = {
    'nvim-lua/plenary.nvim',
    'smartpde/telescope-recent-files',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
  },

  config = function()
    local telescope = require('telescope')

    require('custom.config.telescope')
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')
    telescope.load_extension('recent_files')
    -- require('custom.keybindings.telescope')
  end,

  cond = vim.fn.exists('g:vscode') == 0
}
