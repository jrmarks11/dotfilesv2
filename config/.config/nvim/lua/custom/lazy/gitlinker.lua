return {
  'ruifm/gitlinker.nvim',
  event = { 'VeryLazy' },

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function()
    local map = vim.keymap.set
    require('gitlinker').setup {
      mappings = nil,
    }

    map('n', 'sh', function()
      require('gitlinker').get_buf_range_url 'n'
    end, { desc = 'Git[H]ub link for current buffer' })

    map('v', 'sh', function()
      require('gitlinker').get_buf_range_url 'v'
    end, { desc = 'Git[H]ub link for current buffer' })
  end,
}
