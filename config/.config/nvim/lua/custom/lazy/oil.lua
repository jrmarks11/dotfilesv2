return {
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',

    config = function()
      require('oil').setup {
        columns = { 'icon' },
        view_options = {
          show_hidden = true,
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory file' })
    end,
  },
}
