return {
  'rgroli/other.nvim',
  ft = { 'elixir', 'ruby' },

  config = function()
    vim.keymap.set({ 'n', 'x' }, '<space>a', ':Other<CR>', { silent = true, desc = 'Go To Alternate File' })

    require('other-nvim').setup {
      mappings = {
        'rails',
        'elixir',
      },
    }
  end,
}
