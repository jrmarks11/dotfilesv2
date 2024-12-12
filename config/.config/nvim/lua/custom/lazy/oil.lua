return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  keys = { { '-', '<CMD>Oil<CR>', { desc = 'Open parent directory file' } } },

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
  end,

  cond = vim.fn.exists 'g:vscode' == 0,
}
