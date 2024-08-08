return {
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',

    config = function()
      require('oil').setup {
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name)
            return name == '..'
          end,
        },
      }

      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory file' })
    end,
  },
}
