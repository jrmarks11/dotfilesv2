return {
  'ruifm/gitlinker.nvim',
  event = { 'VeryLazy' },

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local map = vim.keymap.set
    local gitlinker = require 'gitlinker'

    gitlinker.setup { mappings = nil }

    map('n', 'sh', function()
      gitlinker.get_buf_range_url 'n'
    end, { desc = 'Git Hub link for current buffer' })

    map('v', 'sh', function()
      gitlinker.get_buf_range_url 'v'
    end, { desc = 'Git Hub link for current buffer' })
  end,
}
